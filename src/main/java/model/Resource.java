package model;

public class Resource {
    private int resourceId;
    private Task task;
    private String resourceName;
    private String resourceImg;
    private ResourceType type;
    private int quantity;
    private String supplierInformation;

    public Resource() {
    }

    public Resource(String resourceName, String resourceImg, ResourceType type, int quantity, String supplierInformation) {
        this.resourceName = resourceName;
        this.resourceImg = resourceImg;
        this.type = type;
        this.quantity = quantity;
        this.supplierInformation = supplierInformation;
    }

    public Resource(Task task, String resourceName, String resourceImg, ResourceType type, int quantity, String supplierInformation) {
        this.task = task;
        this.resourceName = resourceName;
        this.resourceImg = resourceImg;
        this.type = type;
        this.quantity = quantity;
        this.supplierInformation = supplierInformation;
    }

    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getResourceImg() { return resourceImg; }

    public void setResourceImg(String resourceImg) { this.resourceImg = resourceImg; }

    public ResourceType getType() {
        return type;
    }

    public void setType(ResourceType type) {
        this.type = type;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSupplierInformation() {
        return supplierInformation;
    }

    public void setSupplierInformation(String supplierInformation) {
        this.supplierInformation = supplierInformation;
    }
}
