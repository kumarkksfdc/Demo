public class oppTriggerHandler { 
    public static void beforeUpdate(map<Id,opportunity> oldmap,map<Id,opportunity> newmap){
        for(Id key:oldmap.keySet()){
            Opportunity old=oldMap.get(key);
            Opportunity newopty=newMap.get(key);
            if(old.StageName!='closed won' && newopty.StageName=='closed won'){
                newopty.CloseDate=system.today()+10;
                newopty.type='new customer';
         }
       }
   }
}