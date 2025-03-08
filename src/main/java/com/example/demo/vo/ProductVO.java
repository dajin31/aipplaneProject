package com.example.demo.vo;

public class ProductVO {
   private String prodId;
   private String prodName;
   private int unitPrice;
   private int stockQty;
   private String category;
   private String detail;
   private String ingredientca;
   private String use;

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getIngredientca() {
        return ingredientca;
    }

    public void setIngredientca(String ingredientca) {
        this.ingredientca = ingredientca;
    }

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public String getProdId() {
        return prodId;
    }

    public void setProdId(String prodId) {
        this.prodId = prodId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getStockQty() {
        return stockQty;
    }

    public void setStockQty(int stockQty) {
        this.stockQty = stockQty;
    }

    @Override
    public String toString() {
        return "ProductVO{" +
                "prodId='" + prodId + '\'' +
                ", prodName='" + prodName + '\'' +
                ", unitPrice=" + unitPrice +
                ", stockQty=" + stockQty +
                ", category='" + category + '\'' +
                ", detail='" + detail + '\'' +
                ", ingredientca='" + ingredientca + '\'' +
                ", use='" + use + '\'' +
                '}';
    }


}
