public class ContactValidationHandler {
    public static void beforeInsert(list<contact> con){
        set<id> ids=new set<id>();
        for(contact c:con){
            ids.add(c.AccountId);
        }
    }

}