public class QclassDemo implements System.Queueable{
     
    private List<Account> accounts;
    private ID parentId ;
    public QclassDemo (list<account> records ,ID id)
    {
        this.accounts = records;
        this.parentId= id;
        
    }
    public void execute(QueueableContext context)
    {
        for(Account acc :accounts){
            acc.ParentId = parentId;
        }
        update accounts;
    }
}