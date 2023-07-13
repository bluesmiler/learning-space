-----------------------
Redis-key����			|
-----------------------
	* key����������
		* ɶ������,�����ǻ���,�ո�
		* ������,Ҳ�����Լ�����key�ĸ�ʽ
			object-type:id:field
	set key value
		* �洢һ�����ݵ��ڴ�
	mset key value key value key value..
		* ����һ���Դ洢���key value
	msetnx key value key value...
		* ���������һ��key���Ѿ����ڵ�,��ô����ִ���κεĲ��붯��
	getset key newvalue
		* ��ָ����key�����µ�ֵ,���һ᷵��ԭʼֵ
	get key
		* ���ڴ��л������
	mget key key key ...
		* ���ڴ��л�ȡ���ָ��key������
	exists key
		* ����ָ����Key�Ƿ����
	del key1 key2 ...keyn
		* ɾ��ָ����key
	keys pattern
		* ����ָ��ƥ��ģʽ������key,ע��,���ص���key
		* pattern,�е�������.������
	rename oldkey newkey
		* ������key
	dbsize
		* ���ص�ǰ���ݿ��key����
	expire key seconds
		* Ϊkeyָ�����ڵ�ʱ��
		* ���óɹ��󷵻� 1
	ttl key
		* ����keyʣ��Ĺ�������
		* ������ݴ���,����û�����ù���ʱ,�䷵�� -1
		* �����Ѿ�������,���� -2
	select db-index
		* ѡ�����ݿ�(ͨ���±�ѡ��)
		* Ĭ����16�����ݿ�,����ͨ���޸������ļ����Զ���
		* ��Լ��84��:databases 16
	move key db-index
		* ��key�ӵ�ǰ���ݿ��Ƶ�ָ�������ݿ�
	flushdb
		* ��յ�ǰ���ݿ��е�����key
	flushall	
		* ����������ݿ��е�����key
	strlen key
		* ����ָ��key��value�ĳ���
	set ���֧�ֿ�ѡ��NXѡ���XXѡ��
		* ��������NXѡ��,��ôset������ʱ����ж�keyֵ�Ƿ����,���������ô���������ǲ���.���������,��ô�ͻ���������
		* ��������XXѡ��,��ôset������ʱ����ж�keyֵ�Ƿ����,�������,��ô��ִ�в������и���,���������,��ô����ִ���κβ���
		* �����NX/XXѡ�������,ִ�гɹ�����ok,ʧ�ܷ���nil
		* ��:
			* set name Kevin NX		//name���key����Ѿ�����.��ô�Ͳ�������κβ���	
			* set name Kevin XX		//name���key�����Ǵ��ڵ�.�Ż���д洢����.��֮�������κεĲ���
		* ����ڷ�ֹ����,��ʵ����һ��д��
			* SETNX key value;		//ͬ��,���key�Ѿ�������ô����ִ��д�����,����ʧ�ܷ���0,�ɹ�����1
			* MSETNX key value key value ...
				* �����һ��key�Ǵ��ڵ�,��ô�����Ĳ��붼����ִ��

-----------------------
Bitmap					|
-----------------------
	setbit key offset value
	getbit key offset
		* ����bitλ�����úͶ�ȡ����
		* valueֻ���� 0/1 ,�������ⶫ����ʵ�ֲ�¡�������㷨
		* ���offset����,������м����0(�2^32, 512 MB)
			long bits = 1L << 32;       // 4294967296
			long mb = bits / 8 / 1024 / 1024;
			System.out.println(bits + " bit=" + mb + " mb");    // 4294967296bit=512mb

	
	bitop [operations] [result] [key1] [keyn..]
		* operations ��ʾ,ִ�в�ͬ�ַ���֮���λ����
		* result ��ʾ�������Ĵ洢��key
			AND
			OR
			XOR
			NOT(�ò���ֻ�ܽ���һ��key,��Ϊ����ȡ������)
		
		* bitop OR result Monday Tuesday Wednesday Thursday Friday Saturday Sunday

	bitcount key [start] [end]
		* ����ָ��key������Ϊ 1 ��λ������
		* ����ָ����ʼ�ͽ�����λ��


	bitpos [key] [value]
		* ���ص�һ��0����1��λ��

	
	# Redis �ͻ��˵Ĳ���
		RedisClient redisClient = RedisClient.create("redis://localhost:6379/0");
		StatefulRedisConnection<String, String> connection = redisClient.connect();
		RedisCommands<String, String> syncCommands = connection.sync();

		syncCommands.setbit("users",1,1);
		syncCommands.getbit("users",1);

		syncCommands.bitopAnd("result","key1","key2");
		syncCommands.bitopOr("result","key1","key2");
		syncCommands.bitopXor("result","key1","key2");
		syncCommands.bitopNot("result","key1");
	
