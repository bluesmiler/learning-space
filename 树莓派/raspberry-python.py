------------------------
Python3�İ�װ			|
------------------------
	# ������װ
		apt-get update
		apt-get upgrade
		apt-get dist-upgrade
		apt-get install build-essential python-dev python-setuptools python-pip python-smbus -y
		apt-get install build-essential libncursesw5-dev libgdbm-dev libc6-dev -y
		apt-get install zlib1g-dev libsqlite3-dev tk-dev -y
		apt-get install libssl-dev openssl -y
		apt-get install libffi-dev -y
	
	# ��װ
		1,����
			https://www.python.org/ftp/python/

		2,��ѹ,�����ļ���
			tar -zxvf Python-3.7.1.tgz
			mkdir /usr/local/python

		3,��װ����
			yum -y install zlib
			yum -y install zlib-devel
			yum install -y libffi-devel
			yum install -y openssl-devel

		4,�����ѹĿ¼,ִ�б���
			 ./configure --prefix=/usr/local/python
		
		5,����ok��,ִ�а�װ
			make && make install

		4,����������
			ln -s /usr/local/python/bin/python3 /usr/bin/python3
			ln -s /usr/local/python/bin/pip3 /usr/bin/pip3
		
		5,����
			python3 -V
	
	# ���ִ��pip3��װ������������
		"return Command 'lsb_release -a' returned non-zero exit status 1..."
			* ɾ��lsb_release�ļ��ɽ��������
			* rm /usr/bin/lsb_release
		

