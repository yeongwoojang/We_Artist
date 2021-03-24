package com.we.art.common.code;

public enum ErrorCode {
	SM01("ȸ�������� ��ȸ�ϴ� ���� ������ �߻��Ͽ����ϴ�.","/member/login"),
	IM01("ȸ�������� �Է��ϴ� �� ������ �߻��߽��ϴ�.","/member/join"),
	UM01("ȸ������ ���� �� ������ �߻��߽��ϴ�."),
	DM01("ȸ������ ���� �� ������ �߻��߽��ϴ�."),
	IB01("�Խñ� ��� �� ������ �߻��߽��ϴ�."),
	IF01("�������� ��� �� ������ �߻��߽��ϴ�."),
	MAIL01("���� �߼� �� ������ �߻��߽��ϴ�."),
	AUTH01("�ش� �������� ���� �Ͻ� �� �����ϴ�."),
	AUTH02("�̹� ������ ����� ��ũ�Դϴ�."),
	AUTH03("�Խñ��� �α��� �� �ۼ��� �� �ֽ��ϴ�."),
	API01("API��� ���� ������ �߻��Ͽ����ϴ�."),
	CD_404("�������� �ʴ� ����Դϴ�."),
	FILE01("���� ���ε��� ���ܰ� �߻��Ͽ����ϴ�.");
	
	
	//result.jsp�� ����� ��� �ȳ�����
	private String errMsg;
	//result.jsp�� ����� �̵���ų ���
	private String url = "/index";
	
	//index�� �̵���ų ���
	ErrorCode(String errMsg){
		this.errMsg = errMsg;
	}
	
	//index�� �̿��� ���� �������� �̵���ų ���
	ErrorCode(String errMsg, String url){
		this.errMsg = errMsg;
		this.url = url;
	}
	
	public String errMsg() {
		return errMsg;
	}
	
	public String url() {
		return url;
	}
}
