
describe "SSH" do
  
  it "prints xx.xx.xx.xx if file is not found" do
    chdir {
      `SSH not.found.json`.should == "xx.xx.xx.xx"
    }
  end

  it "exists with 1 if not found" do
    chdir {
      `SSH not.found.json`
      $?.exitstatus.should == 1
    }
  end

  it "returns one result" do
    chdir {
      `SSH "*"`.should == File.basename(Dir.glob("nodes/*.json").first).sub(".json", '')
    }
  end

  it "adds -p argument if port is specified" do
    chdir {
      `SSH "with_port"`.should == "-p 2222 BenNJer"
    }
  end

  it "adds user if \"user\" is specified" do
    chdir {
      `SSH "with_user"`.should == "RjD2@localhost"
    }
  end

  it "adds user if \"user\" is specified" do
    chdir {
      `SSH "with_login"`.should == "log_RjD2@localhost"
    }
  end
  
end # === SSH

