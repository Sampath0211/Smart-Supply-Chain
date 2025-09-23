trigger ReorderRequestTrigger on Inventory__c (after insert, after update) {
    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        InventoryService.checkAndReorder(Trigger.new);
    }
}
