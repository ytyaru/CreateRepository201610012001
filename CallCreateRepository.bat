@echo off
:: -----------------------------------------------------------------------------
:: �o�b�`�t�@�C������V�F���X�N���v�g�����s���邽�߂̃o�b�`�B
:: -----------------------------------------------------------------------------
:: �w�i
:: -------------------------------------
:: �����curl�R�}���h���_�u���N���b�N�ŋN�������������̂��߂ɏ������t�@�C���ł���B
:: 
:: �{���A����ȃo�b�`�͕s�v�ł����ė~���������B
:: �������A�ȉ��̂悤�ȗv�]�Ǝ��󂩂�A��ނȂ����̃o�b�`���������B
::
:: �uWebAPI�����s�������v
:: �ucurl.exe���g����HTTP,SSL/TLS�ʐM�ł���炵���v
::
:: �������A�ȉ��̃T�C�g�ɂ́AWin32�o�C�i��(2000/XP�p)�����邪�u�L����Win32�A�v���P�[�V�����ł͂���܂���v�Ƃ����G���[�_�C�A���O���łĎg���Ȃ������B
:: https://curl.haxx.se/download.html
:: 
:: MinGW�łȂ�g�����B
:: �������A����̏���(��1)�̂Ƃ��Acmd.exe�ł͓��삵�Ȃ��B
:: msys(sh.exe)�Ŏ��s����Ɠ��삷��B
:: 
:: ����R�}���h��ł͖̂ʓ|�B
:: �t�@�C���̃_�u���N���b�N�Ŏ��s�������B
:: 
:: cmd.exe�Ȃ�o�b�`�t�@�C���Ash.exe�Ȃ�V�F���X�N���v�g�ŉ\�ł���B
:: �������A�V�F���X�N���v�g���_�u���N���b�N���Ă��N�����Ȃ��B
:: �����ŁA�o�b�`�t�@�C������V�F���X�N���v�g���Ăяo���R�[�h���������B
::
:: �����Ɗy�ȕ��@�͂Ȃ��������̂��B
::
:: ��1 ����V�F���X�N���v�g�ɏ������R�[�h�����s�ł��Ȃ��B
:: -d�������g���Ɠ��삵�Ȃ��̂�������Ȃ��B
:: -d�������g��Ȃ�GitHub���烊�|�W�g���ꗗ�̎擾�͂ł�������B


set sh="C:\MinGW_GET\msys\1.0\bin\sh.exe"

:: �X�N���v�g�̃t���p�X�B
:: ���΃p�X�ł͓n���Ȃ��Bcmd.exe��sh.exe�̃J�����g�f�B���N�g�����قȂ邽�߁B
:: sh.exe�ɂ͓��{����܂ރp�X�͎g���Ȃ��B�����R�[�h���B
set ShellFileName="CreateRepository.sh"
set ShellFile="%~dp0%ShellFileName%"

:: \��/�ɒu������Bsh.exe�̓p�X�̋�ؕ�����\���g���Ȃ�����B
:: http://aki.issp.u-tokyo.ac.jp/itoh/PukiWiki/pukiwiki.php?Windows%A4%E8%A4%ED%A4%BA%A5%E1%A5%E2
set ShellFileUnix=%ShellFile:\=/%
echo %ShellFileUnix%

:: �V�F���X�N���v�g�����s����
call %sh% --login -i -c %ShellFileUnix%

:: pause
@echo on
