# Un heterograma es una palabra o frase que no contiene 
# ninguna letra repetida.

entrada=input()
def heterograma(entrada):
    r= True
    saved=[]
    for x in entrada:
        if x == " ":
            continue
        if x in saved:
            r =False
            break
        saved.append(x)
    if r == False:
        print("El texto NO es un heterograma!")
    if r == True:
        print("El texto es un heterograma!")
   

# Un isograma es una palabra en la que todas las letras se repiten el
# mismo número de veces. Por ejemplo, la palabra "murciélago" es un isograma
# ya que cada letra aparece una vez.

def Isograma(entrada):
    dc={}
    for x in entrada:
        if x == " ":
            continue
        if x in dc:
            dc[x] +=1
        else:
            dc[x] = 1
    valores=list(dc.values()) 
    divisor= sum(valores)
    dividendo =len(valores)
    if divisor / dividendo == valores[1]:
        print ("el texto es un Isograma!")
    else:
        print ("el texto NO es un Isograma!")

# Pangrama: Un pangrama es una frase que utiliza todas las letras 
# del alfabeto al menos una vez.

def Panagrama(entrada):
    cont=0
    abecedario = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    abecedariom =["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N" , "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    for x in abecedario or abecedariom:
        if x == " ":
            continue
        if x not in entrada:
             print("El texto NO es un Panagrama!")
             break
        if x in abecedario:
            cont += 1
        if cont== 26:
            print("El texto es un Panagrama!")

heterograma(entrada)
Isograma(entrada)            
Panagrama(entrada)             
        

