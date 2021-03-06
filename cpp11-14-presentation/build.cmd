@echo off

set IN=_all.txt
set OUT=cpp11-14-presentation.html
set INTRO=intro.txt
set LANG=new_lang_features.txt
set OBJ=obj_creation_improvements.txt
set LAMBDA=lambda.txt
set MOVE=move_semantics.txt
set UTIL=util_and_libraries.txt
set MEM=multithreading_and_memory.txt
set ROOT=%CD%

cd src
copy /A /Y %INTRO% + %LANG% + %OBJ% + %LAMBDA% + %MOVE% + %UTIL% %IN%
cd ..

rem 
rem GNU Source-highlight
rem http://www.gnu.org/software/src-highlite/
rem win32 binaries from http://gnuwin32.sourceforge.net/packages/source-highlight.htm
rem 
cd ..\tools\gnu-highlite\bin
python ..\..\asciidoc\asciidoc.py --backend slidy --out-file "%ROOT%\..\docs\%OUT%" %ROOT%\src\%IN%
cd %ROOT%

rem
rem http://www.andre-simon.de/doku/highlight/en/highlight.php
rem 
rem set PATH=%PATH%;D:\cpp-presentation\tools\highlight-3.26
rem tools\asciidoc\asciidoc.py --backend slidy -a stylesheet=custom.css bin\%OUT%
