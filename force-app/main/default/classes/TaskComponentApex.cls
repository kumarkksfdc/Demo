public class TaskComponentApex {
    @AuraEnabled
    public static  account getselectOptions(id rid) {
        system.debug('rid --->' + rid);
        Account acc=[select id,name,ownerId,(select id,accountid,name from contacts) from account where id=:rid ];
        //system.debug('conlist --->' + conlist);
        return acc;
    }
    @AuraEnabled
    public static user getAccountOwner(id rid){
        Account acc=[select id,name,ownerId from account where id=:rid ];
        user u=[select id,name from user where id=:acc.OwnerId limit 1];
        system.debug('user id--->>>'+u);
        return u;
        
    }
    @AuraEnabled
    public static List<ID> getUsersList(ID OwnerId){
        list<id> usersList= new list<id>();
        set<id> userSet=new set<id>();
        set<id> roleList=new set<id>();
        User u = [select FirstName, Id, LastName, UserRoleId, UserRole.Name from User where Id=:OwnerId];
        UserRole role = [Select Id, Name, DeveloperName, ParentRoleId From UserRole Where Id=:u.UserRoleId limit 1];
        system.debug('UserRole values---->>>'+role);
        Id roleId=role.Id;
        roleList=Utility.getSubordinateRoles(roleId);
        system.debug('roleList values---->>>'+roleList);
        for(user u1:[select id,name,userRoleId from user where userRoleId IN:roleList and isActive=true]){
            if(u1.Id!=OwnerId){
                userSet.add(u1.id);   
            }
        }
        system.debug('userList size--->>>'+userSet.size());
        system.debug('userList values--->>>'+userSet);
        usersList.addAll(userSet);
        return usersList;
    }
    @AuraEnabled
    public static Map<String, String> getPicklists(String field){
        Map<String, String> options = new Map<String, String>();
        for (Schema.PicklistEntry p: Schema.getGlobalDescribe().get('Task').getDescribe().fields.getMap().get(field).getDescribe().getPicklistValues()) {
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    } 
    @AuraEnabled 
    public static void saveTask(Task tas , list<contact> contactlist,list<user> ulist){
        system.debug('tas-------------'+tas);
        system.debug('ulist-------------'+ulist);
        list<task> tasklist = new list<task>();
        String[] tmp1 = New String[]{};
            for(user u : ulist){
                tmp1.add(u.name);
             system.debug('tmp1-------------'+tmp1);

            }
        
        if(contactlist.size() > 0){
            for(contact con: contactlist){
                Task ts =new task();
                //ts =  tas;
                ts.WhatId = tas.WhatId;
                ts.OwnerId = tas.OwnerId;
                ts.Priority = tas.Priority;
                ts.Status = tas.Status;
                ts.Subject = tas.Subject;
                //ts.Visit_Type__c = tas.Visit_Type__c;
                ts.ActivityDate = tas.ActivityDate;
                //ts.Meeting_Outcome_2_Remarks__c =tas.Meeting_Outcome_2_Remarks__c;
                //ts.Meeting_Outcome_Remarks__c =  tas.Meeting_Outcome_Remarks__c;
                //ts.Product_Pitched__c =tas.Product_Pitched__c;
                ts.Type =tas.Type;
                //ts.Acompanied_with__c=string.join(tmp1,';');
                ts.WhoId = con.id;
                tasklist.add(ts);
            }
            system.debug('tasklist-------'+tasklist);
            insert tasklist;
        }
        else{
            insert tas;
        }
    } 
}