
@ECHO OFF

::���ڳ�ʼ����
SET python_home=C:\python372
SET python_exe=%python_home%\python.exe

::�ж�python�Ƿ�װ
if exist %python_exe% (
	echo ��file %python_exe% �Ѿ�����...��
) else (
	echo ����ʼ��װpython-3.7.2...��
	start /wait python-3.7.2-amd64.exe /passive InstallAllUsers=1 DefaultAllUsersTargetDir=%python_home% PrependPath=1
	IF ERRORLEVEL==0 (echo ��python��װ�ɹ�����) else (echo ��python��װʧ�ܣ���)
)

::echo ϵͳ����������
::echo %path%

::��pip��������
::echo ��ʼ��pip��������...
::C:\Python372\python -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple --upgrade pip
::IF not ERRORLEVEL==0 (echo pip������ɣ�) else (echo pip������ɣ�)

echo �������python������װ����

echo ����ʼ��װ������...��
SET basedir=%cd%
C:
cd \Python372\Scripts
pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r %basedir%/requirement.txt
echo ����������װ��ɣ���


echo ����ʼ��װtalib...��
pip install %basedir%/TA_Lib-0.4.18-cp37-cp37m-win_amd64.whl

IF ERRORLEVEL == 0 (
echo ��talib��װ�ɹ�����) else (
echo ��talib��װʧ�ܣ���
set success=0)


echo ����������װ�����������������ֺ��־�ʾ��ζ�Ű�װʧ�ܣ��볢���������б��ű�����
echo ����������װ��Ȼʧ�ܣ����QQȺ695751148��ħ������-1Ⱥ��Ѱ��֧�֣���
pause
exit