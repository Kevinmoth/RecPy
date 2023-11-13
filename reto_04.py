my_num= int(input())
def clasificador(my_nun):
    resultado=(str(my_num)) + ""

    #calculamos si es par:

    if my_nun%2 == 0:
        resultado += " es un numero par,"
    else:
        resultado += " no un numero par,"

    #calculamos si es primo 

    nprimo=0    
    for x in range (2,(my_num +1)):
        if my_num % x ==0:
            nprimo = nprimo + 1 
    if nprimo == 1:
        resultado += " es primo"
    else:
        resultado += " no es primo"
    
    # calculamos si pertenece a fibbonacci

    a, b = 0, 1
    while b < my_num:
        a, b = b, a + b
    if b == my_num:
        resultado += " y pertenece a la secuencia de fibonacci"
    else:
        resultado += " y no pertenece a la secuencia de fibonacci"
    print(resultado)

clasificador(my_num)
