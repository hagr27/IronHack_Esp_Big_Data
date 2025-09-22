# Motor: driver asíncrono para conectarse con MongoDB desde Python
import motor.motor_asyncio

# Manejo de fechas y tiempos (útil para timestamps y validaciones temporales)
from datetime import date, datetime
# Tipado opcional y listas para mejorar la legibilidad de los modelos y funciones
from typing import List, Optional

# FastAPI framework principal para construir la API
from fastapi import Depends, FastAPI, HTTPException
# Pydantic se usa para definir modelos de datos y validación automática
from pydantic import BaseModel
# SQLAlchemy: ORM para interactuar con bases de datos SQL
from sqlalchemy import Column, Date, DateTime, Integer, String, create_engine
from sqlalchemy.orm import Session, declarative_base, sessionmaker

# Motor: driver asíncrono para conectarse con MongoDB desde Python
import motor.motor_asyncio

# -----------------------------
# PostgreSQL Configuration
# -----------------------------
POSTGRES_USER = "postgres"
POSTGRES_PASSWORD = "postgres"
POSTGRES_DB = "db_biblioteca"
POSTGRES_HOST = "localhost"
POSTGRES_PORT = 5432

SQLALCHEMY_DATABASE_URL = f"postgresql://{POSTGRES_USER}:{POSTGRES_PASSWORD}@{POSTGRES_HOST}:{POSTGRES_PORT}/{POSTGRES_DB}"

engine = create_engine(SQLALCHEMY_DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# -----------------------------
# MongoDB Configuration
# -----------------------------
MONGO_URI = "mongodb://localhost:27017"
mongo_client = motor.motor_asyncio.AsyncIOMotorClient(MONGO_URI)
mongo_db = mongo_client["mydb"]

# -----------------------------
# Pydantic Models
# -----------------------------
class UsuarioMongo(BaseModel):
    usuario_alias: str
    nombre: Optional[str]
    apellido_1: Optional[str]
    apellido_2: Optional[str]
    mail: Optional[str]

class Libro(Base):
    __tablename__ = "libro"
    id_libro = Column(Integer, primary_key=True, index=True)
    titulo = Column(String(100))
    fecha_publicacion = Column(Date)
    paginas = Column(Integer)
    genero_id_genero = Column(Integer)

class Prestamo(Base):
    __tablename__ = "prestamo"
    id_prestamo = Column(Integer, primary_key=True, index=True)
    usuario_alias = Column(String(50))  # Alias del usuario en MongoDB
    id_libro = Column(Integer)           # ID del libro en PostgreSQL
    fecha_solicitud = Column(DateTime)
    fecha_prestamo = Column(DateTime)
    fecha_devolucion = Column(DateTime)

class LibroResponse(BaseModel):
    id_libro: int
    titulo: str
    fecha_publicacion: date
    paginas: int
    genero_id_genero: int

# -----------------------------
# FastAPI App
# -----------------------------
app = FastAPI(
    title="API Biblioteca ABC",
    description="""Modernizando la Gestión de Datos para Bibliotecas Pequeñas. \n
    Autores: Alejandro Gerena \n
             Sara Gonzales \n 
             Nathaly Enriquez""",
    version="1.0.0"
)

# Crear tablas PostgreSQL al iniciar
Base.metadata.create_all(bind=engine)

# -----------------------------
# Usuarios MongoDB
# -----------------------------
@app.post("/usuarios", response_model=UsuarioMongo)
async def create_usuario(usuario: UsuarioMongo):
    existing = await mongo_db.usuario.find_one({"usuario_alias": usuario.usuario_alias})
    if existing:
        raise HTTPException(status_code=400, detail="Usuario ya existe")
    await mongo_db.usuario.insert_one(usuario.dict())
    return usuario

@app.get("/usuarios", response_model=List[UsuarioMongo])
async def get_usuarios():
    usuarios = []
    cursor = mongo_db.usuario.find()
    async for doc in cursor:
        doc.pop("_id", None)  # Eliminar _id de MongoDB
        usuarios.append(doc)
    return usuarios

# -----------------------------
# Libros PostgreSQL
# -----------------------------
@app.get("/libros", response_model=List[LibroResponse])
def get_libros(db: Session = Depends(get_db)):
    libros = db.query(Libro).all()
    return libros

# -----------------------------
# Libros prestados por usuario
# -----------------------------
@app.get("/usuarios/{usuario_alias}/libros", response_model=List[LibroResponse])
async def get_libros_usuario(usuario_alias: str, db: Session = Depends(get_db)):
    usuario = await mongo_db.usuario.find_one({"usuario_alias": usuario_alias})
    if not usuario:
        raise HTTPException(status_code=404, detail="Usuario no encontrado")

    prestamos = db.query(Prestamo).filter(Prestamo.usuario_alias == usuario_alias).all()
    if not prestamos:
        return []

    libros_ids = [p.id_libro for p in prestamos]
    libros = db.query(Libro).filter(Libro.id_libro.in_(libros_ids)).all()

    return [
        LibroResponse(
            id_libro=libro.id_libro,
            titulo=libro.titulo,
            fecha_publicacion=libro.fecha_publicacion,
            paginas=libro.paginas,
            genero_id_genero=libro.genero_id_genero
        )
        for libro in libros
    ]
