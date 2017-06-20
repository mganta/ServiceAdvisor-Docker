#!/bin/sh
testrpc -u 0 -u 1 -u 2 -u 3 &
cd ethereum-bridge
node bridge -H localhost:8545 -a 1 &
cd ../SampleProject
truffle migrate
npm run build 
truffle serve
