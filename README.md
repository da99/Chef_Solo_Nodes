
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

       /* Your other Chef-related attributes. */
       /* Ignored by Chef_Solo_Nodes.         */
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
You can pass them an optional role name to filter the nodes.

    require "Chef_Solo_Nodes"

    Chef_Solo_Nodes()            # ===> [ Hash, Hash ]
    Chef_Solo_Nodes('role_name') # ===> [ Hash, Hash ]
    Chef_Solo_IPs('db')          # ===> [ "hostname", "user@hostname:port" ]

If the argument is an Array, it will treat each element as a 
file path to a JSON file:

    paths  = [ "node/FILE_1.json", "node/FILE_2.json" ]
    Chef_Solo_Nodes paths
    Chef_Solo_IPs   paths


Usage: Capistrano
----------------

    require "Chef_Solo_Nodes"
    role :app, *Chef_Solo_IPs('app')
    role :db,  *Chef_Solo_IPs('db')

Equivalent to:

    role :app, "user@host:port", "192.0.0.42"
    role :db,  "super.secret.base"

Usage: Shell
------------

Provides 2 executables: IP and SSH

They are meant to generate arguments for other programs:

    $ ping -c 3 $( IP --no-user file_name )
    ping -c 3 my.ip.address

    $ ssh $( SSH file_name )
    ssh -p 2222 user@ip.address

    $ knife prepare $( SSH file_name )
    knife prepare -p 4567 user@ip.address

**Tip:** the last example above uses
[knife-solo](https://github.com/matschaffer/knife-solo).

**Errors:** If the file is not found, they print **xx.xx.xx.xx** 
to standard output and exit 1. Unexpected, unplanned errors 
are printed to standard error.

Usage: IP, IP --no-user
--------------------

    $ IP file_name     # parses node/file_name.json
    
Depending on whether the attributes exist, the results could take
any form of the following:

    127.0.0.1  
    127.0.0.1:2222
    user@127.0.0.1:2222 

Remove **user@** with: **IP --no-user file_name**

Usage: SSH, SSH --no-user
--------------------

    $ SSH file_name    # parses node/file_name.json

Depending on whether the attributes exist, the results could take
any form of the following:

    127.0.0.1
    user@127.0.0.1
    -p 2222 user@127.0.0.1

Remove **user@** with: **SSH --no-user file_name**

Run Tests
---------

    git clone git@github.com:da99/Chef_Solo_Nodes.git
    cd Chef_Solo_Nodes
    bundle update
    bundle exec bacon spec/main.rb

"I hate writing."
-----------------------------

If you know of existing software that makes the above redundant,
please tell me. The last thing I want to do is maintain code.

