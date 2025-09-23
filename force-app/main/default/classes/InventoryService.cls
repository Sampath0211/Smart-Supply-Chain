public with sharing class InventoryService {
    public static void checkAndReorder(List<Inventory__c> inventories) {
        List<Reorder_Request__c> reorders = new List<Reorder_Request__c>();
        for (Inventory__c inv : inventories) {
            if (inv.Quantity__c <= inv.Reorder_Level__c) {
                reorders.add(new Reorder_Request__c(
                    Product__c = inv.Product__c,
                    Warehouse__c = inv.Warehouse__c,
                    Quantity__c = inv.Reorder_Level__c - inv.Quantity__c
                ));
            }
        }
        if (!reorders.isEmpty()) {
            insert reorders;
        }
    }
}
