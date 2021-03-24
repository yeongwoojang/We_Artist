package com.we.art.common.code;

public enum ConfigCode {
    //런칭용
//    DOMAIN("https://www.bookmanager.ga"),
    //개발용
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