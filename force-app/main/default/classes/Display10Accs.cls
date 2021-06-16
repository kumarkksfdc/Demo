public class Display10Accs {
@AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accs = [select Id, Name, Type, Industry from Account LIMIT 100];
        return accs;
    }

}