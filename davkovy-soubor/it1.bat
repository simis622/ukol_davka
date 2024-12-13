REM Prejmenujte tento soubor na it1.bat a doplnte o potrebne prikazy
F:\student\it1\pavera\PVY\davkovy-soubor>ren ukol-davka.txt it1.bat

REM 1. Vypnuti vypisu informaci o provadenych prikazech, zmena barvy (bile pozadi, cerny text)
@echo off
color f0

REM 2. Vypsat na obrazovku "Zalohovaci davkovy soubor" 
echo Zalohovaci davkovy soubor

REM 3. Vypsat do titulku "DAVKOVY SOUBOR: " a nazev davky
title DAVKOVY SOUBOR: it1.bat

REM 4. Pozastavit beh davkoveho souboru az do stisku libovolne klavesy
pause

REM 5. Zajistit presun do korenoveho adresare disku F:
cd F:\

REM 6. Pokud nebyl zadan 1.parametr - skok na navesti ERROR
F:\>if "%1"=="" goto ERROR

REM 7. Vytvorit slozku ZALOHA a podslozku zadanou v 1. parametru
mkdir ZALOHA\%1

REM 8. Zkopirovat soubory *.EXE ze slozky C:\XAMPP\APACHE\BIN do slozky zadane 1. parametrem
xcopy "C:\XAMPP\APACHE\BIN\*.EXE" "%1\" /Y

REM 10. Zmenit atribut vsech souboru ve slozce tak, aby byly skryte a pouze pro cteni
attrib +H +R "%1\*.*"

REM 11. Vypsat obsah slozky zadane 1. parametrem do souboru ZALOHA.TXT, ktery bude ulozen do slozky ZALOHA
dir "%1" > ZALOHA\ZALOHA.TXT

REM 12. Vypsat na konec souboru ZALOHA.TXT informace o nastaveni sitovych zarizeni pocitace (ipconfig)
ipconfig >> ZALOHA\ZALOHA.TXT

REM 13. Zobrazit soubor ZALOHA.TXT v Poznamkovem bloku
start notepad ZALOHA\ZALOHA.TXT

REM 14. Provede skok na navesti END
goto END

REM 15. Vytvorte navesti ERROR a vypiste uzivateli hlaseni "Nebyl zadan 1. parametr!"
echo ERROR: Nebyl zadan 1. parametr!

REM 16. Vytvorte navesti END  
echo END

REM 17. Vypsat hlaseni "THE END" 
echo THE END

REM 18. Vymazat slozku ZALOHA pokud existuje (vcetne podslozek)
rd /s /q "ZALOHA"