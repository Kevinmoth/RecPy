import sounddevice 
from scipy.io.wavfile import write

fs=44100 #Frecuencia de muestreo
seconds=10
print ("Grabando...")

Nota_de_Voz=sounddevice.rec(int(seconds * fs),samplerate=fs,channels=2)
write("salida.wav",fs,Nota_de_Voz) 