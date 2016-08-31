# Overview

Malware scanning service over HTTP

The service consists of two docker containers;

  * quay.io/ukhomeofficedigital/clamav:v1.1.0
  
This runs the ClamAV daemon, clamd, and also freshclam to keep the virus definition data up to date

  * quay.io/ukhomeofficedigital/clamav-rest:v1.1.0
  
This runs a java application providing an HTTP interface to the clamd daemon (by default, on port 8080/scan)

Both of these come from this repository;
  * https://github.com/UKHomeOffice/docker-clamav

# USAGE

See the Makefile
