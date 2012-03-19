
describe "Chef_Solo_Nodes()" do
  
  it "returns an Array of Hashes from ./nodes/*.json" do
    chdir {
      Chef_Solo_Nodes().map(&:class).uniq.should == [Hash]
    }
  end

  it "sets default :ipaddress to filename" do
    chdir { 
      Chef_Solo_Nodes('no_ip').first['ipaddress'].should == "no_ip"
    }
  end
  
  it "selects nodes based on given role name" do
    chdir {
      Chef_Solo_Nodes('app').map { |h| h['ipaddress'] }.sort
      .should == %w{  custom_port freemont localhost }
    }
  end
  
end # === Chef_Solo_Nodes()

