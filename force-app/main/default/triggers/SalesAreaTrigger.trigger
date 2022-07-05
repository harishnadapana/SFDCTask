trigger SalesAreaTrigger on sales_areas__c (after insert, after update,after delete) 
{
	if((trigger.isInsert ||trigger.isUpdate) &&trigger.isafter)
       {
           SalesCodeAccountHandler.SalesCodeInsert(trigger.new);
       }
    if(trigger.isDelete &&trigger.isafter)
       {
           SalesCodeAccountHandler.SalesCodeInsert(trigger.old);
       }
}