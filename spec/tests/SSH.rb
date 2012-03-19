
describe "SSH" do
  
  it "returns one result" do
    chdir {
      `SSH "*"`.should == File.basename(Dir.glob("nodes/*.json").first).sub(".json", '')
    }
  end

  it "adds -p argument if port is specified" do
    chdir {
      `SSH "with_port"`.should == "-p 2222 ben_and_jerry"
    }
  end

  it "adds includes user if \"user\" is specified" do
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

