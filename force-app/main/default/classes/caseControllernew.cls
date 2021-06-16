public class caseControllernew {
   @auraenabled
   public static case[] queryContactRecords(){
       case[] a=[select Id,Status,priority,type,subject,Origin,CaseNumber,CreatedDate from case];
       System.debug(a);
       return a;
   }    
}