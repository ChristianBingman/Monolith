#!/bin/bash
SECRETS=("./secrets.env" "./docker/compose/ironman/secrets.env" "ansible/files/ansible" "./tf/terraform.tfstate")

for secret in ${SECRETS[@]}; do
  ansible-vault decrypt --vault-password-file .vault-password $secret
done

export $(grep -v "^#" ./secrets.env | xargs)
cd ./tf && terraform init && terraform apply -auto-approve
cd .. && ANSIBLE_HOST_KEY_CHECKING=false ansible-playbook -i inventory --vault-password-file=.vault-password --private-key ansible/files/ansible ansible/main.yml

for secret in ${SECRETS[@]}; do
  ansible-vault encrypt --vault-password-file .vault-password $secret
done
