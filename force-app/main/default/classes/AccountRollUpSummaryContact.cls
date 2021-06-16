public class AccountRollUpSummaryContact {
    
    public static void AfterInsert(list<contact> conList){
        set<id> AccIds=new set<id>();
        for(contact c:conList){
            Accids.add(c.AccountId);
        }
        list<account> accList=[select id,totalSalary__c,(select id,salary__c from contacts) from account where id in :accids];
        for(account a:acclist){
            decimal sal=0;
            for(contact c:a.contacts){
                sal=sal+c.Salary__c;
            }
            a.TotalSalary__c=sal;
        }
        update accList;
        list<contact> Listcon=[select id,salary__c,account.totalsalary__c from contact where id in :accids];
        integer sum=listcon.size();
        for(contact f:listcon){
            f.Salary__c=(f.account.totalsalary__c)/sum;
        }
        update listcon;
    }
    
    public static void AfterDelete(map<id,contact> oldmap){
        set<id> idList=oldmap.keySet();
        list<account> accs=[select id,totalSalary__c,(select id,salary__c from contacts) from account where id in : idList];
        for(account a:accs){
            decimal sal=0;
            for(contact c:a.contacts){
                sal=sal+c.Salary__c;
            }
            a.TotalSalary__c=sal;
        }
        update accs;
    }
    
    public static void afterupdate(map<id,contact> oldmap,map<id,contact> newmap){
        set<id> mapkeys=oldmap.keySet();
        set<id> updated=new set<id>();
        for(id i:mapkeys){
            contact o=oldmap.get(i);
            contact n=newmap.get(i);
            if(n.Salary__c!=o.Salary__c){
                updated.add(n.AccountId);
            }
        }
        list<account> acList=[select id,totalSalary__c,(select id,salary__c from contacts) from account where id in:updated];
        for(account a:acList){
            decimal sal=0;
            for(contact c:a.contacts){
                sal=sal+c.Salary__c;
            }
            a.TotalSalary__c=sal;
        }
        update acList;
    }
}