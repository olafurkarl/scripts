#!/bin/bash

if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <input> <output (optional)>"
  exit 1
fi

INPUT_FILE=$1
INPUT_FILE_NO_EXT=${INPUT_FILE%.pdf}
if [ "$#" -eq 2 ]; then
  OUTPUT_FILE=$2
else
  OUTPUT_FILE="${INPUT_FILE_NO_EXT}_compressed.pdf"
fi

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default \
   -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages \
   -dCompressFonts=true -r150 -sOutputFile=$OUTPUT_FILE $INPUT_FILE

exit
     
     
