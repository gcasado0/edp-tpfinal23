#!/bin/bash

echo "Iniciando proceso completo..."
echo "Limpiando directorios de trabajo..."
rm -f datasets/generar/*
rm -f datasets/descomprimir/*
rm -f datasets/comprimir/*

echo "1/4-Generando lote imágenes..."
bash -x scripts/generar.sh 3


echo "2/4-Descomprimiendo lote imágenes..."
bash -x scripts/descomprimir.sh ./datasets/generar/imagenes.tar.gz ./datasets/generar/imagenes.sha256

echo "3/4-Procesando lote imágenes..."
bash -x scripts/procesar.sh ./datasets/descomprimir

echo "4/4-Comprimiendo lote imágenes..."
bash -x scripts/comprimir.sh ./datasets/descomprimir
