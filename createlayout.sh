#!/bin/bash

xelatex -synctex=1 -interaction=nonstopmode "main".tex
cp main.pdf semesterprogramm.pdf
pdftk semesterprogramm.pdf burst
pdftk pg_0005.pdf pg_0006.pdf pg_0007.pdf pg_0008.pdf cat output A4_aussen.pdf
pdfjam --quiet --landscape A4_aussen.pdf --papersize '{111mm,295mm}' --nup 4x1  --outfile final_wirmachendruck_aussen.pdf

pdftk pg_0002.pdf pg_0001.pdf pg_0003.pdf pg_0004.pdf cat output A4_innen.pdf
pdfjam --quiet --landscape A4_innen.pdf --papersize '{111mm,295mm}' --nup 4x1  --outfile final_wirmachendruck_innen.pdf

pdftk pg_0001.pdf pg_0002.pdf pg_0003.pdf pg_0004.pdf cat output final_online_wingolfsplattform.pdf

pdfjam --quiet --landscape A4_innen.pdf A4_aussen.pdf --paper A4paper --nup 4x2  --outfile final_online_diy.pdf

trash pg_0001.pdf
trash pg_0002.pdf
trash pg_0003.pdf
trash pg_0004.pdf
trash pg_0005.pdf
trash pg_0006.pdf
trash pg_0007.pdf
trash pg_0008.pdf

trash doc_data.txt
