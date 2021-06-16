public class DisplayListofAccount {
    @AuraEnabled
    public static void getacc(String Id){
        system.debug('inside method----');
        Integer Year = Date.Today().Year();
        list<Account> contactList=[select id,(select id,LastName,HM__Current_Year__c from contacts) from Account where Id=:Id limit 1];
        system.debug('contactList--->>'+contactList);
        if(contactList.size()>0){
            contact c=new contact();
            for(Account acc:contactList){
                for(contact con:acc.contacts){
                    if(con.HM__Current_Year__c!=Year){
                        c.LastName='test URL';
                        c.HM__Current_Year__c=Year;
                        c.AccountId=Id;
                        insert c;
                    }
                }
            }
            
            
            c.HM__URL__c='https://newdevapp-dev-ed.lightning.force.com?Id='+c.Id;
            update c;
        }
        else if(contactList.size()==0){
            system.debug('contactList--->>'+contactList);
            contact c=new contact();
            c.LastName='test URL';
            c.HM__Current_Year__c=Year;
            c.AccountId=Id;
            insert c;
        
        c.HM__URL__c='https://newdevapp-dev-ed.lightning.force.com?Id='+c.Id;
        update c;
        }
        //return [select Id,Name,Phone from account LIMIT 5];
    }
}