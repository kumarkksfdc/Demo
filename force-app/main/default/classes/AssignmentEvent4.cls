public class AssignmentEvent4 {
    @Auraenabled
    public static List<Account> getAccounts()
    {
        System.debug('In controller getAccounts method..');
        return [Select ID,Name from Account ORDER BY CREATEDDATE DESC LIMIT 10];
    }
    @Auraenabled
    public static void delteAccountById(String accid)
    {
        System.debug('In controller delteAccountById method..');
        Account delAccount =[Select Id from Account where id=:accid];
        delete delAccount;  
    }

}