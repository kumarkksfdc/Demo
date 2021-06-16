public class PracticesTrigger {
    public static void BeforeInsert(list<New_Student_Reg__c> nslist){
        for(New_Student_Reg__c ns:nslist){
            if(ns.Gender__c=='male'){
                ns.TYPE_OF_COURSES__c='IT';
                ns.CourseS__c='PHP';
             }
        }
    }
    public static void AfterInsert(list<New_Student_Reg__c> nslist1){
        //list<id> ids=new list<id>();
        for(New_Student_Reg__c ns:nslist1){
           // ids.add(ns.Id);
            if(ns.Email_Id__c!=null){
            //EmailTemplate et=[select Id from EmailTemplate where name='EM'];
			Messaging.SingleEmailMessage sm=new Messaging.SingleEmailMessage();
            // ms.setTemplateId(et.Id);
            //ms.setTargetObjectIds(ids);
            string[] toadd=new string[]{ns.Email_Id__c};
            sm.setToAddresses(toadd);
            sm.setSubject('newStudentAlert'); 
            sm.setPlainTextBody('new Student registration Completed'+ns.CourseS__c);    
            list<messaging.Email> email=new list<messaging.Email>{sm};
            messaging.sendEmail(email);
        }
        } 
    }
    public static void BeforeUpDate(map<id,New_Student_Reg__c> oldmap,map<id,New_Student_Reg__c> newmap){
        for(id key:oldmap.keySet()){
            New_Student_Reg__c oldstd=oldmap.get(key);
            New_Student_Reg__c newstd=newmap.get(key);
            if(oldstd.TYPE_OF_COURSES__c!='NON IT' && newstd.TYPE_OF_COURSES__c=='NON IT'){
                newstd.CourseS__c='ROBOTICS';
            }
        }
    }
    public static void AfterUpdate(map<id,New_Student_Reg__c> oldmap,map<id,New_Student_Reg__c> newmap){
        for(id key:oldmap.keySet()){
            New_Student_Reg__c oldstd=oldmap.get(key);
            New_Student_Reg__c newstd=newmap.get(key);
            if(oldstd.Contact_no__c!='9700124129' && newstd.Contact_no__c=='9700124129'){
                
                Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
                string[] toadd=new string[]{};
                toadd.add(oldstd.Email_Id__c);
                email.setToAddresses(toadd);
                email.setSubject('Alert');
                email.setPlaintextBody('new student contact updated as'+ newstd.Contact_no__c);
                list<messaging.Email> email1=new list<messaging.Email>{email};
                messaging.sendEmail(email1);    
            }
        }
    }
   public static void BeforeDelete(list<New_Student_Reg__c> nslist){
        for(New_Student_Reg__c ns:nslist){
            if(ns.End_Date__c<ns.Start_Date__c+90){
                ns.adderror('student course not completed');
            }
        }
    }
    public static void AfterDelete(list<New_Student_Reg__c> nslist){
        //list<id> ids=new list<id>();
        for(New_Student_Reg__c ns:nslist){
           /* [if(ns.CourseS__c=='IT'){
                             ---------------//ids.add(ns.Id);
                             //list<IT_Courses__c> ITlist=[select id from IT_Courses__c where id in:ids];
                             //delete ITlist;------------
                IT_Courses__c it=new IT_Courses__c();
                it.Name=ns.Name;
                it.Id=ns.Id;
                it.Institutes__c=ns.Institutes__c;
                insert it;
            }]*/
            STUDENTS__c s=new STUDENTS__c();
            s.Name=ns.Name;
            s.email_id__c=ns.Email_Id__c;
            s.StudentId__c=ns.Id;
            insert s;
        }
    }
}