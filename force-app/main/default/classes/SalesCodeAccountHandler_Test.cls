@istest
public class SalesCodeAccountHandler_Test
{   
    public static testmethod void upsertDelSalesAreaCode()
    {  
        Account acc = new Account(Name = 'Test Account');
        
        insert acc;
        List<Sales_areas__C> lstArea = new List<Sales_areas__C>();
        if(acc!=NULL)
        {
          	for(integer i=0; i<50;i++)
         	 {
                Sales_areas__C area = new Sales_areas__c();
                 
         		area.Account__c = acc.id;
          		area.Name='APAC_Test-'+i;
          		area.Sales_Area__c='001';
                
          		lstArea.add(area);
          	 }
        }   
        
        Test.StartTest(); 
		if(!lstArea.isEmpty()) 
        {
            //Insert Salesarea Codes
			insert lstArea;
            system.debug('Sales Area Codes inserted successfully');
            
            //Update Salesarea Codes
            for(Sales_areas__C sac :lstArea)
            {
                if(sac.name == 'APAC_Test-49')
                {
                    sac.Sales_Area__c ='002';
                    system.debug('Sales Area Codes for an Account updated successfully');
                }
            }
            update lstArea;
            //Delete Sales AreaCodes
            List<Sales_areas__C> lstDelArea = new List<Sales_areas__C>();
            for(Sales_areas__C sac :lstArea)
            {
                for(integer i=10; i<=20;i++)
                {
               	 if(sac.name == 'APAC_Test-'+i)
               		 {
                      lstDelArea.add(sac);
                	 }
                }
            }
            delete lstArea;
        }
        Test.StopTest();
    }
    


}