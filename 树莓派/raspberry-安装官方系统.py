

# �ٷ�����
	https://www.raspberrypi.org/downloads/raspbian/
		Raspbian Stretch Lite
		Minimal image based on Debian Stretch
		- �������滷����ϵͳ

# ������ʽ��,��¼TF��

# ��ϵͳssh��¼ʧ��
	* ��ϵͳ,��ֹ��ssh������û����¼
	* �õ��Դ�tf��,�ڸ�Ŀ¼�½�һ�����ļ�:ssh
	* �������,����,ssh��������

# Ĭ���˻�������
	pi
	raspberry

# ����root�˺�
	sudo passwd root
		* �޸�root������,�ظ���������

	sudo passwd --unlock root
		* ����root�û���¼
	
	su root
		* �л�root�û�
	
	apt-get install -y vim
		* �Ȱ�װ,vim(Ҳ����ʹ��nano����,�����Ҳ���Ϥ)
	
	vim /etc/ssh/sshd_config
		* PermitRootLogin without-password (��)
		* PermitRootLogin yes(��)

	reboot
		* ����,����ʹ��root��ݵ�¼��
	
# ��չ���ÿռ�
	sudo raspi-config
		Advanced Options
			Expand Filesystem
	
	df -lh

# ����ʱ��
	sudo raspi-config
		Localisaion Options
			Change Local
			Change Timezone

	timedatectl 
	Time zone: Asia/Shanghai (CST, +0800)

# ����wifi
	Localisaion Options
	Change Wi-fi Country
	CN China

# �������ھ���Դ
	cp /etc/apt/sources.list /etc/apt/sources.list.bak
		* ����

	vim /etc/apt/sources.list
		* ע������,�����������
			deb http://mirrors.aliyun.com/raspbian/raspbian/ jessie main non-free contrib rpi
			deb-src http://mirrors.aliyun.com/raspbian/raspbian/ jessie main non-free contrib rpi



# ����Դ,�����Ѿ���װ�İ�,����ϵͳ
	apt-get update
	apt-get upgrade
	apt-get dist-upgrade