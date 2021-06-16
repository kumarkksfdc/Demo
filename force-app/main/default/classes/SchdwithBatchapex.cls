global class SchdwithBatchapex implements database.Batchable<Sobject>,schedulable {
    GLobal String Query;
    GLobal String FieldName;
    GLobal String value;
    global SchdwithBatchapex(String Query,String FieldName,String value){
        				this.query=query;
				        this.FieldName=FieldName;
       				    this.value=value; 
    		}
    global database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator(query);
    }
  
    global void execute(database.BatchableContext bc,List<Sobject> scope){
        for(Sobject s:scope){
            s.put(FieldName,value);
     	   }
        
    }
    global void finish(database.BatchableContext bc){
        
    }
    global void execute(schedulableContext sc){
        string query='select id,ownership from account';
        SchdwithBatchapex sb=new SchdwithBatchapex(query,'ownership','public');
      	Id JobId=database.executeBatch(sb,10);
    }
}