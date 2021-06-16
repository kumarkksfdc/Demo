public class SOQL2 {
    Public list<selectOption> options	{set;get;}
    public list<Account> acc			{set;get;}
    public string selected				{set;get;}
    public SOQL2(){
        acc=[select name,phone,type from account limit 3];
        options=new List<SelectOption>();
         SelectOption n=new SelectOption('none','-none-');
          options.add(n);
        List<Integer> rows=new List<Integer>{1,5,10,15,25};
            for(Integer i=0;i<rows.size();i++){
          	SelectOption op=new SelectOption(String.valueof(rows[i]),String.valueof(rows[i]));
            options.add(op);
         }
    }
    public void reset(){
        Integer size=Integer.valueOf(selected);  //  '5'  '10'+'10' =='1010' 
        acc=[select name,phone,type from Account LIMIT :size];
    }
    

}