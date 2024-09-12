#!/usr/bin/env bash

# Utility for converting K8s contexts to AWS profiles in the Insights organization
function k8s::context_to_profile() {
  declare -A kube_context_to_aws_profile_map=(
    [cerebro-foundation-dev]=cerebro-shared-services-development-DeveloperFull
    [cerebro-foundation-dev-sandbox-1]=cerebro-shared-services-development-DeveloperFull
    [cerebro-foundation-dev-sandbox-2]=cerebro-shared-services-development-DeveloperFull
    [cerebro-foundation-dev-sandbox-3]=cerebro-shared-services-development-DeveloperFull
    [cerebro-foundation-prod]=cerebro-shared-services-DeveloperFull
    [cerebro-services-dev]=cerebro-development-DeveloperFull
    [cerebro-services-prod]=cerebro-prod-DeveloperFull
    [cerebro-services-test]=cerebro-test-DeveloperFull
    [mele-services-dev]=cerebro-data-science-dev-DeveloperFull
    [mele-services-test]=cerebro-data-science-test-DeveloperFull
    [mele-services-prod]=cerebro-data-science-prod-DeveloperFull
  )

  kube_context_name=$1

  if [[ -z $kube_context_name ]]; then
    >&2 echo -e "ERROR: you must pass the name of a kubernetes context."
    exit 1
  fi

  if [[ ${kube_context_to_aws_profile_map[${kube_context_name}]+x} ]]; then
    echo -e "${kube_context_to_aws_profile_map[${kube_context_name}]}"
  else
    exit 1
  fi
}
