------------------------
sci����ͷ				|
------------------------
	# ����ͷ�������
		raspistill [options] 
		* �ĵ�
			https://www.raspberrypi.org/app/uploads/2013/07/RaspiCam-Documentation.pdf

	# ͼ�����������
		-?,  --help             : �����ĵ�
		-w,  --width            : ����ͼ���� <�ߴ�>
		-h, --height            : ����ͼ��߶� <�ߴ�>
		-q, --quality           : ����jpegƷ�� <0��100>
		-r, --raw               : ����rawԭʼ�ݶ����ݵ�JPEGԪ����
		-o, --output            : ����ļ��� <�ļ���>�����Ҫд��stdout��ʹ��`-o -`��������ر�ָ����ͼ���ļ����ᱻ����
		-l, --latest            : �������������ͼ��ָ���ļ� <�ļ���>
		-v, --verbose           : ����������ͷʱ�����ϸ��Ϣ
		-t, --timeout           : ���պ͹ر�ʱ����ʱָ����δָ��ʱĬ����5s
		-th, --thumb            : ����Ԥ��ͼ��Сͼ������������X��Y��Ʒ�ʣ����߲�����
		-d, --demo              : ����һ��demoģʽ��cycle through range of camera options, no capture������������ҿ�������ѭ������ģʽ��
		-e, --encoding          : ���������ָ����ʽ�ļ� ��jpg, bmp, gif, png��
		-x, --exif              :���ɽ���ͼ���ļ�Ӧ�õ������У���ʽ��`key=value`�����߲�����
		-tl, --timelapse        : ������㣬ÿ<ms>����һ��ͼƬ
		-fp, --fullpreview      : �þ�̬��׽�ֱ�������Ԥ�������ܻ��СԤ��֡�ʣ�
		-k, --keypress          : ������������`ENTER`�����գ���`X`Ȼ��`ENTER`���˳�
		-s, -signal             : �źŴ������ȴ���һ�������ź�������һ����Ƭ
		-g, -gl                 : ����Ԥ�����ı���������ʹ����Ƶ��Ⱦ�����ɶ��˼����
		-gc, --glcapture        : ����GL֡buffer�����������ͼ��
		-set, --settings        : �������������ֵȻ��д����stdout
		-cs, --camselect        : ѡ������ͷ�豸 <����>��Ĭ��0
		-bm, --burst            : ����burst capture mode
	
	# Ԥ������������
		-p, --preview           : Ԥ�����ڴ�С���� <x,y,w,h>
		-f, --fullscreen        : ȫ��ĻԤ��ģʽ
		-op, --opacity          : Ԥ������͸���� ��0-255��
		-n, --nopreview         : ����ʾԤ������

	# Ԥ������������
		-gs, -glscene           : GL��Ļ�ߴ�Ȳ���
		-gw, -glwin             : GL���ڲ���
	
	# ͼ�����������2
		-sh, --sharpness        : ����ͼ����� ��-100 �� 100��
		-co, --contrast         : ����ͼ��Աȶ� ��-100 �� 100��
		-br, --brightness       : ����ͼ������ ��0 �� 100��
		-sa, --saturation       : ����ͼ�񱥺Ͷ� ��-100 �� 100��
		-ISO, --ISO             : ��������ͷ�й��
		-vs, --vstab            : Turn on video stabilisation ��������ͷ����ģʽ���������˼�𣿣�
		-ev, --ev               : ����EV����
		-ex, --exposure         : �����ع�ģʽ���μ���ʾ��
		-awb, --awb             : ����AWBģʽ���μ���ʾ��
		-ifx, --imxfx           : ����ͼ��ЧӦ���μ���ʾ��
		-cfx, --colfx           : ����ɫ��ЧӦ���μ���ʾ��
		-mm, --metering         : ���ò��ģʽ���μ���ʾ��
		-rot, --rotation        : ����ͼ����ת ��0��359��
		-hf, --hflip            : ����ˮƽ��ת horizontal flip
		-vf, --vflip            : ���ô�ֱ��ת vertical flip
		-roi, --roi             : ����interest���� ��ɶ��interset?��
		--ss, --shutter         : ���ÿ����ٶȣ�΢��
		--awbg, --awbgains      : ����AWB��ֵ�� AWBģʽ����ر�
		--drc, --drc            : ����DRCˮƽ

	# ��ʾ
		�ع�ģʽѡ��
		auto                    : �Զ��ع�ģʽ
		night                   : ҹ������ģʽ
		nightpreview            : ҹ��Ԥ������ģʽ
		backlight               : �������ģʽ
		spotlight               : �۹������ģʽ
		sports                  : �˶�����ģʽ
		snow                    : ѩ������ģʽ
		beach                   : ��̲����ģʽ
		verylong                : ��ʱ���ع�����ģʽ
		fixedfps                : ֡Լ������ģʽ
		antishake               : ����ģʽ
		fireworks               : �̻�����ģʽ

		�Զ���ƽ��ѡ��
		off                     : �رհ�ƽ�����
		auto                    : �Զ�ģʽ��Ĭ�ϣ�
		sun                     : �չ�ģʽ
		cloud                   : ����ģʽ
		shade                   : ��Ӱģʽ
		tungsten                : �ٵ�ģʽ
		fluorescent             : ӫ���ģʽ
		incandescent            : �׳��ģʽ
		flash                   : ����ģʽ
		horizon                 : ��ƽ��ģʽ

		ͼ����Чѡ��
		none                    : ����Ч��Ĭ�ϣ�
		negative                : ��ɫͼ��
		solarise                : �ع����ͼ��
		posterize               : ɫ��ͼ��
		whiteboard              : �װ���Ч
		blackboard              : �ڰ���Ч
		sketch                  : ��������Ч
		denoise                 : ����ͼ��
		emboss                  : ����ͼ��
		oilpaint                : �ͻ������Ч
		hatch                   : ��ͼ��Ч
		gpen                    : ��˱���Ч
		pastel                  : �ữ�����Ч
		watercolour             : ˮ�ʷ����Ч
		film                    : ��Ƭ���������Ч
		blur                    : ģ��ͼ��
		saturation              : ɫ�ʱ���ͼ��
		colourswap              : ��δ����
		washedout               : ��δ����
		posterise               : ��δ����
		colourpoint             : ��δ����
		colourbalance           : ��δ����
		cartoon                 : ��δ����

		���ģʽѡ��
		average                 : ȫ����ƽ����
		spot                    : ����
		backlit                 : ģ�ⱳ��ͼ��
		matrix                  : ���в��

	# ��������:
		 1 �������
		 2 # �����ӣ�ʱ�䵥λΪ���룩�ӳٺ�����һ����Ƭ��������Ϊ image.jpg
		 3 raspistill -t 2000 -o image.jpg
		 4 
		 5 # ����һ���Զ����С����Ƭ��
		 6 raspistill -t 2000 -o image.jpg -w 640 -h 480
		 7 
		 8 # ����ͼ����������С�ļ��ߴ�
		 9 raspistill -t 2000 -o image.jpg -q 5
		10 
		11 # ǿ��ʹԤ�����ڳ���������Ϊ 100,100 ��λ�ã����ҳߴ�Ϊ�� 300 �͸� 200 ���ء�
		12 raspistill -t 2000 -o image.jpg -p 100,100,300,200
		13 
		14 # ����Ԥ������
		15 raspistill -t 2000 -o image.jpg -n
		16 
		17 # ��ͼ�񱣴�Ϊ PNG �ļ�������ѹ����ʽ������Ҫ�� JPEG �ٶ�������ע�⣬��ѡ��ͼ�����ʱ���ļ���չ���������ԡ�
		18 raspistill -t 2000 -o image.png �Ce png
		19 
		20 # �� JPEG �ļ������һЩ EXIF ��Ϣ�����������������Ʊ�ǩ����Ϊ Dreamcolor��GPS ���θ߶�Ϊ 123.5�ס�
		21 raspistill -t 2000 -o image.jpg -x IFD0.Artist=Dreamcolor -x GPS.GPSAltitude=1235/10
		22 
		23 # ���ø�����ͼ����Ч
		24 raspistill -t 2000 -o image.jpg -ifx emboss
		25 
		26 # ���� YUV ͼ��� U �� V ͨ��Ϊָ����ֵ��128:128 Ϊ�ڰ�ͼ��
		27 raspistill -t 2000 -o image.jpg -cfx 128:128
		28 
		29 # ����ʾ������Ԥ��ͼ�񣬶�����ͼ����б��档
		30 raspistill -t 2000
		31 
		32 # �����ȡͼƬ���� 10 ���ӣ�10 ���� = 600000 ���룩��ʱ���ÿ 10 ���ȡһ�ţ���������Ϊ image_number_1_today.jpg��image_number_2_today.jpg... ����ʽ��
		33 raspistill -t 600000 -tl 10000 -o image_num_%d_today.jpg
		34 
		35 # ��ȡһ����Ƭ����������׼����豸
		36 raspistill -t 2000 -o -
		37 
		38 # ��ȡһ����Ƭ������Ϊһ���ļ�
		39 raspistill -t 2000 -o - > my_file.jpg

