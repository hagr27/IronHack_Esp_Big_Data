# utils/data_cleaning.py

import unicodedata
import re
import pandas as pd
import numpy as np
import missingno as msno  # Para visualizar valores faltantes
import matplotlib.pyplot as plt
from typing import Literal
from utils.constants import ACTIVITY_CORRECTIONS, ACTIVITY_MAPPING, SPECIES_CORRECTIONS, SPECIES_MAPPING, RISK_MAPPING


def normalize_text(texto: str) -> str:
    """
    Normaliza texto: elimina acentos, caracteres extraños y espacios redundantes.
    """
    if not isinstance(texto, str):
        return texto

    # Intentar decodificar restos de codificación mal interpretada
    try: 
        texto = texto.encode('latin1').decode('utf-8', errors='ignore')
    except:
        pass

    # Normalizar Unicode para eliminar acentos
    texto = unicodedata.normalize('NFKD', texto)
    texto = ''.join(c for c in texto if not unicodedata.combining(c))

    # Reemplazar caracteres problemáticos comunes
    texto = texto.replace('Â', '').replace('Ì', '').replace('´', '').replace('`', '')
    texto = texto.replace("’", "'").replace("‘", "'")  # unificar apostrofes

    # Quitar comas o puntos al final
    texto = texto.rstrip(',;:')

    # Convertir a minúsculas y limpiar espacios
    texto = re.sub(r'\s+', ' ', texto).strip().lower()

    return texto


def get_missing_values(df: pd.DataFrame) -> pd.DataFrame:
    """
    Carga un DataFrame de pandas y genera informe de datos perdidos.
    """
    n_cases = df.shape[0]
    summary = pd.DataFrame({
        'variable': df.columns,
        'n_cases': n_cases,
        'n_missing': df.isna().sum().values,
        'pct_missing': (df.isna().sum() / n_cases * 100)
    })
    return summary.sort_values(by = 'n_missing', ascending = False)


def plot_missing_data(df: pd.DataFrame, figsize_bar=(12,5), figsize_matrix=(12,5)):
    """
    Genera gráficos de valores faltantes de un DataFrame usando Missingno:
    - Bar chart
    - Matrix
    """

    # Gráfico de barras
    plt.figure(figsize=figsize_bar)
    msno.bar(df)
    plt.show()

    # Gráfico de matriz
    plt.figure(figsize=figsize_matrix)
    msno.matrix(df)
    plt.show()


def remove_duplicates(
    df: pd.DataFrame,
    subset=None,
    keep: Literal['first', 'last', False] = 'first',
    verbose: bool = True
) -> pd.DataFrame:
    """
    Elimina duplicados de un DataFrame y muestra resumen antes y después.
    """
    if verbose:
        print("Antes:", df.shape)
        print("Duplicados encontrados:", df.duplicated(subset=subset).sum())
    
    df_ready = df.drop_duplicates(subset=subset, keep=keep)
    
    if verbose:
        print("Después:", df_ready.shape)
        print("Duplicados restantes:", df_ready.duplicated(subset=subset).sum())
    
    return df_ready


def normalize_target(value):
    v = str(value).strip().upper()  # quitamos espacios y pasamos a mayúscula
    if v == "Y":
        return 1
    elif v == "N":
        return 0
    else:
        return np.nan  # opcional: marcar como faltante


def drop_na_subset(df: pd.DataFrame, subset: list[str], verbose: bool = True) -> pd.DataFrame:
    """
    Elimina filas con valores faltantes en columnas específicas y muestra resumen antes y después.
    """
    if verbose:
        print("Antes:", df.shape)
    
    df_clean = df.dropna(subset=subset)
    
    if verbose:
        print("Después:", df_clean.shape)
    
    return df_clean


def normalize_date(texto):
    """
    Limpia una cadena de texto que representa una fecha en formato 'YYYY.MM.DD'.
    Si el día es '00', lo reemplaza por '01'. Si faltan o sobran caracteres, lo corrige.
    """
    if pd.isna(texto):
        return pd.NA
    
    # Mantener solo números y puntos
    texto = re.sub(r"[^0-9]", ".", str(texto).strip())
    
    # Separar por puntos
    partes = texto.split(".")
    
    # Asegurar que siempre tengamos [YYYY, MM, DD]
    if len(partes) < 3:
        return pd.NA
    
    anio, mes, dia = partes[:3]  # Tomar solo los tres primeros
    
    # Normalizar
    anio = anio.zfill(4)
    mes = mes.zfill(2) if mes else "01"
    dia = dia.zfill(2) if dia else "01"
    
    # Si el día es "00" → corregir a "01"
    if dia == "00":
        dia = "01"
    # Si el mes es "00" → corregir a "01"
    if mes == "00":
        mes = "01"
    
    return f"{anio}.{mes}.{dia}"


def clean_country_column(df: pd.DataFrame, column_name: str = "Country", new_column_name: str = "Country_filled") -> pd.DataFrame:
    """
    Limpia y normaliza una columna de países:
    - Convierte a string
    - Quita espacios extra
    - Pasa a mayúsculas
    - Quita caracteres especiales
    - Normaliza espacios
    """
    df[new_column_name] = (
        df[column_name]
        .astype(str)
        .str.strip()
        .str.upper()
        .str.replace(r"[^\w\s&/-]", "", regex=True)
        .str.replace(r"\s+", " ", regex=True)
    )
    return df


def clean_text(texto: str) -> str:
    if not isinstance(texto, str):
        return texto

    texto = texto.strip()
    texto = unicodedata.normalize('NFKD', texto)
    texto = ''.join(c for c in texto if not unicodedata.combining(c))

    # Reemplazo de caracteres raros o confusos
    replacements = {
        'Â':'', 'Ì':'', "’":"'", "‘":"'", "`":"", "´":"", "–":"-", "—":"-"
    }
    for old, new in replacements.items():
        texto = texto.replace(old, new)

    texto = re.sub(r'[^\w\s\-/&\(\)\',.]', '', texto)
    texto = re.sub(r'\s+', ' ', texto).strip().lower()
    texto = texto.rstrip(",;:")

    corrections = {
        "bwgacaoia": "bwagaoia",
        "abau subdistrict,central province": "abau subdistrict, central province",
        "st. gilles": "saint-gilles",
        "st. leu": "saint-leu",
        "vavaâ’u": "vava'u",
        "balnerio cambori": "balneario camboriu",
        "cdiz": "cadiz",
        "corts": "cortes",
        "cte d'azur": "cote d'azur",
        "dtang-sal": "d'etang-sale",
        "l' etang sal-les-bains": "l'etang-sale-les-bains",
        "eastern catalona": "eastern catalonia",
        "guerrrero": "guerrero",
        "khnh ha province": "khanh hoa province",
        "westerm australia": "western australia",
    }
    return corrections.get(texto, texto)


# Función para asignar categorías
def map_activity_to_category(activity):
    if pd.isna(activity) or str(activity).strip() == "":
        return "Unknown"
    
    act = str(activity).lower().strip()
    
    # Aplicar correcciones
    for wrong, correct in ACTIVITY_CORRECTIONS.items():
        act = re.sub(rf"\b{wrong}\b", correct, act)
    
    # Separar múltiples actividades
    parts = re.split(r"[\/,&]", act)
    
    for part in parts:
        part = part.strip()
        # Buscar coincidencias parciales
        for keyword, category in ACTIVITY_MAPPING.items():
            if keyword in part:
                return category
    
    return "Unknown"


def map_injury_regex(text):
    if pd.isna(text) or str(text).strip() == "":
        return -1

    # Normalizar acentos y pasar a minúsculas
    text = str(text).lower()
    text = unicodedata.normalize('NFKD', text).encode('ASCII', 'ignore').decode('utf-8')

    # Corregir errores comunes
    text = re.sub(r"inury|ijnury", "injury", text)

    # --- CATEGORÍA 4: Fatalidades ---
    if re.search(r"(sharks attacking|lost his arm|fatal|died|perished|killed|death|deceased|body not recovered|drowned|disappeared|remains|scavenged|skeletonized|probable drowning|probable drowning & scavenging|missing|believed taken by a shark)", text):
        return 4

    # --- CATEGORÍA 3: Amputaciones o pérdida de miembros ---
    elif re.search(r"(amputat|severed|lost (arm|leg|finger|hand)|mutilat|avulsed|removed|disfigurement|lost part of a finger|lost limb|lost hand|lost arm)", text):
        return 3

    # --- CATEGORÍA 2: Lesiones moderadas / fuertes ---
    elif re.search(r"(cut|cuts|lacerat|injur|wound|puncture|gash|torn|scar|bit|bite|bitten|tooth ?mark|tooth imprints|abrasion|abraded|acerated|scrape|slashed|tissue stripped|broken bone|fracture|cracked jaw|broken ribs|avulsion|massive tissue damage|calf avulsion|thigh stripped|radius & ulna bared|knee ripped|heel & sole|left inner thigh|right thigh|shark grasped thigh)", text):
        return 2

    # --- CATEGORÍA 1: Lesiones leves ---
    elif re.search(r"(minor|bruise|scratch|nipped|grazed|superficial|contusion|small cut|pinched|mouthed|bumped|struck|bumped by fin|bumped by shark|board hit|hit by tail|molested|nibbled)", text):
        return 1

    # --- CATEGORÍA 0: Sin lesión ---
    elif re.search(r"(no injury|unhurt|uninjured|none|without injury|board broken|hoax|provoked incident|collided|threat display|not a shark attack|stingray envenomation|survived|unknown|no details|shark involvement unconfirmed|incident not confirmed|boat holed|reported to have had.*fights with sharks)", text):
        return 0

    # --- No clasificado ---
    else:
        return -1


# -----------------------------
# Función principal de limpieza y mapeo
# -----------------------------
def map_species_info(species_text):
    if pd.isna(species_text) or str(species_text).strip() == "":
        return "Unconfirmed", "Unknown", "Unknown"

    text = str(species_text).lower()
    
    # Aplicar correcciones
    for wrong, correct in SPECIES_CORRECTIONS.items():
        text = text.replace(wrong, correct)
    
    # Extraer longitud en metros
    length_match = re.search(r"(\d+(\.\d+)?)\s*m", text)
    length_m = float(length_match.group(1)) if length_match else None
    
    # Categoría por tamaño
    size_cat = (
        "Unknown" if length_m is None else
        "Very Small" if length_m < 1 else
        "Small" if length_m < 2 else
        "Medium" if length_m < 3 else
        "Large" if length_m < 4 else
        "Very Large" if length_m <= 6 else
        "Giant"
    )
    
    # Limpiar caracteres especiales
    text_clean = re.sub(r"[^a-z\s]", "", text).strip()
    
    # Mapear especie
    species_cat = "Unconfirmed"
    for keyword, category in SPECIES_MAPPING.items():
        if keyword in text_clean:
            species_cat = category
            break
    
    # Mapear riesgo
    risk_cat = RISK_MAPPING.get(species_cat, "Unknown")
    
    return species_cat, size_cat, risk_cat
