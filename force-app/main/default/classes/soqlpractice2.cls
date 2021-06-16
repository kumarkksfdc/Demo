public class soqlpractice2 {
    public list<selectoption> options		{set;get;}
    public list<account> acc				{set;get;}
    public String selected			   		{set;get;}
    public soqlpractice2(){
        acc=[select name,phone,type from account limit:5];
        options=new list<selectoption>();
        selectoption N= new selectoption('none','-none-');
        options.add(N);
        list<integer> rows=new list<Integer>{5,10,12,14,34};
            for(integer i=0;i<rows.size();i++){
                selectoption op=new selectoption(string.valueOf(rows[i]),string.valueOf(rows[i]));
                options.add(op);
    			}
    		}
        
        public void pick(){

			integer size=integer.valueof(selected);    
            acc=[select name,phone,type from account limit:size];
            
        }
        
        
        
        
        


}