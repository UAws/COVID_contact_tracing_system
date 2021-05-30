#!/bin/bash
cat wdc-project-backend.yaml | sed -r 's/covid_contact_tracing_system_backend\:\$?[[:alnum:]]+\-?[[:alnum:]]+/covid_contact_tracing_system_backend\:abc/g' | grep covid_contact_tracing_system_backend
