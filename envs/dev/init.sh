#!/bin/bash
cd envs/dev/bootstrap
terraform init
terraform apply -auto-approve

