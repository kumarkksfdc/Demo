public class LightningLeadInsert {
    @AuraEnabled
    public static Lead createLead(Lead l){
        system.debug(l);
        insert l;
        return l;
    }
}