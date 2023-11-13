import datetime
now = datetime.datetime.now()
microsecond= now.microsecond
x = 16807
y = 0
z = 2147483647
microsecond = (x * microsecond + y) % z
random_number = ( microsecond % 100) + 1
print(random_number)
k=0 
print("--- Metodo MSM ----")
while k < 5:
    seed= int(1+((microsecond / 1000000) %1 ) *100)
    potencia= seed**2
    seed_text=str(potencia)
    print(seed_text[1:3])
    k+=1