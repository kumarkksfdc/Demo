public class AgentHandler {
    public static void validationMethod(List<HM__Agent__c> agentsList, map<id,HM__Agent__c> Oldmap){
        Set<Id> Ids=new Set<Id>();
        for(HM__Agent__c agent:agentsList){
            if(agent.HM__DOB__c!=Oldmap.get(agent.id).HM__DOB__c){
                agent.HM__DOB__c.addError('you can not edit the DOB');
            }
            if(agent.HM__Phone__c!=Oldmap.get(agent.id).HM__Phone__c){
                Ids.add(agent.id);
            }
        }
        List<HM__Pol__c> updatePolicyHolderList=new List<HM__Pol__c>();
        List<HM__Pol__c> modifiedAgentsList=[select id,HM__Agent__r.HM__Phone__c,HM__Agent__c from HM__Pol__c where HM__Agent__c In:Ids];
        for(HM__Pol__c policy:modifiedAgentsList){
            policy.HM__Phone__c=policy.HM__Agent__r.HM__Phone__c;
            updatePolicyHolderList.add(policy);
        }
        if(!updatePolicyHolderList.isEmpty())
            update updatePolicyHolderList;
    }
    public static void deletionMethod(List<HM__Agent__c> agentsList){
        Set<Id> Ids=new Set<Id>();
        for(HM__Agent__c agent:agentsList){
            Ids.add(agent.id);
       }
        List<HM__Pol__c> policyholderslist=[select id,HM__Agent__c from HM__Pol__c where HM__Agent__c IN:Ids];
        for(HM__Agent__c agents:agentsList){
            if(policyholderslist.size()>0){
                agents.AddError('You can not delete parent becoz it has child Record');
            }
        }
    }
}