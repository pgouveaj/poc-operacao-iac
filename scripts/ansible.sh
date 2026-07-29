#!/bin/bash
local_playbook="/poc-operacao-iac/ansible"

parar_nginx() {
    echo
    echo "Encerrando o nginx..."
    cd ${local_playbook}
    ansible-playbook -i inventory.ini playbook.yml -e "acao=parar"
    exit 0
}

trap parar_nginx SIGINT

cd ${local_playbook}
ansible-playbook -i inventory.ini playbook.yml -e "acao=iniciar"

echo
echo "Nginx em execução."
echo "Pressione Ctrl+C para parar o Nginx."

while true; do
    systemctl is-active nginx
    sleep 5
done