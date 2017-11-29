## mysql-migrate-docker

This docker image is built on top of the [offical mysql image](https://github.com/docker-library/mysql/).\
It adds the following support:
 * Handles sql files using [rubenv/sql-migrate](https://github.com/rubenv/sql-migrate) format
 * Sub-folders 


### Usage
The usage is the same as the usage of the official image with some exceptions:
 * Files and folders must be mounted in **/sql-data** or any subdirectory
 * **/docker-entrypoint-initdb.d** should not be used anymore
 * Sql archives are not supported yet

### File scanning order
Starting from the **/sql-data** folder, all the **.sql** files are converted then executed by mysql in alphabetical order.\
Then each sub-folder is recursively scanned in alphabetical order as well.

