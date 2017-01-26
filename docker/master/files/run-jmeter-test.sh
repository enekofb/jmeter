#!/bin/bash -e
replicas=$1
requests_sec=$2
host=$3
port=$4
request=$5

#througput set in minutes so = 60 * x req/sec
throughput=$(($requests_sec * 60))
#test lasts for the number of replicas times the time we want to run each replica and one more minute to allow all threads to be there
duration=$((10))
nthreads=$(($requests_sec))

rm -rf ./results/*

echo
echo " Running test for users "${nthreads}" and throughput of "${requests_sec}" reqs/sec and max replicas "${replicas}" and duration "${duration}
echo "---------------------------------------------"

jmeter -Jnrequests=${throughput} -Jnthreads=${nthreads} -Jrampup=60 -Jloop=-1 -Jduration=${duration} -Jhost=${host} -Jport=${port} -Jrequest=${request} -n -t test-plan.jmx -l ./results/results_throughput${requests_sec}_replicas${replicas}.csv -e -o ./results/results_throughput${requests_sec}_replicas${replicas}