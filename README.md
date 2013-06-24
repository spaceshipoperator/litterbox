litterbox
=========

a small collection of very simple scripts to allow for an arbitrary csv file to be uploaded into a table within an RDBMS

1. a bare bones ruby sinatra ditty that provides the CRUD for named csv files uploaded, on upload create or replace a table given the name, record the date and time uploaded.

2. a shell script that sweeps the upload directory, imports(copies) data into a pg database anything that hasn't been imported since last we ran (or configurable)

