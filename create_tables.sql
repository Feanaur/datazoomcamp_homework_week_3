-- Creating external table referring to gcs path
CREATE OR REPLACE EXTERNAL TABLE `green_taxi_data.trips`
OPTIONS (
  format = 'PARQUET',
  uris = ['gs://datazoomcamp-36340/trip_data/green_tripdata_2022-*.parquet']
);

-- Create a non partitioned table from external table (eg materialize)
CREATE OR REPLACE TABLE `green_taxi_data.green_tripdata_non_partitoned` AS
SELECT * FROM `green_taxi_data.trips`;


-- Create a partitioned table from materialized
CREATE OR REPLACE TABLE green_taxi_data.green_tripdata_partitoned
PARTITION BY
  DATE(lpep_pickup_datetime) AS
SELECT * FROM `green_taxi_data.green_tripdata_non_partitoned`;


-- Creating a partition and cluster table
CREATE OR REPLACE TABLE green_taxi_data.green_tripdata_partitoned_clustered
PARTITION BY DATE(lpep_pickup_datetime)
CLUSTER BY PUlocationID AS
SELECT * FROM `green_taxi_data.green_tripdata_non_partitoned`;