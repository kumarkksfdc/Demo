public class DmlSavept {
    public void example(){
        list<Account> acc=new list<Account>();
        account a1=new account();
        a1.name='kumara varma';
        a1.phone='2000';
        acc.add(a1);
        account a2=new account();
        a2.phone='2000';
        acc.add(a2);
		database.SaveResult[] res=database.insert(acc,false);
        	for(database.SaveResult r:res){
       			if(r.issuccess()){
            		system.debug('insertion success,id:'+r.getid());
       			}else{
           			for(database.Error er:r.getErrors()){
        				 system.debug('insertion failed,msg:'+er.getmessage());
           				system.debug('insertion failed fields:'+er.getfields());
           }
       }
        }
    }

}