import requests
from bs4 import BeautifulSoup as bs
import os

def get_soup(url:str):
    response = requests.get(url)
    content = bs(response.content, 'html.parser')
    search = content.find_all('table', class_='wikitable')
    name = input('Archivo -> ')
    Validar_Archivo(name)
    with open (name, 'r+') as file:
        for i in search:
            file.write(i.text)

def Validar_Archivo(archivo):  #Verifica si el archivo seleccionado por el usuario existe o
  if os.path.exists(archivo):  # de lo contrario lo creara.
    archivo = open(archivo, "a")
  else:
    archivo = open(archivo, "w")

if __name__ == "__main__":
    host = 'https://www.ecured.cu/Anexo:Presidentes_de_los_Estados_Unidos'
    get_soup(host)