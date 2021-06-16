public class wrapperpractice3 {
    public decimal amount		{set;get;}
    public decimal intrest		{set;get;}
    public decimal totalamount  {set;get;}
    
    Public void intrest(){
        totalamount=amount+(amount*2*intrest)/100;
    }
    

}