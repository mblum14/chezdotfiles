source "$HOME/.local/bin/lib/log.sh"

function git.auth() {
  echo "Which credentials do you wish to authenticate with?"
  network=$(gum choose "github.com" "git.enterprise.org")

  CREDENTIAL_FILE="$HOME/${network//\./\_}_GIT_TOKEN"

  if [[ -z $network ]]; then
    log::err "Must select a credential"
    exit 1
  fi
  if [[ ! -f "${CREDENTIAL_FILE}" ]]; then
    log::err "Missing ${CREDENTIAL_FILE}"
    exit 1
  fi

  unset GITHUB_URL
  unset GITHUB_BASE_URL
  unset GH_URL
  unset GH_HOST

  unset GITHUB_PREFIX
  unset GH_PREFIX

  unset GITHUB_TOKEN
  unset GH_TOKEN
  unset GITHUB_ENTERPRISE_TOKEN
  unset TT_GITHUB_TOKEN

  source "${CREDENTIAL_FILE}"
}
