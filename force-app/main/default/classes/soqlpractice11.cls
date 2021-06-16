public class soqlpractice11 {
    public list<soqlpractice1> wrap				{set;get;}
    public soqlpractice11(){
        list<account>  acc=[select name,phone,rating,type from account where rating='hot' limit:10];
        wrap=new list<soqlpractice1>();
        for(account a:acc){
            soqlpractice1 soql=new soqlpractice1();
            soql.acc=a;
            soql.flag=false;
            wrap.add(soql);
        }
        
    }
    
    
    
}