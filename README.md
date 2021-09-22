Hostsharing-Ansible-OpenPetra
=============================
This Ansible playbook will install the latest OpenPetra release on a server from www.hostsharing.net.
It installs its own version of Mono, and will need a daemon for Mono and for Nginx.

To use these modules we have to create a file named ".hsadmin.properties" in the home directory of the package admins. Into that file we have to insert the packagename and password of the package admin. 

Example:

    xyz00@h99:~$ cat .hsadmin.properties 
    xyz00.passWord=insertpkgadminpasswordhere

This file should be protected, else it would be world readable:

    xyz00@h99:~$ chmod 600 .hsadmin.properties

We clone this git-repo to our machine:

    $ git clone https://github.com/tpokorra/Hostsharing-Ansible-OpenPetra.git

Then we change the working directory:

    $ cd Hostsharing-Ansible-OpenPetra

All needed parameters can be set in the inventory file now. Change xyz00 to the name of your package admin. Set the name of a domain, a new user and a password. We can edit the inventory file with:

    $ vim inventory
    
The option -i can be used to read this inventory file instead of the /etc/ansible/hosts file. If we want to login with an SSH-Key instead of an SSH-Password, we have to remove the -k option from the following string. The -K is needed to prompt us once for the sudo password of the new user. We run:

    $ ansible-playbook -i inventory playbook-openpetra.yml -k -K

Now we can reach our site via:

    https://openpetra.example.org

Please use the user `demo` with password `demo`, or use the user `sysadmin` with password `CHANGEME`.

IMPORTANT: please change both passwords as soon as possible! see https://docs.openpetra.org/howtos/initial-instance-setup.html

We have installed a demo database with data already, so that you don't need to setup the ledger etc.
If you want to load a base database, follow the instructions at https://docs.openpetra.org/howtos/reset-database.html

For updates, please run the script:

    $ bin/upgrade-openpetra.sh

--- Open Source Hosting ---
 https://www.hostsharing.net
