package entity;
// Generated Jun 14, 2017 2:13:46 PM by Hibernate Tools 4.3.1



/**
 * Rate generated by hbm2java
 */
public class Rate  implements java.io.Serializable {


     private Integer id;
     private Integer productId;
     private Integer rate;
     private String content;
     private Integer userId;

    public Rate() {
    }

    public Rate(Integer productId, Integer rate, String content, Integer userId) {
       this.productId = productId;
       this.rate = rate;
       this.content = content;
       this.userId = userId;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getProductId() {
        return this.productId;
    }
    
    public void setProductId(Integer productId) {
        this.productId = productId;
    }
    public Integer getRate() {
        return this.rate;
    }
    
    public void setRate(Integer rate) {
        this.rate = rate;
    }
    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }




}


