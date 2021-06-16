GLobal class Batchstatefull implements database.Batchable<Sobject>,database.stateful{
    Global Integer count=0;
    GLobal static Integer size=0;
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select lastname,firstname from contact');
        
    }
    Global void execute(database.BatchableContext bc,list<contact> scope){
        for(contact con:scope){
            con.lastname='kankari';
            size=size+1;
            count=count+1;
        }
        update scope;
    }
    Global void finish(database.BatchableContext bc){
        contact con=new contact();
        con.lastname='count:'+count+ 'size:'+size;
        insert con;
        
    }
    
}