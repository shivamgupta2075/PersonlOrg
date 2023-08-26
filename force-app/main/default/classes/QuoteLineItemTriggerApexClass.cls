public class QuoteLineItemTriggerApexClass
{
    public void OnbeforeInsert(Set<Id> QuoteIds, List<QuoteLineitem> QLis){
         system.debug('Test');
        If(QuoteIds != null){
            for( Quote quo : [Select Id,Name,Pricing_Method__c from Quote where Id in :QuoteIds ]){
                If(quo.Pricing_Method__c == '2021'){
                    system.debug('Test');
                    Method2021(QuoteIds);
                }
                If(quo.Pricing_Method__c == '2018'){
                     system.debug('Test');
                    Method2018(QuoteIds);
                }
            }
        }
        
    }
    public void Method2021(Set<Id> QuoteIds){
         system.debug('Test');
        List<Quotelineitem> op = new List<Quotelineitem>();
        system.debug('QuoteIds'+QuoteIds);
        for(Quotelineitem qli:[Select Id ,ListPrice,Discount from Quotelineitem where QuoteId In : QuoteIds ] ){
             system.debug('Test'+qli);
            if(qli != null){
                qli.Discount  = 20;
                op.add(qli);
            }
        }
        system.debug('op'+op);
        update op;
    }
    public void Method2018(Set<Id> QuoteIds){
         system.debug('Test');
        List<Quotelineitem> op = new List<Quotelineitem>();
        for(Quotelineitem qli:[Select Id ,ListPrice,Discount,Formula_For_Custom_Labels__c from Quotelineitem where QuoteId In :QuoteIds  ] ){
             system.debug('Test'+qli.Formula_For_Custom_Labels__c);
            if(qli != null){
                string s = system.Label.price2021;
                String[] words = s.split(' ');
                system.debug('s'+s);
                qli.Discount  = 10;
                op.add(qli);
            }
        }
        system.debug('op'+op);
        update op;
    }
}