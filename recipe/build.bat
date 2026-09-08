@echo on

pushd js
call npm ci
if errorlevel 1 exit /b 1
call npm run build
if errorlevel 1 exit /b 1
if not exist "..\src\lucent_pack\static\lucent\" mkdir "..\src\lucent_pack\static\lucent"
xcopy /E /I /Y dist "..\src\lucent_pack\static\lucent\dist\"
if errorlevel 1 exit /b 1
popd

%PYTHON% -m pip install . -vvv
if errorlevel 1 exit /b 1