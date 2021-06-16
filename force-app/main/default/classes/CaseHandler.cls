public class CaseHandler {
    public static void updateMileStones(map<Id,case> caseNewMap,map<Id,case> caseOldMap){
        List<CaseMilestone> CaseMilestoneUpdateList = new list<CaseMilestone>();
        for(case caseObj:[select ID,First_Replay_Time__c,Status,(select Id,IsCompleted,CompletionDate,MilestoneType.Name  from CaseMilestones) 
                          from  case  where id in:caseNewMap.keyset()]){
                              
                              CaseMilestone firstResponseTime  = new CaseMilestone();
                              CaseMilestone resolutionTime   = new CaseMilestone();
                              
                              for(CaseMilestone CaseMilestoneObj:caseObj.CaseMilestones){
                                  if(CaseMilestoneObj != null && CaseMilestoneObj.MilestoneType.Name=='First Response Time'){
                                      firstResponseTime=CaseMilestoneObj;
                                      
                                  }else if(CaseMilestoneObj != null && CaseMilestoneObj.MilestoneType.Name=='Resolution Time'){
                                      resolutionTime=CaseMilestoneObj;
                                      
                                  }
                              }
                              
                              if((caseObj.First_Replay_Time__c!=null || caseObj.Status=='closed') && firstResponseTime.id != null && firstResponseTime.completionDate==null){
                                  firstResponseTime.completionDate =System.now();
                                  CaseMilestoneUpdateList.add(firstResponseTime);
                                  
                              }
                              if((caseObj.Status=='closed'||caseObj.Status=='Escalated')&& resolutionTime.id != null && !resolutionTime.IsCompleted){
                                  resolutionTime.completionDate =System.now();
                                  CaseMilestoneUpdateList.add(resolutionTime);  
                              }
                              if((caseObj.Status=='New')){
                                  resolutionTime.completionDate =null;
                                  CaseMilestoneUpdateList.add(resolutionTime);  
                              }
                              
                          } 
        
        update CaseMilestoneUpdateList;
    }
    
}