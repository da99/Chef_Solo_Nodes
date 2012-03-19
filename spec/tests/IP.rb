
describe "IP" do
  
  it "prints xx.xx.xx.xx if file is not found" do
    chdir {
      `IP not.found.json`.should == "xx.xx.xx.xx"
    }
  end

  it "exists with 1 if not found" do
    chdir {
      `IP not.found.json`
      $?.exitstatus.should == 1
    }
  end
  
  it "returns only one result" do
    chdir {
      `bundle exec IP "*"`.should == "freemont"
    }
  end

  it "does not include user if specified" do
    chdir {
      `bundle exec IP "with_user"`.should == "localhost"
    }
  end
  
  
end # === IP

