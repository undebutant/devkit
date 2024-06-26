# devkit

Script and Ansible roles to provision a convenient devkit on Ubuntu :)


## What's inside

| Software             | Ansible variable               | Default version                 |
| -------------------- | ------------------------------ | ------------------------------- |
| ansible              | `n/a`                          | `latest` (pip)                  |
| ansible-lint         | `n/a`                          | `latest` (pip)                  |
| aws cli              | `awscli_version`               | `2.16.12`                       |
| aws cli ssm plugin   | `awscli_ssm_plugin_version`    | `1.2.633.0`                     |
| curl                 | `n/a`                          | `latest`                        |
| docker               | `n/a`                          | `latest` (PPA)                  |
| docker-compose       | `docker_compose_version`       | `2.27.1`                        |
| editorconfig-checker | `editorconfig_checker_version` | `3.0.1`                         |
| git                  | `n/a`                          | `latest` (PPA)                  |
| git-lfs              | `n/a`                          | `latest` (PPA)                  |
| gnupg                | `n/a`                          | `latest`                        |
| go                   | `go_version`                   | `1.22.4`                        |
| helm                 | `helm_version`                 | `3.15.2`                        |
| helm diff            | `helm_diff_version`            | `3.9.8`                         |
| helmfile             | `helmfile_version`             | `0.165.0`                       |
| jq                   | `n/a`                          | `latest`                        |
| k9s                  | `k9s_version`                  | `0.32.5`                        |
| kubectl              | `kubernetes_version`           | `1.30.2`                        |
| kubeseal             | `kubeseal_version`             | `0.26.3`                        |
| kustomize            | `kustomize_version`            | `5.4.2`                         |
| make                 | `n/a`                          | `latest`                        |
| minikube             | `minikube_version`             | `1.33.1`                        |
| pip                  | `n/a`                          | `latest` (Python installer)     |
| python               | `n/a`                          | `3.10.x` (Ubuntu 22.04 default) |
| sops                 | `sops_version`                 | `3.8.1`                         |
| terraform            | `terraform_version`            | `1.8.5`                         |
| terraform-docs       | `terraform_docs_version`       | `0.18.0`                        |
| terragrunt           | `terragrunt_version`           | `0.59.4`                        |
| tmux                 | `n/a`                          | `latest`                        |
| unzip                | `n/a`                          | `latest`                        |
| vals                 | `vals_version`                 | `0.37.2`                        |
| vault                | `vault_version`                | `1.17.0`                        |
| velero               | `velero_version`               | `1.14.0`                        |
| yq                   | `yq_version`                   | `4.44.2`                        |


## Install and provision

If you have Ubuntu 22.04 installed on your computer, just go to the [Provision](./README.md#provision) section.


### Special requirements for WSL

- [WSL2 for Windows](https://docs.microsoft.com/en-us/windows/wsl/install) (version `0.67.6` or higher for [systemd](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl) to work)
- Ubuntu 22.04 (available in Microsoft Store)
- (recommended) [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/install)

To install WSL using a terminal
```powershell
# Run powershell as administrator
wsl --install

# Check wsl version and update if needed
wsl --version
wsl --update
```

Install and launch Ubuntu 22.04, then edit `/etc/wsl.conf` with your favorite editor
```toml
[boot]
systemd=true
```

Restart Ubuntu 22.04
```powershell
wsl --shutdown
```

Launch again Ubuntu 22.04 and check that systemd is working
```bash
systemctl list-unit-files --type=service
```


### Provision

```bash
# Clone this repository
git clone git@github.com:undebutant/devkit.git

# Go to the cloned folder and customize ansible variables
cd ./devkit/ansible
nano ./vars.yml
```

You need to edit Ansible variables before running the provision code, for example
```yaml
---
ubuntu_user: 'undeb'
user_timezone: 'Europe/Paris'

# See https://help.ubuntu.com/community/Locale
user_locale_lang: 'en_US.UTF-8'
user_locale_lc: 'en_US.UTF-8'

ubuntu_codename: 'jammy'
is_wsl: true

go_projects_path: '/home/undeb/lab/go'
```

After that, you are all set to provision your devkit
```bash
# Install the latest pip and ansible versions
cd ../scripts
./pip_ansible_install.sh

# Provision everything else with ansible (add --diff for details on the changes)
cd ../ansible
ansible-playbook -i inventory.yml playbook.yml --diff

# To provision specific roles with custom variables
ansible-playbook -i inventory.yml -t go -e "go_version=1.17.5" playbook.yml --diff
ansible-playbook -i inventory.yml -t terraform -e "terraform_version=1.0.11 terragrunt_version=0.34.3" playbook.yml --diff
```


### Additional configuration

Do not forget to source the bash scripts created by some roles
```bash
# Add the following lines in your .bashrc or .zshrc
if [ -f /etc/profile.d/ansible.sh ]; then
    source /etc/profile.d/ansible.sh
fi

if [ -f /etc/profile.d/go.sh ]; then
    source /etc/profile.d/go.sh
fi
```
