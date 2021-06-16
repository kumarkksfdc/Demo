public class PracticeOnRelatedObjects {
    public static void afterinsert(list<contact> cons){
        set<id> ids=new set<id>();
        for(contact c:cons){
            ids.add(c.accountid);
        }
        decimal total=0;
        list<contact> con=[select id,salary__c from contact where accountid in:ids];
        list<account> acc=[select id from account where id in:ids];
        for(contact c:con){
            total+=c.Salary__c;
        }
        for(account a:acc){
            a.AnnualRevenue=total;
            update a;
        }
    }
    
    public static void afterdelete(list<contact> cons){
        set<id> ids=new set<id>();
        for(contact c:cons){
            ids.add(c.accountid);
        }
        decimal total=0;
        list<contact> con=[select id,salary__c from contact where accountid in:ids];
        list<account> acc=[select id from account where id in:ids];
        for(contact c:con){
            total+=c.Salary__c;
        }
        for(account a:acc){
            a.AnnualRevenue=total;
            update a;
        }
    }
   /* public static void afterUndelete(list<contact> cons){
        set<id> ids=new set<id>();
        for(contact c:cons){
            ids.add(c.accountid);
        }
        decimal total=0;
        list<contact> con=[select id,salary__c from contact where accountid in:ids];
        list<account> acc=[select id from account where id in:ids];
        for(contact c:con){
            total+=c.Salary__c;
        }
        for(account a:acc){
            a.AnnualRevenue=total;
            update a;
        }  
    }*/
}