@IsTest  
public class UtilityTest {
    @TestSetup  
    private static void setup() {
        UserRole r = new UserRole(DeveloperName = 'test', Name = 'bajaj');
        insert r;
        User u = new User(
            ProfileId = [SELECT Id FROM Profile WHERE Name = 'Standard User'].Id,
            LastName = 'Bajaj finance',
            Email = 'bajaj@gmail.com',
            Username = 'bajaj@gmail.com' + System.currentTimeMillis(),
            CompanyName = 'BAJAJ',
            Title = 'title',
            Alias = 'alias',
            TimeZoneSidKey = 'America/Los_Angeles',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            UserRoleId = r.Id
        );
    }
    @IsTest
    public static void utilityTestmethod() {
        map<Id,Id> parent_Parent = new map<Id,Id>();
        map<Id, set<Id>> parentAndChildren = new map<Id, set<Id>>();
        User u = [select FirstName, Id, LastName, UserRoleId, UserRole.Name from User limit 1];
        UserRole rol =[Select Id, Name, DeveloperName, ParentRoleId From UserRole limit 1];
        for(UserRole ur : [select Id, ParentRoleId from UserRole]) {
            parent_Parent.put(ur.Id,ur.ParentRoleId);
        }
        Utility.getParents(rol.Id,parent_Parent);
        Utility.getSubordinateRoles(rol.Id);
        Utility.getSubordinateRoles(rol, rol.Id, parentAndChildren);
    }
}