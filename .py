import tkinter as tk

# Crear una ventana
ventana = tk.Tk()

# Crear un botón
boton = tk.Button(ventana, text="Haz clic aquí")

# Configurar el comando del botón
def accion():
    print("¡Haz hecho clic en el botón!")
boton.config(command=accion)

# Empaquetar el botón en la ventana
boton.pack()

# Iniciar la ventana principal
ventana.mainloop()
