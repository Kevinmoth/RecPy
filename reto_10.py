def obtenerParametros(url):
    # Buscar la posición del signo de interrogación "?" en la URL
    posicion_inicio = url.index("?")
    
    # Obtener el substring que contiene los parámetros
    parametros_str = url[posicion_inicio+1:]
    
    # Dividir los parámetros utilizando el símbolo "&" y crear un diccionario
    parametros = {}
    for parametro in parametros_str.split("&"):
        nombre, valor = parametro.split("=")
        parametros[nombre] = valor
    
    # Retornar el diccionario de parámetros
    return parametros
url = input()
obtenerParametros(url)
print(obtenerParametros(url))