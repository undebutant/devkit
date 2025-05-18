# devkit

Script and Ansible roles to provision a convenient devkit on Debian / Ubuntu :)


## What's inside

| Software             | Ansible variable               | Default version                  |
| -------------------- | ------------------------------ | -------------------------------- |
| ansible              | `n/a`                          | `latest` (pip in dedicated venv) |
| aws cli              | `awscli_version`               | `2.24.22`                        |
| aws cli ssm plugin   | `awscli_ssm_plugin_version`    | `1.2.707.0`                      |
| curl                 | `n/a`                          | `latest`                         |
| docker               | `n/a`                          | `latest` (PPA)                   |
| docker-compose       | `docker_compose_version`       | `2.33.1`                         |
| editorconfig-checker | `editorconfig_checker_version` | `3.2.0`                          |
| git                  | `n/a`                          | `latest` (PPA)                   |
| git-lfs              | `n/a`                          | `latest` (PPA)                   |
| gnupg                | `n/a`                          | `latest`                         |
| go                   | `go_version`                   | `1.24.1`                         |
| helm                 | `helm_version`                 | `3.17.1`                         |
| helm diff            | `helm_diff_version`            | `3.10.0`                         |
| helmfile             | `helmfile_version`             | `0.171.0`                        |
| jq                   | `n/a`                          | `latest`                         |
| k9s                  | `k9s_version`                  | `0.40.8`                         |
| kubectl              | `kubernetes_version`           | `1.32.3`                         |
| kubeseal             | `kubeseal_version`             | `0.28.0`                         |
| kustomize            | `kustomize_version`            | `5.6.0`                          |
| make                 | `n/a`                          | `latest`                         |
| minikube             | `minikube_version`             | `1.35.0`                         |
| opentofu             | `opentofu_version`             | `1.9.0`                          |
| packer               | `packer_version`               | `1.12.0`                         |
| python               | `n/a`                          | `3.x.y` (OS default)             |
| sops                 | `sops_version`                 | `3.9.4`                          |
| terraform            | `terraform_version`            | `1.11.2`                         |
| terraform-docs       | `terraform_docs_version`       | `0.19.0`                         |
| terragrunt           | `terragrunt_version`           | `0.75.6`                         |
| tmux                 | `n/a`                          | `latest`                         |
| unzip                | `n/a`                          | `latest`                         |
| vals                 | `vals_version`                 | `0.39.3`                         |
| vault                | `vault_version`                | `1.19.0`                         |
| velero               | `velero_version`               | `1.15.2`                         |
| yq                   | `yq_version`                   | `4.45.1`                         |


## Install and provision

If you have Debian or Ubuntu as main OS on your computer, just go to the [Provision](./README.md#provision) section.


### Special requirements for WSL

- [WSL2 for Windows](https://docs.microsoft.com/en-us/windows/wsl/install) (version `0.67.6` or higher for [systemd](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl) to work)
- Ubuntu 24.04 (available in Microsoft Store)
- (recommended) [Windows Terminal](https://docs.microsoft.com/en-us/windows/terminal/install)

To install WSL and Ubuntu 24.04 using a Powershell terminal
```powershell
# Run powershell as administrator
wsl --install

# Check wsl version and update if needed
wsl --version
wsl --update

# Install Ubuntu 24.04
wsl --install Ubuntu-24.04
```

Launch Ubuntu 24.04, then edit `/etc/wsl.conf` with your favorite editor
```toml
[boot]
systemd=true
```

Restart Ubuntu 24.04
```powershell
wsl --shutdown
```

Launch again Ubuntu 24.04 and check that systemd is working
```bash
systemctl list-unit-files --type=service
```


### Provision

```bash
# Clone this repository
git clone git@github.com:undebutant/devkit.git

# Go to the cloned folder and install the latest ansible version in a dedicated venv
cd ./devkit/scripts
./ansible_install.sh /home/undeb/ansible-venv

# Then customize ansible variables
cd ../ansible
nano ./vars.yml
```

You need to edit Ansible variables before running the provision code, for example
```yaml
---
ansible_playbook_python: '/home/undeb/ansible-venv/bin/python3'

main_user: 'undeb'
user_timezone: 'Europe/Paris'

is_wsl: true

go_projects_path: '/home/undeb/lab/go'
```

After that, you are all set to provision your devkit
```bash
# Specify path to the venv where ansible is installed
export ANSIBLE_BIN='/home/undeb/ansible-venv/bin/ansible-playbook'

# Provision everything else with ansible (add --diff for details on the changes)
$ANSIBLE_BIN -i inventory.yml playbook.yml --diff

# To provision specific roles with custom variables
$ANSIBLE_BIN -i inventory.yml -t go -e "go_version=1.17.5" playbook.yml --diff
$ANSIBLE_BIN -i inventory.yml -t terraform -e "terraform_version=1.0.11 terragrunt_version=0.34.3" playbook.yml --diff
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
