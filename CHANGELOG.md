## Unreleased

- Change `ansible_install.sh` script to autodetect the preinstalled version of python
- Use ansible facts to support both debian and ubuntu, also removing the need for the codename variable
- Use ansible facts and additional variables to handle both AMD64 and ARM64 architectures
- Change ansible default result output to yaml format
- Remove WSL variable


# v0.6.1

- Update softwares versions


# v0.6.0

- Remove locale template
- Update softwares versions


## v0.5.1

- Add packer install role


## v0.5.0

- Update ansible install script to use venv
- Expose python interpreter ansible variable
- Update playbooks for ubuntu 24.04
- Remove ansible-lint from playbooks
- Update git-core ppa gpg key


## v0.4.0

- Split terragrunt and terraform roles
- Add OpenTofu install role
- Update README example
- Modify locale template
- Customize filename when adding apt repositories


## v0.3.3

- Update softwares versions


## v0.3.2

- Update softwares versions
- Change editorconfig-checker download URL and version parsing


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
