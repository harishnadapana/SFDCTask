public with sharing class SalesCodeAccountHandler
{
    public static void SalesCodeInsert(List<Sales_areas__C> lstSalesAreaCodes) 
    {
       Set<id> SalesCodeIds = new Set<id>();
       try
       {
        for(Sales_areas__c sc :lstSalesAreaCodes)
        {
            if(sc.account__c!=null)
            {
                SalesCodeIds.add(sc.account__c);
            }
        }
        if(!SalesCodeIds.isEmpty())
        {
            List<Account> lstAccounts = [select id,Sales_Area_Codes__c, (select id,Sales_Area__c from Sales_areas__r) from account where id in :SalesCodeIds];
            
            if(!lstAccounts.isEmpty())
            {
                for(Account acc:lstAccounts)
                {
                    if(acc.Sales_Areas__r.size()>=1)
                    {
                         acc.Sales_Area_Codes__c=' ';
                         for(Sales_Areas__c sca: acc.Sales_Areas__r)
  						 {
   							acc.Sales_Area_Codes__c+=sca.Sales_Area__c+';';
   						 }
   							   
                   	}
                }
                update lstAccounts;
            }
        }
        }
        Catch(Exception e)
        {
            system.debug('Exception error is '+e.getMessage());
            system.debug('Exception error is '+e.getLineNumber());
        }
    }
}