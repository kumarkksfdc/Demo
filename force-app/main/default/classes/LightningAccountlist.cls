public class LightningAccountlist {
   @AuraEnabled
    public static List<Account> getAccounts() {
    return [SELECT Id, name, industry, Type, Phone FROM Account ORDER BY createdDate ASC];
  }
}