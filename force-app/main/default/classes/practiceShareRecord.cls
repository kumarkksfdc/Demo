//when ever account created or updated with ownership as private then share the record with kumar k
public class practiceShareRecord {
    public static void AfterInsert(list<account> acclist){
        user u=[select id from user where alias='mkuma'];
        list<accountShare> accshalist=new list<accountShare>();
        for(account a:acclist){
            if(a.ownership=='private'){
                accountShare s=new accountShare();
              	s.AccountId=a.id;
                s.AccountAccessLevel='edit';
               	s.RowCause='manual';
                s.OpportunityAccessLevel='read';
                s.UserOrGroupId=u.id;
                //s.id=a.Email__c;
                accshalist.add(s);
            }
        }
        insert accshalist;
    }
}