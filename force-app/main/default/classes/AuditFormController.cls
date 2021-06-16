public class AuditFormController {
    @AuraEnabled
    public static List<HM__AuditForm__c> method1(){
        List<HM__AuditForm__c> Af = HM__AuditForm__c.getall().values();
        return Af;
    }
}