
Chef\_Solo\_Nodes
===============

Provides two functions: Chef\_Solo\_Nodes(), Chef\_Solo\_IPs()


Installation
-----------

    gem install Chef_Solo_Nodes

Usage
-----

    require "Chef_Solo_Nodes"

    Chef_Solo_Nodes() # ===> [ Hash, Hash ]
    Chef_Solo_Nodes('role_name') # ===> [ Hash, Hash ]
    Chef_Solo_IPs('db') # ===> [ String, String ]

Implementation
--------------

  It grabs all your files using Dir.glob("./nodes/\*.json").
Chef\_Solo\_IPS() also does some magic. It's easier for you
to see the code since it's all one page long: [code](blob/master/lib/Chef_Solo_Nodes.rb)

