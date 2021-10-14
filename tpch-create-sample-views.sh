#!/bin/bash

database=$1
sample_queries_dir="sample-queries-tpch-view"

if [ X"$database" = "X" ]; then
	echo "usage: tpch-create-sample-views <database>"
fi

if [ ! -d $sample_queries_dir ]; then
    echo "Sample queries dir $sample_queries_dir not found."
    exit 1
fi

for f_sql in $sample_queries_dir/*.sql
    do
        echo "executing $f_sql"
        hive --database $database -f $f_sql
        if [ $? -ne 0 ]; then
            echo "Query execution failed, exiting."
            exit 1
        fi
    done
