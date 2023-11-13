import tkinter as tk
ventana = tk.Tk()
ventana.title("Traductor Hacker")
ventana.mainloop()


#diccionario hacker
entrada=input()
salida=""
dhacker= { " ": " ",'A': '@', 'B': '8', 'C': '(', 'D': '|)', 'E': '3', 'F': '#', 'G': '6', 'H': '[-]', 'I': '|', 'J': '|', 'K': '|<', 'L': '1', 'M': '[]\/[]', 'N': '[][]', 'O': '0', 'P': '|D', 'Q': '(,)', 'R': '|2', 'S': '5', 'T': '7', 'U': '(_)', 'V': '\/', 'W': '\/\/', 'X': '><', 'Y': '`/', 'Z': '2','a': '@', 'b': '8', 'c': '(', 'd': '|)', 'e': '3', 'f': '#', 'g': '6', 'h': '[-]', 'i': '|', 'j': '|', 'k': '|<', 'l': '1', 'm': '[]/[]', 'n': '[][]', 'o': '0', 'p': '|D', 'q': '(,)', 'r': '|2', 's': '5', 't': '7', 'u': '(_)', 'v': '/', 'w': '//', 'x': '><', 'y': '`/', 'z': '2' }
def traductor(entrada):
    salida= ""
    for x in entrada:
        salida += str(dhacker[x])
    print(salida)

traductor(entrada)