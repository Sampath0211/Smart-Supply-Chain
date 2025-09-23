global class EscalationJob implements Schedulable {
    global void execute(SchedulableContext sc) {
        List<Shipment__c> delayed = [
            SELECT Id, Status__c 
            FROM Shipment__c 
            WHERE Status__c = 'In Transit' 
            AND CreatedDate < :System.now().addDays(-7)
        ];
        for (Shipment__c sh : delayed) {
            sh.OwnerId = '005XXXXXXXXAdmin'; // Replace with Admin User Id
        }
        if (!delayed.isEmpty()) {
            update delayed;
        }
    }
}
