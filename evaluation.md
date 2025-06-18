# Evaluation:
- Virtualbox: start VM
- Host Terminal:
	+ Git clone files from school/personal repo
	+ Copy files from host into VM:
		```bash
		scp -P [SSH port] -r [Clone of the Git repo] [username]@localhost:[directory]
		```
	+ Exmaple:
		```bash
		scp -P 2442 -r hitran/Inception hitran@localhost:/home/hitran/
		```

- VM:
	+ Copy/ create .env file in ~/Inception/srcs
		```bash
		cp .env Inception/srcs/
		cd Inception
		make
		```
	+ Open browser: open hitran.42.fr then explore the wordpress page.
	+ Explore mariadb: 
	