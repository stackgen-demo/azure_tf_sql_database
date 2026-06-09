#!/usr/bin/env bash
set -euo pipefail

export TF_IN_AUTOMATION=1
export TF_PLUGIN_CACHE_DIR="${TF_PLUGIN_CACHE_DIR:-$HOME/.terraform.d/plugin-cache}"
mkdir -p "$TF_PLUGIN_CACHE_DIR"

echo "terraform_version=$(terraform version -json | jq -r '.terraform_version')"

terraform fmt -recursive -check

mapfile -t roots < <(
  find . \
    -path '*/.terraform' -prune -o \
    -path './.git' -prune -o \
    -name '*.tf' -print |
    xargs -r -n1 dirname |
    sort -u
)

if [ "${#roots[@]}" -eq 0 ]; then
  echo "No Terraform files found."
  exit 1
fi

for root in "${roots[@]}"; do
  echo "::group::terraform validate ${root}"
  terraform -chdir="$root" init -backend=false -input=false
  terraform -chdir="$root" validate
  if compgen -G "${root}/*.tftest.hcl" >/dev/null || [ -d "${root}/tests" ]; then
    terraform -chdir="$root" test
  fi
  echo "::endgroup::"
done
