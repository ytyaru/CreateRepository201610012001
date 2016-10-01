:: -----------------------------------------------------------------------------
:: ���[�J�����|�W�g���ƃ����[�g���|�W�g����V�K�쐬���ď�commit��push����
:: -----------------------------------------------------------------------------
:: ���e
:: * �����[�g����|�W�g����V�K�쐬����i���|�W�g�����͂��̃t�@�C���̐e�f�B���N�g�����j
:: * git init
:: * git add .
:: * git commit
:: * git push
:: 
:: ���O����
:: * SSH���J����GitHub�ɐݒ肷��
:: 
:: �菇
:: 1. Git for Windows ���C���X�g�[������
:: 2. ssh�����쐬����
::     2.1. �ȉ��̃p�X�ֈړ�����
::         C:\Documents and Settings\Administrator\.ssh
::     2.2. ssh�����쐬����
::         GitBash > ssh-keygen -t rsa -C "your_email@domain.com" -f filename
::         * �ȉ���2�t�@�C�������������
::             * �閧���t�@�C��(filename)
::             * ���J���t�@�C��(filename.pub)
::         * config�t�@�C���Ɉȉ���ǋL����
::            Host github.com.filename
::              User git
::              Port 22
::              HostName github.com
::              IdentityFile ~/.ssh/filename
::              TCPKeepAlive yes
::              IdentitiesOnly yes
:: 3. GitHub�̃A�J�E���g���쐬����
:: 4. GitHub�Ƀ��O�C������
:: 5. GitHub��SSH���J����o�^����ihttps://github.com/settings/ssh�j
::     * ���J���t�@�C��(filename.pub)�̒��g���y�[�X�g����
:: 6. �ڑ��e�X�g����
::    * GitBash > ssh -T github.com.filename
::    * �ȉ��̂悤�ɕ\�����ꂽ��OK
::        setsockopt IP_TOS 8: Invalid argument:
::        Hi ytyaru! You've successfully authenticated, but GitHub does not provide shell access.
::
:: �Q�l
:: http://dev.classmethod.jp/tool/github-ssh-sub-account-setting/
:: http://www.slideshare.net/nullpopopo/github-12293342
:: http://dackdive.hateblo.jp/entry/2015/10/12/210547


:: �����[�g���|�W�g���𐶐�����
call CallCreateRepository.bat


:: GitHub�A�J�E���g
SET USER_NAME=YourUsername
SET USER_MAIL=YourMail@domain.com
:: "C:\Documents and Settings\Administrator\.ssh\config
SET SSH_HOST=github.com.YourUsername
:: GitHub�̃��|�W�g�����i�A�b�v���[�h�惊�|�W�g�����j
:: ���̃t�@�C���̐e�f�B���N�g����
for %%I in (.) do set REPOSITORY_NAME=%%~nI%%~xI
echo %REPOSITORY_NAME%


:: ���[�J�����|�W�g����.git�t�@�C���ꎮ���쐬�i���r�W�����Ǘ��̊J�n�j
git init

:: �A�J�E���g�ؑ�
git config --local user.name "%USER_NAME%"
git config --local user.email "%USER_MAIL%"

:: ���[�J�����|�W�g���Ƀ\�[�X�R�[�h���X�e�[�W���O���R�~�b�g����
git add .
git commit -m "initial commit"

:: .git/config�̐ݒ�ǋL�R�}���h�B1�񂾂����s����΂����B
:: �ufatal: remote origin already exists.�v�Ƃ����G���[���\�����ꂽ��R�����g�A�E�g����B
git remote add origin git@%SSH_HOST%:%USER_NAME%/%REPOSITORY_NAME%.git

:: ���[�J�����|�W�g�����烊���[�g���|�W�g���֏C���𔽉f������
git push origin master

pause
