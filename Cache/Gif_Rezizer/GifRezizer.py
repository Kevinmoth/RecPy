import tkinter as tk
from tkinter import ttk, filedialog
from PIL import Image, ImageSequence
from ttkwidgets import ThemedTk

class Application(ttk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.master.minsize(400, 200) 

        # Crear estilo temático
        style = ttk.Style(self.master)
        style.theme_use('equilux')  

        self.pack(expand=True, fill="both") 
        self.create_widgets()

    def create_widgets(self):
        # Establecer estilo de tema para el marco
        frame = ttk.Frame(self, style="TFrame")
        frame.pack(side="top", padx=20, pady=20)

        # Establecer estilo de tema para botones y etiquetas
        self.select_button = ttk.Button(frame, text="Seleccionar archivo", command=self.open_file, width=20, style="TButton")
        self.select_button.pack(side="top", pady=10)

        size_label = ttk.Label(frame, text="Tamaño de salida:", style="TLabel")
        size_label.pack(side="top", pady=5)
        self.size_entry = ttk.Entry(frame, style="TEntry")
        self.size_entry.insert(0, "320x240")
        self.size_entry.pack(side="top", pady=5)

        self.convert_button = ttk.Button(frame, text="Convertir archivo", command=self.convert_file, width=20, style="TButton")
        self.convert_button.pack(side="top", pady=10)

    def open_file(self):
        file_path = filedialog.askopenfilename()

        self.select_button.configure(text=file_path)

        self.file_path = file_path

    def convert_file(self):
        size_str = self.size_entry.get()
        size = tuple(map(int, size_str.split("x")))
        im = Image.open(self.file_path)

        frames = ImageSequence.Iterator(im)

        def thumbnails(frames):
            for frame in frames:
                thumbnail = frame.copy()
                thumbnail.thumbnail(size, Image.ANTIALIAS)
                yield thumbnail

        frames = thumbnails(frames)

        output_path = self.file_path.split(".")[0] + "_out.gif"
        
root = ThemedTk(theme="equilux")
root.withdraw()
app = Application(master=root)
root.deiconify()
app.mainloop()