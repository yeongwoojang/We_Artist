package com.we.art.common.code;

public enum ConfigCode {
    //��Ī��
//    DOMAIN("https://www.bookmanager.ga"),
    //���߿�
	//DOMAIN("http:http://3.19.138.148:8080"),
    DOMAIN("http://localhost:9898"),
    //UPLOAD_PATH("/var/lib/tomcat8/webapps/upload/"),
    EMAIL("weartist1@naver.com"),
    UPLOAD_PATH("C:\\code\\resources\\upload\\"),
	GALLERY_PATH("C:\\code\\resources\\gallery\\");
    public  String desc;

    ConfigCode(String desc){
        this.desc = desc;
    }

    @Override
    public String toString() {
        return desc;
    }
}