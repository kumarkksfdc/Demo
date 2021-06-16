public with sharing class Utility {
    static set<Id> parentIds= new Set<Id>();
    static map<Id,Id> parent_Parent = new map<Id,Id>();
    public static set<Id> getSubordinateRoles(Id roleId) {
        set<id> userList=new set<id>();
        map<Id, set<Id>> parentAndChildren = new map<Id, set<Id>>();
        set<Id> children;
        UserRole rol =[Select Id, Name, DeveloperName, ParentRoleId From UserRole Where Id=:roleId];
        for(UserRole ur : [select Id, ParentRoleId from UserRole]) {
            // For Getting the Children Ids
            children = parentAndChildren.containsKey(ur.ParentRoleId) ? parentAndChildren.get(ur.ParentRoleId) : new set<Id>();
            children.add(ur.Id);
            parentAndChildren.put(ur.ParentRoleId, children);
            // For Getting the siblings Ids
            if(ur.ParentRoleId ==rol.ParentRoleId){
                children = parentAndChildren.containsKey(ur.ParentRoleId) ? parentAndChildren.get(ur.ParentRoleId) : new set<Id>();
                children.add(ur.Id);
                parentAndChildren.put(ur.ParentRoleId, children);
            }
            //For Getting the Parent Parent Ids
            parent_Parent.put(ur.Id,ur.ParentRoleId);
            system.debug('parent_Parent values---->>>>'+parent_Parent);
        }
        system.debug('parentAndChildren size----->>>>'+parentAndChildren.size());
        system.debug('parentAndChildren----->>>>'+parentAndChildren);
        
        getParents(roleId,parent_Parent);
        parentIds.addAll(getSubordinateRoles(rol,roleId, parentAndChildren));
        system.debug('parentids:::'+parentIds);
        system.debug('parentids size:::'+parentIds.size());
        return parentIds;
    }
    
    public static set<Id> getSubordinateRoles(UserRole rol,Id roleId, map<Id, set<Id>> parentAndChildren) {
        set<Id> subordinateRoles = new set<Id>();
        set<Id> remainingSubordinateRoles = new set<Id>();
        if(parentAndChildren.containsKey(roleId)) {
            subordinateRoles.addAll(parentAndChildren.get(roleId));
            for(Id subRoleId : subordinateRoles) {
                remainingSubordinateRoles.addAll(getSubordinateRoles(rol,subRoleId, parentAndChildren));
            }
        }
        if(parentAndChildren.containsKey(rol.ParentRoleId)){
            subordinateRoles.addAll(parentAndChildren.get(rol.ParentRoleId));
        }
        subordinateRoles.addAll(remainingSubordinateRoles);
        system.debug('subordinateRoles size---->>>>'+subordinateRoles.size());
        system.debug('subordinateRoles---->>>>'+subordinateRoles);
        return subordinateRoles;
    }
    public static void getParents(string roleId,map<Id,Id> parent_Parent) {
        if(parent_Parent.containskey(roleId)){
            string presentParentId = parent_Parent.get(roleId);
            if(String.isNotBlank(presentParentId)){
                parentIds.add(parent_Parent.get(roleId));
                getParents(presentParentId,parent_Parent);
            }  
        }
    }
}