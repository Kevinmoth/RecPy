import random
#selector de cantidad de caracteres:
k = int(input("Seleccione la cantidad de caracteres entre 8 y 16:  "))
#selecror de caracteristicas
cmays=input("Quiere incluir mayusculas en su contraseña? Y / N:  ")
cnums=input("Quiere incluir numeros en su contraseña Y / N:   ")
csims=input("Quiere incluir simbolos en su contraseña? Y / N:   ")
contraseña=""
mayusculas=[]
letras = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "ñ", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
for m in letras:
    mayusculas.append(m.upper())
nums=[1,2 ,3, 4, 5, 6, 7 ,8 ,9, 0]
simbolos = ["!", "@", "#", "$", "%", "&", "*", "-", "_", "=", "+", "/", "<", ">", "?"]

while k >= 0:
    k -= 1
    if cmays == "y" or cmays == "Y":
        contraseña += (random.choice(mayusculas))
    k -= 1    
    contraseña +=(random.choice(letras))    
    k -= 1    
    if cnums == "y" or cnums == "Y":
        contraseña += (str(random.choice(nums)))
    k -= 1    
    if csims == "y" or csims == "Y":
        contraseña += (random.choice(simbolos))

print ("Su contraseña generada es:  " +  contraseña)            





