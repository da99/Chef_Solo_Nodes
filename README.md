
Chef\_Solo\_Nodes
===============

Parse files from "nodes/\*.json" to help you integrate your Chef-Solo
nodes with Capistrano, Knife-Solo, SSH, etc.

The .json file can optionally define any of the following attributes:

  * "ipaddress" - If not defined, file name used: node/[FILE\_NAME].json
  * "user" || "login"
  * "port"

Example: node/Machine\_Name.json
--------------------------------
    
    { 
       "ipaddress": "localhost", 
       "port": 2222, 
       "user": "vagrant",
       "roles": ["dev"],
       "run_list": [ "recipe[...]", "recipe[....]"]
    }

Implementation
--------------

Most of the action is in
[less than 100 lines of code.](https://github.com/da99/Chef_Solo_Nodes/blob/master/lib/Chef_Solo_Nodes.rb)

Installation
-----------

    gem install Chef_Solo_Nodes

Usage: Ruby
----------

Provides two functions: Chef\_Solo\_Nodes(), Chef\_Solo\_IPs(). 

    require "Chef_Solo_Nodes"

    Chef_Solo_Nodes() # ===> [ Hash, Hash ]
    Chef_Solo_Nodes('role_name') # ===> [ Hash, Hash ]
    Chef_Solo_IPs('db') # ===> [ String, String ]

Usage: Capistrano
----------------

    require "Chef_Solo_Nodes"
    role :app, *Chef_Solo_IPs('app')
    role :db, *Chef_Solo_IPs('db')

Equivalent to:

    role :app, "user@host:port", "192.0.0.42"
    role :db, "super.secret.base"

Usage: Shell
------------

Provides 3 executables: CAP\_IP, IP, SSH

If no node is found, it will print "xx.xx.xx.xx" to
standard output and exit status of 1.

Usage: CAP\_IP
--------------------

    $ CAP_IP file_name 
    127.0.0.1  
    # Parses "nodes/file_name.json"

    $ CAP_IP file_with_port
    127.0.0.1:2222

    $ CAP_IP file_with_user_and_port
    vagrant@127.0.0.1:2222 

Usage: IP
--------------------

The user is excluded in the final print out, unlike with CAP\_IP.

    $ IP file_with_user_and_port
    127.0.0.1:2222
    # Parses "nodes/file_with_user_and_port.json" 
    
    $ IP file_with_no_port
    127.0.0.1

Usage: SSH
--------------------

    $ SSH file_name
    127.0.0.1
    # Parses "nodes/file_name.json"

    $ SSH file_with_specified_user_or_login
    vagrant@127.0.0.1

    $ SSH file_with_specified_port
    -p 2222 vagrant@127.0.0.1

    $ ssh $( SSH vagrant )
    ssh -p 2222 vagrant@127.0.0.1

    # Using knife-solo: https://github.com/matschaffer/knife-solo 
    $ knife prepare $( SSH file_name )
    knife prepare -p 2222 vagrant@localhost


