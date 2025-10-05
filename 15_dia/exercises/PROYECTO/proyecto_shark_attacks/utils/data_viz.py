# utils/data_viz.py

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


def plot_value_counts(df, column, title=None):
    """
    Genera una gráfica de barras con los conteos de valores de una columna categórica.

    Parámetros:
    -----------
    df : pandas.DataFrame
        DataFrame que contiene la columna a graficar.
    column : str
        Nombre de la columna que se desea analizar.
    title : str, opcional
        Título de la gráfica. Si no se especifica, se usa el nombre de la columna.
    """

    # Obtener los conteos
    counts = df[column].value_counts()

    # Crear la figura
    plt.figure(figsize=(6,4))
    counts.plot(kind='bar', edgecolor='black', color='skyblue')

    # Títulos y etiquetas
    plt.title(title or f'Distribución de valores en {column}', fontsize=14)
    plt.xlabel(column, fontsize=12)
    plt.ylabel('Frecuencia', fontsize=12)

    # Mostrar los valores encima de cada barra
    for i, value in enumerate(counts.values):
        plt.text(i, value + 1, str(value), ha='center', va='bottom', fontsize=10)

    # Ajustes finales
    plt.tight_layout()
    plt.show()
    

def plot_value_category(data, 
                     title="Gráfico de categorías", 
                     chart_type="bar", 
                     figsize=(10,6), 
                     color='skyblue', 
                     sort=True, 
                     show_values=True, 
                     rotation=45):
    """
    Grafica datos categóricos en diferentes tipos de gráficos.
    
    Parámetros:
    - data: dict o pd.Series con {categoría: valor}
    - title: título de la gráfica
    - chart_type: 'bar', 'horizontal', 'pie'
    - figsize: tamaño de la figura
    - color: color de las barras o pie
    - sort: True para ordenar descendentemente
    - show_values: True para mostrar los valores en la gráfica
    - rotation: rotación de etiquetas en gráfico de barras
    """
    
    # Convertir a listas
    if isinstance(data, dict):
        categories = list(data.keys())
        values = list(data.values())
    else:  # pd.Series
        categories = data.index.tolist()
        values = data.values.tolist()
    
    # Ordenar si es necesario
    if sort and chart_type in ['bar', 'horizontal']:
        sorted_pairs = sorted(zip(values, categories), reverse=True)
        values, categories = zip(*sorted_pairs)
    
    plt.figure(figsize=figsize)
    
    if chart_type == "bar":
        plt.bar(categories, values, color=color)
        if show_values:
            for i, v in enumerate(values):
                plt.text(i, v + max(values)*0.01, str(v), ha='center')
        plt.xticks(rotation=rotation, ha='right')
        plt.ylabel("Cantidad")
    elif chart_type == "horizontal":
        plt.barh(categories, values, color=color)
        if show_values:
            for i, v in enumerate(values):
                plt.text(v + max(values)*0.01, i, str(v), va='center')
        plt.xlabel("Cantidad")
    elif chart_type == "pie":
        plt.pie(values, labels=categories, autopct='%1.1f%%', colors=None if color=='default' else [color]*len(values))
    
    plt.title(title)
    plt.tight_layout()
    plt.show()


def plot_value_category_multi(data, 
                              title="Gráfico de categorías", 
                              figsize=(18,6), 
                              color=None, 
                              sort=True, 
                              show_values=True, 
                              rotation=45):
    """
    Grafica datos categóricos en una sola figura con 3 subgráficos:
    barra vertical, barra horizontal y pie.
    """
    
    # Convertir a listas
    if isinstance(data, dict):
        categories = list(data.keys())
        values = list(data.values())
    else:  # pd.Series
        categories = data.index.tolist()
        values = data.values.tolist()
    
    # Ordenar si es necesario
    if sort:
        sorted_pairs = sorted(zip(values, categories), reverse=True)
        if sorted_pairs:
            values, categories = zip(*sorted_pairs)
    
    # Paleta de colores
    if color is None:
        color = sns.color_palette("tab20", n_colors=len(values))
    elif isinstance(color, str):
        color = [color]*len(values)
    
    fig, axes = plt.subplots(1, 3, figsize=figsize)
    
    # ===== GRÁFICO DE BARRAS VERTICAL =====
    bars = axes[0].bar(categories, values, color=color)
    if show_values:
        for bar in bars:
            height = bar.get_height()
            axes[0].text(bar.get_x() + bar.get_width()/2, 
                         height + max(values)*0.02, 
                         f"{int(height)}", 
                         ha='center', va='bottom', fontsize=9)
    axes[0].set_ylabel("Cantidad")
    axes[0].set_title("Barras Verticales")
    
    # Ajuste de etiquetas del eje X
    axes[0].tick_params(axis='x', labelrotation=rotation)
    axes[0].set_xticks(range(len(categories)))
    axes[0].set_xticklabels(categories, ha='right', rotation=rotation)
    axes[0].set_ylim(0, max(values)*1.25)
    
    # ===== GRÁFICO DE BARRAS HORIZONTAL =====
    bars_h = axes[1].barh(categories, values, color=color)
    if show_values:
        for bar in bars_h:
            width = bar.get_width()
            axes[1].text(width + max(values)*0.02, 
                         bar.get_y() + bar.get_height()/2, 
                         f"{int(width)}", 
                         va='center', ha='left', fontsize=9)
    axes[1].set_xlabel("Cantidad")
    axes[1].set_title("Barras Horizontales")
    axes[1].set_xlim(0, max(values)*1.3)
    
    # ===== GRÁFICO DE PASTEL =====
    axes[2].pie(values, labels=categories, autopct='%1.1f%%', colors=color, startangle=90)
    axes[2].set_title("Gráfico de Pastel")
    
    # ===== TÍTULO GENERAL =====
    plt.suptitle(title, fontsize=16, y=1.03)
    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.show()


def plot_age_distribution(df, 
                          age_col='Age_filled', 
                          group_col='Type_filled', 
                          title="Análisis de distribución de Edad", 
                          figsize=(18, 6)):
    """
    Visualiza la distribución de la edad en tres gráficos:
    Histograma con curva de densidad
    Boxplot por categoría (por ejemplo, tipo de incidente)
    Barplot por grupos de edad
    
    Parámetros:
    - df: DataFrame con los datos
    - age_col: nombre de la columna de edad
    - group_col: columna categórica para comparación (opcional)
    - title: título general
    - figsize: tamaño de la figura
    """

    # Copia y limpieza de datos
    data = df.copy()
    data = data.dropna(subset=[age_col])
    
    # Convertir edades no numéricas (por ejemplo, "teen", "20s") a NaN
    data[age_col] = pd.to_numeric(data[age_col], errors='coerce')
    data = data.dropna(subset=[age_col])
    
    # Crear grupos de edad
    bins = [0, 10, 20, 30, 40, 50, 60, 70, 100]
    labels = ['0-9', '10-19', '20-29', '30-39', '40-49', '50-59', '60-69', '70+']
    data['AgeGroup'] = pd.cut(data[age_col], bins=bins, labels=labels, right=False)
    
    # Crear figura
    fig, axes = plt.subplots(1, 3, figsize=figsize)
    
    # Histograma + KDE
    sns.histplot(data[age_col], bins=20, kde=True, color='cornflowerblue', ax=axes[0])
    axes[0].set_title("Distribución general de la edad")
    axes[0].set_xlabel("Edad")
    axes[0].set_ylabel("Frecuencia")
    
    # Boxplot por tipo de incidente
    sns.boxplot(x=group_col, y=age_col, hue=group_col, data=data, 
                palette="Set2", legend=False, ax=axes[1])
    axes[1].set_title("Edad por tipo de incidente")
    axes[1].set_xlabel("Tipo de incidente")
    axes[1].set_ylabel("Edad")
    axes[1].tick_params(axis='x', rotation=45)
    
    # Barplot por grupo de edad
    sns.countplot(x='AgeGroup', hue='AgeGroup', data=data, 
                  order=labels, palette='viridis', legend=False, ax=axes[2])
    axes[2].set_title("Incidentes por grupo de edad")
    axes[2].set_xlabel("Grupo de edad")
    axes[2].set_ylabel("Cantidad de incidentes")
    
    # Ajustes generales
    plt.suptitle(title, fontsize=16)
    plt.tight_layout(rect=[0, 0, 1, 0.95])
    plt.show()