# mysql-migrate-docker

This docker image simply adds support for [rubenv/sql-migrate](https://github.com/rubenv/sql-migrate) and recursive call into sub-folders.
It wraps the [offical mysql image](https://github.com/docker-library/mysql/). 
The **sql-data** folder only will be scanned for sql-migrate conversions and sub-folders support.
*Note: the **/docker-entrypoint-initdb.d** should not be used with this image.*

### File scanning order
Starting from the **/sql-data** folder, all the **.sql** files are converted then executed by mysql in alphabetical order. 
Then each sub-folder is recursively scanned in alphabetical order as well

