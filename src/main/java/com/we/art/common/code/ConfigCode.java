package com.we.art.common.code;

public enum ConfigCode {
    //��Ī��
//    DOMAIN("https://www.bookmanager.ga"),
    //���߿�
    DOMAIN("http://localhost:9898"),
    EMAIL("hphphp23@naver.com"),
    UPLOAD_PATH("C:\\code\\resources\\upload");
    public  String desc;

    ConfigCode(String desc){
        this.desc = desc;
    }

    @Override
    public String toString() {
        return desc;
    }
}