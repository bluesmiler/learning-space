
# �ο��̳�
	https://baijiahao.baidu.com/s?id=1591503879926889654&wfr=spider&for=pc
	

# ����Centos7
	http://isoredirect.centos.org/altarch/7/isos/armhfp/
	* ����ѡ��Ϊ�ľ���
		https://mirrors.huaweicloud.com/centos-altarch/7.5.1804/isos/armhfp/

		CentOS-Userland-7-armv7hl-RaspberryPI-Minimal-1804-sda.raw.xz
			* �����ĺ���(������)
		CentOS-Userland-7-armv7hl-RaspberryPI-GNOME-1804-sda.raw.xz
			* GNOME���滷��
		CentOS-Userland-7-armv7hl-RaspberryPI-KDE-1804-sda.raw.xz
			* KDE ���滷��

# ���� SD Memory Card Formatter ���ڸ�ʽ��SD��
	* ��ʽ��SD��

# ���� win32diskimager-1.0.0-install ������¼����
	* ��¼�����Ѿ���ʽ����SD��

# ����SDK��

# ��������,����
	* ��Ƴ���: δ�ܼ�⵽TF��
	* ˫�Ƴ���: δ�ܼ�⵽ϵͳ
	* ��Ƴ���,�̵���˸: ϵͳ��������

# ͨ��·�����鿴��ַ

# ͨ��ssh����
	* ��ʼroot����:centos

# ����ʱ��
	* �鿴
		timedatectl 
		Time zone: Asia/Shanghai (CST, +0800)
	
	* �޸�ʱ��Ϊ�Ϻ�
		timedatectl set-timezone Asia/Shanghai

# ��չ�ռ�
	* ��ݮ��װ��ϵͳ��,Ĭ����û�а������洢�ռ���չ������TF����,����SD���ռ����ò����
	* ��root�û���Ŀ¼�и� README �ļ�,�����ṩ����ķ�ʽ�Զ���չ�ռ�
		/user/bin/rootfs-expand
	

# ��װ���������
	yum -y install vim
	yum -y install git
	yum -y install gcc automake autoconf libtool make
	yum -y install wget