Global class EmailsendtoLeads implements Database.Batchable<SObject>{
    global database.QueryLocator start(database.BatchableContext kk){
        return database.getquerylocator('select phone,Email from Lead');
    }
    list<id> toadd=new list<id>();
    global void execute(database.BatchableContext kk,list<Lead> Leads){
        for(Lead ins: Leads){
            ins.phone='44444444';
            toadd.add(ins.Id);
        }update Leads;
    }
    global void finish(database.BatchableContext kk){
        messaging.MassEmailMessage mem=new messaging.MassEmailMessage();
        Emailtemplate et=[select id from Emailtemplate where name='EM'];
        mem.setTargetObjectIds(toadd);
        //mem.setDescription('phone no is updated');
        mem.setTemplateId(et.id);
        list<messaging.Email> email=new list<messaging.Email>{mem};
            messaging.sendemail(email);
    }
}