package org.liao.util;

/**
 * Created by liao on 17-6-15.
 */

import java.security.MessageDigest;
import java.util.UUID;

/**
 * md5加密和随机key的生成
 *
 * getMd5():进行相关hash值的生成.
 * getKey():获取相关的key值.
 * hexString2binaryString:16进制转换成2进制.
 * binaryString2hexString:2进制转换成16进制.
 *
 */
public class CryptographyUtil {

    private static MessageDigest md5 = null;
    static {
        try {
            md5 = MessageDigest.getInstance("MD5");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * 用于获取一个String的md5值
     */
    public static String getMd5(String str) {
        byte[] bs = md5.digest(str.getBytes());
        StringBuilder sb = new StringBuilder(40);
        for(byte x:bs) {
            if((x & 0xff)>>4 == 0) {
                sb.append("0").append(Integer.toHexString(x & 0xff));
            } else {
                sb.append(Integer.toHexString(x & 0xff));
            }
        }
        return sb.toString();
    }

    public static String getKey() {

        UUID uuid = UUID.randomUUID();
        String str = uuid.toString();

        //去掉'-'号
        String temp = str.substring(0, 8) + str.substring(9, 13) + str.substring(14, 18) + str.substring(19, 23) + str.substring(24);

        return temp;
    }

    public static String getXOR(String md5Str, String key) {

        //将16进制形式转成二进制形式
        String anotherBinary=hexString2binaryString(md5Str);
        String thisBinary=hexString2binaryString(key);
        String result = "";

        //判断是否为8位二进制，否则左补零
        if(anotherBinary.length() != 8){
            for (int i = anotherBinary.length(); i <8; i++) {
                anotherBinary = "0"+anotherBinary;
            }
        }
        if(thisBinary.length() != 8){
            for (int i = thisBinary.length(); i <8; i++) {
                thisBinary = "0"+thisBinary;
            }
        }
        //异或运算
        for(int i=0;i<anotherBinary.length();i++){
            //如果相同位置数相同，则补0，否则补1
            if(thisBinary.charAt(i)==anotherBinary.charAt(i))
                result+="0";
            else{
                result+="1";
            }
        }

        return result;
    }

    public static String hexString2binaryString(String hexString) {
        if (hexString == null || hexString.length() % 2 != 0)
            return null;
        String bString = "", tmp;
        for (int i = 0; i < hexString.length(); i++)
        {
            tmp = "0000"
                    + Integer.toBinaryString(Integer.parseInt(hexString
                    .substring(i, i + 1), 16));
            bString += tmp.substring(tmp.length() - 4);
        }
        return bString;
    }

    public static String binaryString2hexString(String bString) {

        bString = bString.replace(" ", "");//去掉直接从word表格内复制出来的空格
        bString = bString.replace(" ", "");//去掉英文空格
        if (bString == null || bString.equals("") || bString.length() % 8 != 0)
            return null;
        StringBuffer tmp = new StringBuffer();
        int iTmp = 0;
        for (int i = 0; i < bString.length(); i += 4)  {

            iTmp = 0;
            for (int j = 0; j < 4; j++)  {
                iTmp += Integer.parseInt(bString.substring(i + j, i + j + 1)) << (4 - j - 1);
            }
            tmp.append(Integer.toHexString(iTmp));

        }
        return tmp.toString();
    }

    public static void main(String[] args) {

        System.out.println(getMd5("123"));

        String temp = getXOR(getMd5("123"), "1cc50318ecb04ec590ce0fd97d9873f2");

        System.out.println(binaryString2hexString(temp));

        System.out.println(binaryString2hexString(getXOR("3ce9ba7a40e9499e068508cc50bb3882","1cc50318ecb04ec590ce0fd97d9873f2")));

    }
}
