global class LeadProcessor Implements Database.Batchable<SObject>{
    global Database.QueryLocator start(Database.BatchableContext kk){
        return database.getQueryLocator('select id,name,leadsource from Lead');
    }
    global void Execute(Database.BatchableContext kk, list<Lead> ld){
        for(Lead l:ld){
            l.LeadSource='Dreamforce';
        }
        update ld;
    }
    global void finish(Database.BatchableContext kk){
        system.debug('update sucessfully');
    }
}