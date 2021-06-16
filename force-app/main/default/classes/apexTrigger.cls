public class apexTrigger {
    public static void beforeInsert(List<Opportunity> optyList){
        for(Opportunity op: optyList){
            if(op.stagename=='Prospecting'){
        	op.closeDate=System.today()+15;
        	op.type='New Customer';
        	op.LeadSource='Web';
            }
        }
    }
    public static void beforeUpdate(Map<Id,Opportunity> oldMap,Map<Id,Opportunity> newMap){
       	for(Id key : oldMap.keySet()){
        	Opportunity old=oldMap.get(key);
        	Opportunity newOpt=newMap.get(key);
        	if(old.stageName!='Closed won' && newOpt.stageName=='Closed won'){
            	newOpt.closeDate=System.today();
            	newOpt.type='New Customer';
        	}
    	}
    }
    public static void afterUpdate(Map<Id,Opportunity> oldMap,Map<Id,Opportunity> newMap){
        User u=[select id from User where alias='stud'];
    	List<contract> teams=new List<contract>();
    	for(Id key : oldMap.keySet()){
        	Opportunity old=oldMap.get(key);
        	Opportunity newOpt=newMap.get(key);
        	if(old.stageName!='Closed won' && newOpt.StageName=='Closed Won'){
                quote q=[select id,OpportunityId from quote where id=:newOpt.SyncedQuoteId limit 1];
            	/*OpportunityTeamMember otm=new OpportunityTeamMember();
            	otm.OpportunityId=key;
            	otm.UserId=u.id;
            	otm.opportunityAccessLevel='Read';
            	otm.TeamMemberRole='Account Manager';
            	teams.add(otm);*/
                contract c=new contract();
                c.AccountId=newOpt.AccountId;
                c.ActivatedDate=newOpt.CloseDate;
                c.BillingCity=q.BillingCity;
                teams.add(c);
        	}
	    }
    	insert teams;
    }
    

    

}