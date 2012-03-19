
describe "Chef_Solo_IPs()" do
  
  it "returns the ip addresses of all nodes" do
    chdir {
      Chef_Solo_IPs().size
      .should == Dir.glob("nodes/*.json").size
    }
  end

  it "selects ip addresses from specified role" do
    chdir {
      Chef_Solo_IPs('no_ip')
      .should == [ "no_ip:1234" ]
    }
  end

  it "includes custom port in ip address" do
    chdir{ 
      Chef_Solo_IPs('custom_port')
      .should == [ "custom_port:1234"]
    }
  end
  
end # === Chef_Solo_IPs

