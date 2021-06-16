public class TestRoleHierachy {
    /* public static Set<ID> getParentRoleId(ID roleIds) {

        Set<ID> currentRoleIds = new Set<ID>();
    
        
        // get all of the parent roles.
        for(UserRole ur :[select Id, ParentRoleId from UserRole where Id=: roleIds]) {
            currentRoleIds.add(ur.ParentRoleId);
        }
    
        // go fetch some more rolls!
        if(currentRoleIds.size() > 0) {
            currentRoleIds.add(getParentRoleId(currentRoleIds));
        }
    
        return currentRoleIds;
    }*/
    
    /*
    
   public static Map<Id, Set<Id>> getRoleParentSubordinateUsers(Set<Id> userId) {  
        Map<Id, Id> roleIds = new Map<Id, Id>();  
        Map<Id, Set<Id>> parentRoleIds = new Map<Id, Set<Id>>();  
        // get requested user's role  
        for(User usr : [select Id, UserRoleId from User where Id IN: userId and UserRoleId != null]) {  
            roleIds.put(usr.UserRoleId, usr.Id);  
        }  
        Map<Id, Set<Id>> parentids = new Map<Id, Set<Id>>();  
        for(Id ids : roleIds.keySet()) {  
            parentRoleIds.put(ids, getAllParentRoleIds(new Set<ID>{ids}));  
        }  
        for(Id kys : parentRoleIds.keySet()) {  
            for(Id ids : parentRoleIds.get(kys)) {  
                if(!parentids.containsKey(ids)) {  
                    parentids.put(ids, new Set<Id>{kys});    
                } else {  
                    parentids.get(ids).add(kys);  
                }  
            }  
        }  
        Map<Id, Set<Id>> mapOfCurrentWithParentUsers = new Map<Id, Set<Id>>();  
        // get all of the ids for the users in those roles  
        for(User us : [Select Id, Name,UserRole.Name, UserRoleId From User where IsActive = true AND (UserRoleId IN: parentids.keySet() OR UserRoleId IN :roleIds.keySet())]){  
            for(Id rids : parentRoleIds.keySet()) {  
                if(parentids.containsKey(us.UserRoleId)){  
                    if(parentids.get(us.UserRoleId).contains(rids)) {  
                        if(!mapOfCurrentWithParentUsers.containsKey(roleIds.get(rids))) {  
                            mapOfCurrentWithParentUsers.put(roleIds.get(rids), new Set<Id>{us.id});   
                        } else {  
                            mapOfCurrentWithParentUsers.get(roleIds.get(rids)).add(us.Id);  
                        }  
                    }  
                }  
            }  
        }  
        // return the ids as a set so you can do what you want with them  
        return mapOfCurrentWithParentUsers;  
    }  
    private static Set<Id> getAllParentRoleIds(Set<ID> roleIds) {  
        Set<ID> mapOfCurrentWithParentRole = new Set<Id>();  
        // get all of the roles underneath the passed roles  
        for(UserRole userRole :[select Id, ParentRoleID from UserRole where Id IN :roleIds AND ParentRoleID != null])  
            mapOfCurrentWithParentRole.add(userRole.ParentRoleID);  
        // go fetch some more rolls!  
        if(mapOfCurrentWithParentRole.size() > 0){  
            mapOfCurrentWithParentRole.addAll(getAllParentRoleIds(mapOfCurrentWithParentRole));  
        }  
        return mapOfCurrentWithParentRole;  
    }  
    */
    
}