# StoreHouse

StoreHouse is a set of code that will allow you to take snapshots of any selected data source and store it for later analysis.  You might call it an "historical object cache".

Given a specific date and time, you can recreate the data source's state.  Now this depends on how often you are polling or "snapshotting" that data sorce.

For example, if you were "store housing" LDAP groups, you might run that daily if that is the granularity you choose.  Below are some examples of data sources and some possible snapshot frequencies.

Data Source        | Possible Frequency
-------------------|------------
 DNS Zone          | Hourly 
 LDAP Groups       | Daily
 Amazon Instances  | As fast as possible
 Amazon IAM Users  | As fast as possible 
 Some Database     | Weekly
 ...               | ...
 
## System Requirements:

* Ruby on Rails
* Any database supported by Ruby on Rails
* Any backend supported by Moneta
* Any number of worker machines to process the data sources

## Data Source Requirements:

* Typically the data must be serializable to JSON, but this is not required.  I can be binary data as well, but that will depend on the backend data store that you choose.  The serialization format depends on how you will consume the data in downstream applications or data processing.
* Each data source must have a unique key.  This can be a composite key if needed.  But, the composite key must always reference the same object or you will encounter "flapping" issues.

## Architecture

The StoreHouse system tracks all of the data in the ROR database, but it does not store the actual data in the database.  The back-end datastore provided by the Moneta Gem is where the data is stored.  In essense, the ROR database holds the "meta-data" and the back-end store actaully holds the data.

One of the primary objectives is to reduce data duplication.  If you export hourly from a data source and nothing changes, we don't want to duplicate the data in the back-end data store.  Here is where the checksum saves us.

We are storing the actual data/record/blob in a key/value store.  The key is the SHA512 checksum of the value.  If 100 different data stores has the same record the back-end will only store that record once.  This is where "export runs" and "export records" come into play.

The following objects are represented in the ROR database (a.k.a. the "meta-data"):

* Data Sources
* Export Runs
* Export Records

### Data Sources
It's up to you to create, filter and aggregate your data source.  Each data source record provides descriptive information along with a "connection info" field if you so choose to use that field.  Also each data source record has a Moneta configuration option.  This is how you configure your back end data store.  One nifty feature is that you can configure multiple Moneta connections.  So one data source could be in MemCacheD and persisted in Riak.

### Export Runs
Every time you export your data that will create an "export run" object.  This object holds the start time, end time, duration and object count for that export.  If you run once an hour you will have 24 export runs per day.

### Export Records
Each object in the export run will create an export record.  The export record holds the following information:
* Record Size
* Checksum
* Data Store Location Pointer
* Export Run Reference
* Data Source Reference

## Usage

### Getting Data In

### Getting Data Out






Snapshot data sources and keep them forever?
