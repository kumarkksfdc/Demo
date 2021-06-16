public class MyDetails1 {
    public lead led				{set;get;}
    public case cas				{set;get;}
    public contact con			{set;get;}
        public MyDetails1(){
            led=new lead();
            cas=new case();
            con=new contact();

   }
}