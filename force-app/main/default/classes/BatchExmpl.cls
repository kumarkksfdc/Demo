global class BatchExmpl implements Database.Batchable<AggregateResult>,Database.Stateful {
    
    global Iterable<AggregateResult> Start(Database.BatchableContext bc){
        String Query='Select Owner.name,Industry,count(Id) Total  from Account group by Owner.name,Industry';
        return new AggregateResultIterable(query);
    }
    global void execute(Database.BatchableContext bc,List<sObject> scope){
        list<HM__SnapShot__c> snapShotList=new list<HM__SnapShot__c>();
        
        for(sObject a:scope){
            system.debug(a);
            HM__SnapShot__c SS=new HM__SnapShot__c();
            AggregateResult o = (AggregateResult)a;
            system.debug(o);
            //String ownerName = String.valueOf(o.get('Owner.Name'));
            system.debug('ownerName -- '+o.get('Name'));
            SS.HM__Case_Owner__c=String.valueOf(o.get('Name'));
            SS.HM__Industry__c=string.valueOf(o.get('Industry'));
            SS.HM__count__c=Integer.valueOf(o.get('Total'));	
            SS.HM__Created_Date__c=system.today()+1;
            snapShotList.add(SS);
        }
        if(snapShotList.size()>0){
            insert snapShotList;
        }
    }
    global void finish(Database.BatchableContext bc){    
    }
}

/* 
Global database.QueryLocator start(database.BatchableContext bc){
string query='SELECT Industry, COUNT(name), owner.name FROM Account GROUP BY Industry, owner.name';
return database.getQueryLocator(query);
}
global void execute(database.BatchableContext bc,list<account> scope){
list<HM__SnapShot__c> snapshotlist=new list<HM__SnapShot__c>();
for(account a:scope){
//a.ownership='public';
//a.type='prospect';
HM__SnapShot__c snapshot=new HM__SnapShot__c();
//snapshot.HM__Phone__c=a.Phone;
//snapshot.HM__Industry__c=a.Industry;
//snapshot.Name=a.Name;
snapshot.HM__Case_Owner__c=a.Owner.Name;
snapshot.HM__Energy_count__c=10;
snapshot.HM__Banking__c=12;
snapshot.HM__Agriculture__c=20;
snapshotlist.add(snapshot);
}
if(snapshotlist.size()>0){
Insert snapshotlist;
}

}
global void finish(database.BatchableContext bc){

}
}
*/