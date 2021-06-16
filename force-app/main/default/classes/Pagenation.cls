public with sharing class Pagenation {
    @AuraEnabled
    public static AccountPagerWrapper fetchaccounts(Decimal pageNumber, Integer recordToDisplay) {
        SYSTEM.DEBUG(pageNumber+'  '+recordToDisplay);
        Integer pageSize=recordToDisplay;
        Integer offset=((Integer)pageNumber - 1) * pageSize;
        AccountPagerWrapper acc=new AccountPagerWrapper();
        acc.pageSize=pageSize;
        acc.page=(Integer)pageNumber;
        acc.total=[SELECT count() FROM Account];
        acc.accounts=[SELECT Id,Name,Phone from Account ORDER BY Name LIMIT:recordToDisplay OFFSET:offset];
        System.debug(acc);
        return acc;
    }
    
    public class AccountPagerWrapper{
        @AuraEnabled public Integer pageSize {get;set;}
        @AuraEnabled public Integer page {get;set;}
        @AuraEnabled public Integer total {get;set;}
        @AuraEnabled public List<Account> accounts {get;set;}
    }
}