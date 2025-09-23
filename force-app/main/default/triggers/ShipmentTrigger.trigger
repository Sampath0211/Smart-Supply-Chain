trigger ShipmentTrigger on Shipment__c (after update) {
    for (Shipment__c sh : Trigger.new) {
        if (sh.Status__c == 'Delivered' && 
            Trigger.oldMap.get(sh.Id).Status__c != 'Delivered') {
            
            Order__c ord = [SELECT Id, Status__c 
                            FROM Order__c 
                            WHERE Id = :sh.Order__c 
                            LIMIT 1];
            ord.Status__c = 'Delivered';
            update ord;
        }
    }
}
