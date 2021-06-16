public class LightningAccountInsert {
    @AuraEnabled
    public static account new_Account(account acc){
        system.debug('jhdgjhgjf'+acc);
        insert acc;
        return acc;
    }
}