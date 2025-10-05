# utils/data_utils.py

import os
import re
from typing import List
import pandas as pd
from utils.data_cleaning import normalize_text
from utils.constants import NORTH_COUNTRIES

def load_data_model(file_path: str) -> pd.DataFrame | None:
    """
    Carga un CSV desde la ruta indicada, probando múltiples codificaciones
    y normalizando texto.
    Devuelve un DataFrame o None si falla.
    """
    encodings_to_try = ['utf-8', 'latin1', 'iso-8859-1', 'cp1252']

    if not os.path.exists(file_path):
        print(f"El archivo {file_path} no existe.")
        return None

    for enc in encodings_to_try:
        try:
            data = pd.read_csv(file_path, encoding=enc)
            # Normalizar texto si es necesario
            data = data.applymap(lambda x: x.strip() if isinstance(x, str) else x)
            return data
        except Exception as e:
            print(f"No se pudo leer con codificación {enc}: {e}")
    
    print("No se pudo cargar el archivo con las codificaciones probadas.")
    return None

def load_data(filename: str) -> pd.DataFrame | None:
    """
    Carga un CSV desde '../data/raw', probando múltiples codificaciones
    y normalizando texto.
    """
    encodings_to_try = ['utf-8', 'latin1', 'iso-8859-1', 'cp1252']

    base_dir = os.getcwd()
    file_path = os.path.join(base_dir, "..", "data", "raw", filename)

    if not os.path.exists(file_path):
        print(f"El archivo {file_path} no existe.")
        return None

    # Intentar cargar con varias codificaciones
    for enc in encodings_to_try:
        try:
            data = pd.read_csv(file_path, encoding=enc)
            print(f">>> Archivo cargado con codificación '{enc}'")
            break
        except UnicodeDecodeError:
            continue
    else:
        print(f"No se pudo cargar el archivo {filename} con las codificaciones probadas.")
        return None

    # Normalizar columnas de texto
    for col in data.select_dtypes(include='object'):
        data[col] = data[col].apply(normalize_text)

    print(f">>> '{filename}' cargado. Filas: {data.shape[0]}, Columnas: {data.shape[1]}")
    return data


def get_season(mes, pais):
    """
    Retorna la estación como número según el mes y el país.
    1 = Primavera, 2 = Verano, 3 = Otoño, 4 = Invierno
    """
    hemisferio = "norte" if pais.upper() in NORTH_COUNTRIES else "sur"

    if hemisferio == "norte":
        estaciones = {
            1: (3, 5),    # Primavera: marzo a mayo
            2: (6, 8),    # Verano: junio a agosto
            3: (9, 11),   # Otoño: septiembre a noviembre
            4: (12, 2)    # Invierno: diciembre a febrero
        }
    else:  # hemisferio sur
        estaciones = {
            1: (9, 11),   # septiembre a noviembre
            2: (12, 2),   # Verano: diciembre a febrero
            3: (3, 5),    # Otoño: marzo a mayo
            4: (6, 8)     # Invierno: junio a agosto
        }

    for num, (start, end) in estaciones.items():
        if start <= end:  # rango normal
            if start <= mes <= end:
                return int(num)
        else:  # rango que cruza año (ej. 12 a 2)
            if mes >= start or mes <= end:
                return int(num)

    return 0


def get_column_types(df: pd.DataFrame, verbose: bool = True) -> tuple[list[str], list[str]]:
    """
    Devuelve las columnas numéricas y categóricas de un DataFrame.

    """
    num_cols = df.select_dtypes(include=["int64", "float64"]).columns.tolist()
    cat_cols = df.select_dtypes(include=["object"]).columns.tolist()
    
    if verbose:
        print("Numéricas:", num_cols)
        print("Categóricas:", cat_cols)
    
    return num_cols, cat_cols

def extract_month_to_string(texto):
    """
    Convierte cualquier carácter que no sea punto en punto,
    luego extrae el mes de un texto con formato 'YYYY.MM.DD'.
    Retorna mes entre 1-12 o 0 si no es válido.
    """
    REGEX_DATE_VALID = r"\d{4}\.(\d{2})\.\d{2}"

    if pd.isna(texto):
        return 0

    # Patrón: 4 dígitos, punto, 2 dígitos (mes), punto, 2 dígitos (día)
    match = re.match(REGEX_DATE_VALID, texto)
    
    if match:
        mes = int(match.group(1))
        if 1 <= mes <= 12:
            return mes

    # Si no se encontró un mes válido, devolver 0
    return 0

def get_month_numeric(row):
    """
    Extrae el mes válido (1-12) desde 'Case_Number_filled'.
    Si no encuentra un mes válido, intenta con 'Case_Number.1_filled'.
    Si ninguno es válido, retorna 0.
    """
    mes1 = extract_month_to_string(row["Case_Number_filled"])
    if 1 <= mes1 <= 12:
        return mes1

    mes2 = extract_month_to_string(row["Case_Number.1_filled"])
    if 1 <= mes2 <= 12:
        return mes2

    return 0


def save_selected_columns_csv(df: pd.DataFrame, columns: List[str], filename: str, folder: str = "processed") -> str:
    """
    Guarda columnas seleccionadas de un DataFrame como CSV en la carpeta indicada.
    """
    # Construir ruta
    base_dir = os.path.abspath(os.getcwd())
    file_path = os.path.join(base_dir, "..", "data", folder, filename)

    # Guardar CSV con solo las columnas seleccionadas
    df[columns].to_csv(file_path, index=False)

    return os.path.normpath(file_path)


def predict_shark_attack(clf, registro, encoders=None, scaler=None):
    """
    Predice si un registro de tiburón es peligroso.
    
    Args:
        clf: Modelo entrenado.
        registro: DataFrame de un registro (1 fila).
        encoders: Diccionario con LabelEncoders para variables categóricas.
        scaler: Escalador usado en entrenamiento (si aplica).
    
    Returns:
        Predicción (texto) y probabilidad.
    """
    X = registro.copy()

    # 1️⃣ Codificar variables categóricas
    if encoders:
        for col, le in encoders.items():
            X[col] = le.transform(X[col])
    
    # 2️⃣ Escalar variables numéricas
    if scaler:
        X_scaled = scaler.transform(X)
    else:
        X_scaled = X

    # 3️⃣ Predicción
    pred = clf.predict(X_scaled)[0]
    prob = clf.predict_proba(X_scaled)[0]

    # 4️⃣ Resultado legible
    resultado = "Peligro" if pred == 1 else "No peligro"
    
    return resultado, prob
