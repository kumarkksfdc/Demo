public class LightningSOQLofAccount {
    @AuraEnabled
    public static list<Account> getAccounts(account acc){
        return[SELECT id,name,phone from Account where CreatedDate=LAST_N_DAYS:90 LIMIT 10];
    }
}