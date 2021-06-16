public class casemergenewcontroller {
    
    @AuraEnabled
    public static CaseMerge fetchCases(id recordId) {
        
        system.debug('record Id'+recordId);
        String Str='';
        CaseMerge a=new CaseMerge();
        Case CaseQuery=[select id,CaseNumber,Subject,CreatedDate,Status,Priority,Origin,Type,Reason from Case where id =:recordId];
        Str=CaseQuery.Subject;
        list<Case> lstCase=[select Id,CaseNumber,Subject,CreatedDate,Status,Origin from Case where Subject =:Str ];
        for(Case c:lstCase)
        {
            WrapperCase w = new WrapperCase();
            w.ListCase=c;
            a.CaseList.add(w);
        }
        system.debug('A----------'+a);
        return a;
        
    }
    
    @AuraEnabled public static String createCloneAndInsertRelatedCases(List<Case> checkedCase){
        String i;
        if(checkedCase.size()>0)
        {
           /* for(Case c:checkedCase){
                System.debug('List Of Cases '+c.id);
                delete c;
            }*/
            i='1';
             delete checkedCase;
        }
        else{
            i='0';
        }
        return i;
    }
    
    Public Class CaseMerge{
        
        @AuraEnabled public list<WrapperCase> CaseList;
        public CaseMerge(){
            
            CaseList=new list<WrapperCase>();
        }
        
    }
    public class WrapperCase
    {
        @AuraEnabled public Case ListCase;
        @AuraEnabled public boolean Checked;
        public WrapperCase()
        {
            Checked=false;
            ListCase=NULL;
        }
    }    
    
}