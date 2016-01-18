	
	#installation	
	bash <(curl -L https://raw.githubusercontent.com/DoJoMi/dotbash/master/setup.sh) -i
	
	#restore to old settings	
	bash <(curl -L https://raw.githubusercontent.com/DoJoMi/dotbash/master/setup.sh) -r
	
	#.bashrc to /etc/skel to make it available for all new new created users
	bash <(curl -L https://raw.githubusercontent.com/DoJoMi/dotbash/master/setup.sh) -s
