public abstract class SObjectPaginator {
    
    // List to show the limited records on the page
    private List<SObject> limitRecords;
    // List to hold the actual records
    private List<SObject> records;
    
    // Navigation variables
    // To track the number of records parsed
    private Integer counter = 0;
    // Number of records to be displayed
    private Integer limitSize = 0;
    // To Store the total number of records available
    private Integer totalSize = 0;
    
    // abstract methods
    abstract void begingList();
    abstract void nextList();
    abstract void prevList();
    abstract void lastList();
        
    // Constrctor
    public SObjectPaginator(integer limitSize) {
        this.limitSize = limitSize;
        
	if(limitRecords == null) {
            limitRecords = new List<SObject>();
        }
        if(records == null) {
            records = new List<SObject>();
        }
    }
    
    // limitSize getter and setter
    public void setLimitSize(integer limitSize) {
        this.limitSize = limitSize;
    }
    public integer getLimitSize() {
        return this.limitSize;
    }
    
    // LimitRecords getter
    public List<SObject> getLimitRecords() {
        return limitRecords;
    }
    
    // records getters and setters
    public void setRecords(List<SObject> records) {
        this.records = records;
    }
    public List<SObject> getRecords() {
        return records;
    }
    
    // run method to intialize
    protected void run() {
        // Intial pagination stage

	// assign the totalSize is list size
        totalSize = records.size();
        
	// check the total records are more than limitSize and assign the records
	if((counter+limitSize) <= totalSize){
            for(Integer i=0;i<limitSize;i++){
                limitRecords.add(records.get(i));
            }
        }else{
            for(Integer i=0;i<totalSize;i++){
                limitRecords.add(records.get(i));
            }
        }
    }
    
    // Navigation Methods
    protected void beginning() {
	// clear the 
        limitRecords.clear();
        counter=0;
	
        if((counter + limitSize) <= totalSize) {
            for(Integer i=0;i<limitSize;i++) {
                limitRecords.add(records.get(i));
            }
        } else {
            for(Integer i=0;i<totalSize;i++){
                limitRecords.add(records.get(i));
            }
        }
    }
    
    protected void next(){
	// clear the pagination list
   	limitRecords.clear();
	
	// increasing the counter for getting next limitSize number of elements
        counter=counter+limitSize;
       
        if((counter+limitSize) <= totalSize){
            for(Integer i=counter-1;i<(counter+limitSize);i++){
                limitRecords.add(records.get(i));
            }
        } else{
            for(Integer i=counter;i<totalSize;i++){
                limitRecords.add(records.get(i));
            }
        }
    }
   
    protected void previous(){
	// clear the pagination list
        limitRecords.clear();

	// reducing the counter value
        counter=counter-limitSize;       
       
        for(Integer i=counter;i<(counter+limitSize); i++){
            limitRecords.add(records.get(i));
        }
    }

    protected void last(){
	// clear the pagination list
   	limitRecords.clear();
       
        if(math.mod(totalSize , limitSize) == 0){
            counter = limitSize * ((totalSize/limitSize)-1);
        } else if (math.mod(totalSize , limitSize) != 0){
            counter = limitSize * ((totalSize/limitSize));
        }
	
        for(Integer i=counter-1;i<totalSize-1;i++){
            limitRecords.add(records.get(i));
        }
    }
    
    // to disable the next button
    public Boolean getDisableNext(){
        if((counter + limitSize) >= totalSize )
            return true ;
        else
            return false ;
    }
    // to disable the prev button
    public Boolean getDisablePrevious(){
        if(counter == 0)
            return true ;
        else
            return false ;
    }
}