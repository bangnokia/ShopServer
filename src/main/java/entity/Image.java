package entity;
// Generated Oct 14, 2016 11:30:50 AM by Hibernate Tools 4.3.1



/**
 * Image generated by hbm2java
 */
public class Image  implements java.io.Serializable {


     private Integer id;
     private Integer productId;
     private String url;

    public Image() {
    }

    public Image(Integer productId, String url) {
       this.productId = productId;
       this.url = url;
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
    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }




}

