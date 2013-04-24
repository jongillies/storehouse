StoreHouse
==========

StoreHouse is a set of code that will allow you to take snapshots of any selected data source and store it for later analysis.  You might call it an "historical object cache".

The code base is composed of:

* UI: A Ruby on Rails Application (Default is MySQL, but can be any supported database.)
* Backend: A set of scipts that can iterate a data source and send it to the ROR API
* Object Data Store. Supported stores can be added easily.  Out of the box the supported object stores are S3, DynamoDB, Riak, MongoDB, File System

The requirments for a data source are:

* Typically the data must be serializable to JSON, but this is not required.  I can be binary data as well.  The serialization format depends on how you will consume the data in downstream applications or data processing.
* Each data source must have a unique key.  This can be a composite key if needed.  But, the composite key must alwasy reference the same object or you will encounter "flapping" issues.


Snapshot data sources and keep them forever?
