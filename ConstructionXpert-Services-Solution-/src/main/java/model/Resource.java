package model;

public class Resource {
    private int resourceId;
    private Task task;
    private String resourceName;
    private ResourceType type;
    private int quantity;
    private String supplierInformation;

    public Resource() {
    }

    public Resource(String resourceName, ResourceType type, int quantity, String supplierInformation) {
        this.resourceName = resourceName;
        this.type = type;
        this.quantity = quantity;
        this.supplierInformation = supplierInformation;
    }

    public Resource(int resourceId, Task task, String resourceName, ResourceType type, int quantity, String supplierInformation) {
        this.resourceId = resourceId;
        this.task = task;
        this.resourceName = resourceName;
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
