for /f "usebackq tokens=*" %%a in ("ib.txt") do (call RunConfig.cmd %%~a >> RunConfig-ByList.log)