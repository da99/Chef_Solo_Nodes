
Chef\_Solo\_Nodes
===============

Parse files from "nodes/\*.json" to help you integrate your Chef-Solo
nodes with Capistrano, Knife-Solo, SSH, etc.


Implementation
--------------

It's easier to understand if you see the code. 
[It's just one page long.](https://github.com/da99/Chef_Solo_Nodes/blob/master/lib/Chef_Solo_Nodes.rb)

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

    role :app, "user@host:port", "xx.xx.xx.xx"
    role :db, "xx.xx.xx.xx"

Usage: Shell
------------

Provides 3 executables: CAP\_IP, IP, SSH

Usage: CAP\_IP
--------------------

    $ CAP_IP file_name 
    127.0.0.1  
    # Read from nodes/file_name.json

    $ CAP_IP file_with_port
    127.0.0.1:2222

    $ CAP_IP file_with_user_and_port
    vagrant@127.0.0.1:2222 

Usage: IP
--------------------

The user is excluded in the final print out, unlike with CAP\_IP.

    $ IP file_with_user_and_port
    127.0.0.1:2222
    # Read from nodes/file_with_user_and_port.json
    
    $ IP file_with_no_port
    127.0.0.1

Usage: SSH
--------------------

    $ SSH file_name
    127.0.0.1
    # Read from nodes/file_name.json

    $ SSH file_with_specified_user_or_login
    vagrant@127.0.0.1

    $ SSH file_with_specified_port
    -p 2222 vagrant@127.0.0.1

    $ ssh $( SSH vagrant )
    ssh -p 2222 vagrant@127.0.0.1

    # Using knife-solo: https://github.com/matschaffer/knife-solo 
    $ knife prepare $( SSH file_name )
    knife prepare -p 2222 vagrant@localhost


