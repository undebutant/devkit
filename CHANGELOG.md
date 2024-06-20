## Unreleased

- Update softwares versions


## v0.3.1

- Update softwares versions
- Modify sops download URL


## v0.3.0

- Fix version regex for sops
- Add version regex check on docker-compose
- Add python-is-python3 package to alias "python" to "python3"
- Run apt update in basics role
- Use booleans instead of "yes" and "no" for ansible `become`
- Add kustomize binary
- Add locale variable and configuration
- Add `apache2-utils` package


## v0.2.0

- Remove unused roles
- Change docker `bip` and `default-address-pools` config
- Remove go packages install
- Add velero binary
- Add k9s binary
- Add kubeseal binary
- Add minikube binary
- Add tmux to the installed packages
- Add aws cli ssm plugin binary
- Rework docker configuration
- Update softwares versions
- Add GPG keys for PPA manually to prevent deprecation in apt
- Add "--upgrade" flag for ansible install by pip
- Fix version regex for vals and yq roles
- Add variable for Ubuntu version codename
- Update README instructions


## v0.1.0

- Initial commit
- Remove docker socket config in `daemon.json` file to prevent conflict with systemd config
