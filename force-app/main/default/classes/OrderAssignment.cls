public with sharing class OrderAssignment {
    public static void assignOrders(List<Order__c> orders) {
        for (Order__c o : orders) {
            if (o.Product__r.Category__c == 'Groceries') {
                o.OwnerId = '005XXXXXXXXXXX1'; // Replace with Warehouse Manager 1 Id
            } else if (o.Product__r.Category__c == 'Electronics') {
                o.OwnerId = '005XXXXXXXXXXX2'; // Replace with Warehouse Manager 2 Id
            }
        }
        if (!orders.isEmpty()) {
            update orders;
        }
    }
}
