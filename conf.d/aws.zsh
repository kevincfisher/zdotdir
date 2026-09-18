#!/usr/bin/env zsh
# === AWS / K8s profile switching (work only) ===
# Enable on a given machine with: export WORK_MACHINE=1 in $ZDOTDIR/.zshenv.local
if [[ -n "$WORK_MACHINE" ]]; then
  export AWS_PAGER=""
  # Aws profiles
  activate_aws_profile () { export AWS_PROFILE=$1; echo "Profile '$1' is now active" ;}
  awsprofile_active () { echo "'$AWS_PROFILE' is the current active profile" ;}
  awsprofile_login () { aws sso login ;}

  #Dev
  awsNonProd() { activate_aws_profile "h1-non-prod-shore-group"; kubectl config use-context non-prod;}
  awsDataCi() { activate_aws_profile "h1-dev-data-platform"; kubectl config use-context data-platform-ci;}
  awsDataUat() { activate_aws_profile "h1-dev-data-platform"; kubectl config use-context data-platform-uat;}

  #Prod
  awsShoreGroupProd() { activate_aws_profile "h1-shore-group"; kubectl config use-context prod-eng-prod;}
  awsDataProd() { activate_aws_profile "h1-prd-data-platform"; kubectl config use-context data-platform-prod;}

  # Automatically activate AWS profile and K8s context on terminal start
  awsNonProd
fi
