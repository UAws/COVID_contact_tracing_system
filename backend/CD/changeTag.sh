#!/bin/bash
cat wdc-project-backend.yaml | sed -r 's/covid_contact_tracing_system_backend\:[[:alnum:]]+/covid_contact_tracing_system_backend\:123/g'
