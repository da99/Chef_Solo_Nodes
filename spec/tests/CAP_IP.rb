
describe "CAP_IP" do
  
  it "prints xx.xx.xx.xx if file is not found" do
    chdir {
      `CAP_IP not.found.json`.should == "xx.xx.xx.xx"
    }
  end

  it "exists with 1 if not found" do
    chdir {
      `CAP_IP not.found.json`
      $?.exitstatus.should == 1
    }
  end
  
  it "returns only one result" do
    chdir {
      `bundle exec CAP_IP "*"`.should == "freemont"
    }
  end

  it "includes user if specified" do
    chdir {
      `bundle exec CAP_IP "with_user"`.should == "RjD2@localhost"
    }
  end
  
  
end # === IP

