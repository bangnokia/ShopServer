package entity;
// Generated Nov 5, 2016 3:03:54 PM by Hibernate Tools 4.3.1



/**
 * ProductPropertyDetailId generated by hbm2java
 */
public class ProductPropertyDetailId  implements java.io.Serializable {


     private int propertyId;
     private int productId;

    public ProductPropertyDetailId() {
    }

    public ProductPropertyDetailId(int propertyId, int productId) {
       this.propertyId = propertyId;
       this.productId = productId;
    }
   
    public int getPropertyId() {
        return this.propertyId;
    }
    
    public void setPropertyId(int propertyId) {
        this.propertyId = propertyId;
    }
    public int getProductId() {
        return this.productId;
    }
    
    public void setProductId(int productId) {
        this.productId = productId;
    }




}


