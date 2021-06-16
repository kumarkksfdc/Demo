public class caseSearch {
 @AuraEnabled
 public static List < case > fetchAccount(String searchKeyWord) {
  String searchKey = searchKeyWord + '%';
  List < case > returnList = new List < case > ();
  List < case > lstOfAccount = [select id, Subject from case where Subject LIKE: searchKey];
 
  for (case acc: lstOfAccount) {
     returnList.add(acc);
     }
  return returnList;
 }
}