//.............write a program to count the total amount of opportunity and display in account............





/*global class practicestateful implements Database.Batchable<sObject>, Database.Stateful{
 	 //public static integer size=0;
  	 public integer count=10;
 global Database.QueryLocator start(Database.BatchableContext BC){
     	 return Database.getQueryLocator('select id,Amount from opportunity');
    }
   
 global void execute(Database.BatchableContext BC, List<opportunity> scope){
      for(opportunity s : scope){
         // count=integer.value0f(s.get('Amount__c'))+count;
          //size+=1;
       count = Integer.valueOf(s.get('Amount'))+count;
          s.No_of_Opt_Team_Members__c=count;
      }update scope;
   }

 global void finish(Database.BatchableContext BC){
  
   }
}
*/


global class practicestateful implements Database.Batchable<sObject>,database.stateful{

   //global final String Query;
   global decimal Summary=0;
  
     global Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator('select id,amount from opportunity');
   		}
    global void execute( Database.BatchableContext BC,List<opportunity> scope){
      for(opportunity s : scope){
         //Summary = Integer.valueOf(s.get('amount'))+Summary;
          summary+=s.amount;
         //s.total__c=summary;
          //s.StageName='closedlost';
          //s.Description='stagename is updated newly';
      }
   }

global void finish(Database.BatchableContext BC){
    	  account acc=new account();
          acc.Name='msd1';
          acc.TotalSalary__c=summary;
   insert acc;
}
}