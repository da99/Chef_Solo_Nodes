
Chef\_Solo\_Nodes
===============

Provides two functions: Chef\_Solo\_Nodes(), Chef\_Solo\_IPs()


Installation
-----------

    gem install Chef_Solo_Nodes

Ruby Usage
----------

    require "Chef_Solo_Nodes"

    Chef_Solo_Nodes() # ===> [ Hash, Hash ]
    Chef_Solo_Nodes('role_name') # ===> [ Hash, Hash ]
    Chef_Solo_IPs('db') # ===> [ String, String ]

Capistrano Usage
----------------

    require "Chef_Solo_Nodes"
    role :app, *Chef_Solo_IPs('app')
    role :db, *Chef_Solo_IPs('db')

Executable Usage: IP
--------------------

    $ IP file_glob  
    127.0.0.1

    $ IP file_with_specified_port
    127.0.0.1:2222

    $ IP file_with_specified_user_and_port
    127.0.0.1:2222 # user is not included

Executable Usage: SSH
--------------------

    $ SSH file_glob  
    127.0.0.1

    $ SSH file_with_specified_user_or_login
    vagrant@127.0.0.1

    $ SSH file_with_specified_port
    -p 2222 vagrant@127.0.0.1

    $ ssh `SSH vagrant`
    ssh -p 2222 vagrant@127.0.0.1

    # Using knife-solo: https://github.com/matschaffer/knife-solo 
    $ knife prepare `SSH file_name`
    knife prepare -p 2222 vagrant@localhost


Implementation
--------------

It's easier to
understand if you see the code. 
[It's just one page long.](https://github.com/da99/Chef_Solo_Nodes/blob/master/lib/Chef_Solo_Nodes.rb)

[bin/SSH](https://github.com/da99/Chef_Solo_Nodes/blob/master/bin/SSH)

[bin/IP](https://github.com/da99/Chef_Solo_Nodes/blob/master/bin/IP)


