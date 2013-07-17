Using the API for the harvesters...

General procedure:

* Create an export_run
  * Need to specify a data_source_id
     * An "id" will be returned and to post any export_records you must specify this id

* For each data source record
  * Create an export_record
    * Must specify:
     * record_size
     * export_run_id
     * checksum
     * primary_key
     * data_source_id ???
     * data
* Finish an export_run
  * Post Update containing:
    * finished_at
    * record_count
    * (Optionally??? stderr, stdout???)

Validation:

* To create an export_run, no validation needed.

  If you create multiple export_run's for the the same data_source ad the same time, shame on you!

  As the "export run id" is the key for adding export records, no contention

* To create an export_record the export_run (specified by the epxort_run_id) must have nil value for the finished_at, else error: This run is over!

* To finish an export run, the value of finished_at must be nil



