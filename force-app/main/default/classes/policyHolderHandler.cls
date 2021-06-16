public class policyHolderHandler {
    public static void getNoOfPolicyHolders(list<HM__Pol__c> policyHoldersList){
        Set<Id> Ids=new Set<id>();
        for(HM__Pol__c policyholder:policyHoldersList){
            if(policyholder.HM__Active__c==true){
                Ids.add(policyholder.HM__Agent__c);
            }
        }
        system.debug('Agent Ids---->>>'+Ids.size());
        List<HM__Agent__c> AgentList=[select id,HM__No_of_Pol__c,(select id,HM__Active__c,HM__Agent__c from Policy_Holders__r where HM__Active__c=true) from HM__Agent__c where id IN:Ids];
        system.debug('AgentList---->>>'+AgentList);
        list<HM__Agent__c> agentUpdateList=new List<HM__Agent__c>();
        for(HM__Agent__c agent:AgentList){
            agent.HM__No_of_Pol__c=agent.Policy_Holders__r.size();
            system.debug('NoOfPolicyHolders---->>>'+agent.HM__No_of_Pol__c);
            agentUpdateList.add(agent);
        }
        if(!agentUpdateList.isEmpty()){
            update agentUpdateList;
        }
    }
    
    public static void getNoOfPolicyHoldersAfterDelete(list<HM__Pol__c> policyHoldersList){
        Set<Id> Ids=new Set<id>();
        for(HM__Pol__c policyholder:policyHoldersList){
            if(policyholder.HM__Active__c==true){
                Ids.add(policyholder.HM__Agent__c);
            }
        }
        system.debug('Agent Ids---->>>'+Ids.size());
        List<HM__Agent__c> AgentList=[select id,HM__No_of_Pol__c,(select id,HM__Active__c,HM__Agent__c from Policy_Holders__r where HM__Active__c=true) from HM__Agent__c where id IN:Ids];
        system.debug('AgentList---->>>'+AgentList);
        list<HM__Agent__c> agentUpdateList=new List<HM__Agent__c>();
        for(HM__Agent__c agent:AgentList){
            agent.HM__No_of_Pol__c=agent.Policy_Holders__r.size();
            system.debug('NoOfPolicyHolders---->>>'+agent.HM__No_of_Pol__c);
            agentUpdateList.add(agent);
        }
        if(!agentUpdateList.isEmpty()){
            update agentUpdateList;
        }
    }
    
    public static void getNoOfPolicyHoldersAfterUpdate(Map<Id,HM__Pol__c> OldMap,Map<Id,HM__Pol__c> NewMap){
        set<id> mapkeys=oldmap.keySet();
        set<id> updatedIds=new set<id>();
        for(id i:mapkeys){
            HM__Pol__c o=oldmap.get(i);
            HM__Pol__c n=newmap.get(i);
            if(n.HM__Active__c!=o.HM__Active__c){
                updatedIds.add(n.HM__Agent__c);
            }
        }
         system.debug('Agent updatedIds---->>>'+updatedIds.size());
        
        List<HM__Agent__c> AgentList=[select id,HM__No_of_Pol__c,(select id,HM__Active__c,HM__Agent__c from Policy_Holders__r where HM__Active__c=true) from HM__Agent__c where id IN:updatedIds];
        system.debug('AgentList---->>>'+AgentList);
        list<HM__Agent__c> agentUpdateList=new List<HM__Agent__c>();
        for(HM__Agent__c agent:AgentList){
            agent.HM__No_of_Pol__c=agent.Policy_Holders__r.size();
            system.debug('NoOfPolicyHolders---->>>'+agent.HM__No_of_Pol__c);
            agentUpdateList.add(agent);
        }
        if(!agentUpdateList.isEmpty()){
            update agentUpdateList;
        }
        
    } 
}