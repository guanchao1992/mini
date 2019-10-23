这是一个cocos2d-x-3.10的项目，项目中只包含源码和资源，引擎部分要到官网下载。
123456


下面是cocos的自定义生成步骤，给删掉了。
if not exist "$(LocalDebuggerWorkingDirectory)" mkdir "$(LocalDebuggerWorkingDirectory)"
xcopy /Y /Q "$(OutDir)*.dll" "$(LocalDebuggerWorkingDirectory)"
xcopy /Y /Q "$(ProjectDir)..\Classes\ide-support\lang" "$(LocalDebuggerWorkingDirectory)"
xcopy "$(ProjectDir)..\..\..\res" "$(LocalDebuggerWorkingDirectory)\res" /D /E /I /F /Y
xcopy "$(ProjectDir)..\..\..\src" "$(LocalDebuggerWorkingDirectory)\src" /D /E /I /F /Y