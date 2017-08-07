# visualforce-pagination

## Step 1

Extend the controller class to SObjectPaginator for which you want to implement pagination and implement the methods

```
void begingList();
void nextList();
void prevList();
void lastList();
```
* Extending the controller class to SObject Paginator 
![Image 1](https://github.com/sharathkmr/visualforce-pagination/blob/master/screenshots/image_1.JPG?raw=true)

* Implement the abstract methods
![Image 2](https://github.com/sharathkmr/visualforce-pagination/blob/master/screenshots/image_2.JPG?raw=true)

## Step 2

* set the limit size by calling super class contructor.
* set the records of the list for which you want to apply pagination using the following method and call run() method

```
// set limit size
super(20);

// set the records
void setRecords(List<SObject>);

// call the run() method
run();
```

![Image 3](https://github.com/sharathkmr/visualforce-pagination/blob/master/screenshots/image_3.JPG?raw=true)

## Step 3

* Initially when you pass the list of SObject records you want to paginate, the SObjectPaginator will create an initial list consisting of 1st limit size records.
* get the records by accessing the limitRecords list using getLimitRecords() method which will return List of SObjects.
* after getting the records you need to cast the SObject to your respective SObject type.

![Image 4](https://github.com/sharathkmr/visualforce-pagination/blob/master/screenshots/image_4.JPG?raw=true)

## Step 4

* Implement the abstract methods in controller

```
public void begingList();
public void nextList();
public void prevList();
public void lastList();
```

* call the beginning(), next(), previous() and last() super class methods in the begingList(), nextList(), prevList() and lastList() methods respectively.
* After calling the methods, get the limitRecords list from the SObjectPaginator using getLimitRecords() method which will return List of SObjects and cast the SObject to respective SObject type
* Dont forget to clear the list in your controller class in every method.

![Image 5](https://github.com/sharathkmr/visualforce-pagination/blob/master/screenshots/image_5.JPG?raw=true)

## Step 5

* Comming to the visualforce page, you can call the methods begingList(), nextList(), prevList() and lastList() implemented in your controller class.
* To disable the pagination buttons dynamically according to the list you can bind disabled attribute with the getDisableNext() and getDisablePrevious() methods available in SObjectPaginator class.

```
public Boolean getDisableNext()
public Boolean getDisablePrevious()
```

![Image 6](https://github.com/sharathkmr/visualforce-pagination/blob/master/screenshots/image_6.JPG?raw=true)


## Reference

* for example you can go through the visualforce page and controller for implementation

[Visualforce Page](https://github.com/sharathkmr/visualforce-pagination/blob/master/src/pages/pagination_example.page)
[Controller](https://github.com/sharathkmr/visualforce-pagination/blob/master/src/classes/vf_paginationfw_controller.cls)
[SObjectPaginator Class](https://github.com/sharathkmr/visualforce-pagination/blob/master/src/classes/SObjectPaginator.cls)
