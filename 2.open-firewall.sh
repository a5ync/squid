#!/bin/bash

gcloud compute firewall-rules create allow-squid-proxy \
    --direction=INGRESS \
    --priority=1000 \
    --network=default \
    --action=ALLOW \
    --rules=tcp:3128 \
    --source-ranges=0.0.0.0/0 \
    --target-tags=squid-proxy
