public class AccountUtils {
    public static List<Account> accountsByState(string states){
        return [Select id,Name from Account where BillingState =:states];
    }
}