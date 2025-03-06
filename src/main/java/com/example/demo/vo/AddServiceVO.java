package com.example.demo.vo;

public class AddServiceVO {
    private ServiceVO serviceCode;      // 서비스코드
    private int addServicePrice;        // 추가서비스 단가
    private int addServiceQuantity;     // 추가서비스 수량

    public AddServiceVO() {
    }

    public AddServiceVO(ServiceVO serviceCode, int addServicePrice, int addServiceQuantity) {
        this.serviceCode = serviceCode;
        this.addServicePrice = addServicePrice;
        this.addServiceQuantity = addServiceQuantity;
    }

    public ServiceVO getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(ServiceVO serviceCode) {
        this.serviceCode = serviceCode;
    }

    public int getAddServicePrice() {
        return addServicePrice;
    }

    public void setAddServicePrice(int addServicePrice) {
        this.addServicePrice = addServicePrice;
    }

    public int getAddServiceQuantity() {
        return addServiceQuantity;
    }

    public void setAddServiceQuantity(int addServiceQuantity) {
        this.addServiceQuantity = addServiceQuantity;
    }
}
