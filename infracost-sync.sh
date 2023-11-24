#!/usr/bin/env zsh

set -e

locations=(us-east1 us-east4 global)
environments=(sandbox non-production production)

for location in "${locations[@]}"; do
  for environment in "${environments[@]}"; do
    if [ "$location" = "global" ]; then
      infracost breakdown --sync-usage-file \
      --usage-file global/infra/infracost/${environment}.yml \
      --path global/infra \
      --terraform-var-file tfvars/${environment}.tfvars
    else
      infracost breakdown --sync-usage-file \
      --usage-file regional/infra/infracost/${location}-${environment}.yml \
      --path regional/infra \
      --terraform-var-file tfvars/${location}-${environment}.tfvars
    fi
  done
done
