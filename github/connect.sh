SSH_CONFIG=~/.ssh/config
SSH_KEY_PRIV=~/.ssh/github.com/id_ed25519
SSH_KEY_PUB=${SSH_KEY_PRIV}.pub

main() {
  ssh_key && github_auth
}

ssh_key() {
  mkdir -p $(dirname $SSH_KEY_PRIV) &&
    gen_key &&
    set_permissions &&
    update_ssh_config
}

gen_key() {
	if [[ ! -f $SSH_KEY_PRIV ]]; then
		ssh-keygen -t ed25519 -C "GitHub CLI ($(whoami)@$(hostname))" -f $SSH_KEY_PRIV -N ""
	else
    checked A SSH key already exists for GitHub \($SSH_KEY_PUB\)
	fi
}

set_permissions() {
	chmod 600 $SSH_KEY_PRIV && chmod 644 $SSH_KEY_PUB
}

update_ssh_config() {
	if [[ ! -f $SSH_CONFIG ]] || ! grep --quiet '^Host github.com' $SSH_CONFIG; then
		cat <<-eof >>$SSH_CONFIG
			Host github.com
				UseKeychain yes
				IdentitiesOnly yes
				IdentityFile $SSH_KEY_PRIV
		eof
	else
    checked SSH key already set up for GitHub
	fi
}

github_auth() {
  gh auth login --web --git-protocol ssh --skip-ssh-key --scopes admin:public_key &&
    gh ssh-key add $SSH_KEY_PUB &&
    gh auth status
}

checked() {
  echo '{{ Bold (Color "#00ff00" "✓") }}' ${@} | gum format -t template; echo
}

main
