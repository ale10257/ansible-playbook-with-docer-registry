init: docker create_certbot users create_registry docker_login

docker:
	ansible-playbook -i hosts.yml create_docker.yml

create_certbot:
	ansible-playbook -i hosts.yml create_certbot.yml

create_registry:
	ansible-playbook -i hosts.yml create_registry_docker.yml

users:
	ansible-playbook -i hosts.yml create_users.yml

docker_login:
	ansible-playbook -i hosts.yml docker-login.yml

