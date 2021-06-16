public class PolicyHolderHome {
    //public AgentHome(apexpages.StandardController controller){
    //}
    public list<pol__c> phi {set;get;}
   // public list<pol__c> motor {set;get;}
    //public list<pol__c> life {set;get;}
    public string name {set;get;}
    public pagereference AddPolicyHolder(){
        pagereference p=new pagereference('/apex/PolicyHolderCreation');
        return p;
    }
    public pageReference ViewPolicyHolder(){      
        pagereference p=new pagereference('/apex/PolicyHolderView');
        return p;
        //accountId=:acc.Id
    }
    public pageReference SearchPolicyHolder(){
        phi=[select PH_id__c,Phone__c,Currency__c from Pol__c where PH_id__c=:name];
        //motor=[select Name,Premium_End_Date__c from Motor_Insurance__c where PH_id__c in:phi];
        //life=[select Name,Premium_End_Date__c from Life_Insurance__c where];
        pagereference p=new pagereference('/apex/SearchPolicyHolder');
		return p;
    }
   
}