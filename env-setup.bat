
@ECHO OFF

::定于初始变量
SET python_home=C:\python372
SET python_exe=%python_home%\python.exe

::判断python是否安装
if exist %python_exe% (
	echo 【file %python_exe% 已经存在...】
) else (
	echo 【开始安装python-3.7.2...】
	start /wait python-3.7.2-amd64.exe /passive InstallAllUsers=1 DefaultAllUsersTargetDir=%python_home% PrependPath=1
	IF ERRORLEVEL==0 (echo 【python安装成功！】) else (echo 【python安装失败！】)
)

::echo 系统环境变量：
::echo %path%

::对pip进行升级
::echo 开始对pip进行升级...
::C:\Python372\python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
::IF not ERRORLEVEL==0 (echo pip升级完成！) else (echo pip升级完成！)

echo 【已完成python环境安装！】

echo 【开始安装依赖包...】
SET basedir=%cd%
C:
cd \Python372\Scripts
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r %basedir%/requirement.txt
echo 【依赖包安装完成！】


echo 【开始安装talib...】
pip install %basedir%/TA_Lib-0.4.18-cp37-cp37m-win_amd64.whl

IF ERRORLEVEL == 0 (
echo 【talib安装成功！】) else (
echo 【talib安装失败！】
set success=0)


echo 【依赖包安装结束，过程中若出现红字警示意味着安装失败，请尝试重新运行本脚本！】
echo 【若反复安装依然失败，请加QQ群695751148（魔灯量化-1群）寻求支持！】
pause
exit