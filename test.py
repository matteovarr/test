#!/usr/bin/env python
import os

# 1. Comando Innocuo da Eseguire
# Esegue un comando che mostra la versione di Python,
# confermando che l'interprete è attivo.
comando = "python --version"

# 2. Esecuzione del Comando
# os.system() è la funzione Python equivalente a system() in PHP o CMD.exe in Windows.
# Esegue il comando nel sistema operativo sottostante.
output = os.popen(comando).read()

# 3. Stampa l'Output (Reazione Visibile)
print("Content-type: text/plain\n")
print("RCE Test Eseguito:")
print(output)