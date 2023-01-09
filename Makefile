install_tf:
	wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip
	unzip terraform_*_linux_amd64.zip
	rm -fv terraform_*_linux_amd64.zip
	mkdir -p ~/.local/bin
	mv terraform ~/.local/bin/
	echo "export PATH=~/.local/bin:${PATH}" >> ~/.bashrc
	source ~/.bashrc
	terraform -install-autocomplete