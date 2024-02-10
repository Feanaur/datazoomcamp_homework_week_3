-- couting number of items in the table
SELECT count(1) from green_taxi_data.green_tripdata_partitoned_clustered;


-- counting number of items that have fare_amount is 0 
SELECT count(1) from green_taxi_data.green_tripdata_partitoned_clustered
WHERE fare_amount = 0;





