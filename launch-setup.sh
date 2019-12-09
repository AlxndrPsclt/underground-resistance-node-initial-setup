#! /usr/bin/env bash

ansible-playbook -i inventory.yml --vault-password-file vault-password-file playbook.yml
