public with sharing class AllUserRoleQuery{
    public static Map<Id, List<UserRole>> hierarchy
    {
        get
        {
            if (hierarchy == null)
            {
                hierarchy = new Map<Id, List<UserRole>>();
                for (UserRole role : [SELECT name,ParentRoleId FROM UserRole])
                {
                    if (!hierarchy.containsKey(role.ParentRoleId))
                        hierarchy.put(role.ParentRoleId, new List<UserRole>());
                    hierarchy.get(role.ParentRoleId).add(role);
                }
            }
            system.debug('Role hierarchy--->>>'+hierarchy.size());
            system.debug('Role hierarchy--->>>'+hierarchy);
            return hierarchy;
        }
        private set;
    }
    public static List<UserRole> getChildren(Id userRoleId)
    {
        return hierarchy.containsKey(userRoleId) ? hierarchy.get(userRoleId) : new List<UserRole>();
    }
    
    // I would just use one of the below and name it getSubHierarchy
    // Not entirely clear based on OP if top-level should be included
    public static Set<Id> getSubHierarchyInclusive(Id userRoleId)
    {
        Set<Id> roleIds = new Set<Id> { userRoleId };
            for (UserRole childRole : getChildren(userRoleId))
            roleIds.addAll(getSubHierarchyInclusive(childRole.Id));
        system.debug('roleIds --->>>'+roleIds.size());
        system.debug('roleIds --->>>'+roleIds);
        return roleIds;
    }
    
    public static List<User> getUsersUnder(Id userRoleId)
    {
        return [
            SELECT Id FROM User
            WHERE UserRoleId IN :getSubHierarchyInclusive(userRoleId) AND IsActive=true
        ];
    }
}