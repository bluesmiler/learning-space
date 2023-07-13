package com.pm.utils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * 二维码生成工具
 */
public class QRCodeUtil {
    public static BufferedImage getImage(String content){
        int width = 300;
        int height = 300;
        MultiFormatWriter formatWriter = new MultiFormatWriter();
        Map hints = new HashMap();
        //进行编码设置防止读取二维码时文字乱码
        hints.put(EncodeHintType.CHARACTER_SET,"UTF-8");
        BitMatrix bitMatrix = null;
        try {
            bitMatrix = formatWriter.encode(content, BarcodeFormat.QR_CODE,width,height,hints);
        }catch (Exception e){
            e.printStackTrace();
        }
        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }

    public static void saveQRC(String codeName){
        BufferedImage bufferedImage = QRCodeUtil.getImage(codeName);
        File qRCFile = new File(Constants.IMAGE_PATH+codeName);
        try {
            OutputStream out = new FileOutputStream(qRCFile);
            ImageIO.write(bufferedImage,"png",out);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
