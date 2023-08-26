public class MergeSortedArray {
    public static void SortTheData(){
        List<Integer> data = new   List<Integer>{30,20,40,10};
            for(Integer i=0;i<=data.size()-1;i++){
                for(Integer j=0;j<data.size()-i-1;j++){
                    if(data[j]>data[j+1]){
                        Integer temp = data[j];
                        data[j] =  data[j+1];
                        data[j+1]= temp;  
                    }
                }
                system.debug('data'+data);
            }
        system.debug('data'+data);  
    }
    public static void DeleteTheData(){
        Integer deleteData=  20;
        List<Integer> data = new   List<Integer>{30,20,40,10};
            for(Integer i=0;i<=data.size()-1;i++){
                if(data[i]==deleteData){
                    data.remove(data[i]);
                }
            } 
        system.debug('data'+data);
    }
}