
describe "IP" do
  
  it "prints xx.xx.xx.xx if file is not found" do
    chdir {
      `IP wrong.droids 2>/dev/null`.should == "xx.xx.xx.xx"
    }
  end

  it "exists with 1 if not found" do
    chdir {
      `IP dana.carveys.billions 2>/dev/null`
      $?.exitstatus.should == 1
    }
  end
  
  it "returns only one result" do
    chdir {
      `bundle exec IP "*"`.should == "freemont"
    }
  end

  it "includes user if specified" do
    chdir {
      `bundle exec IP "with_user"`.should == "RjD2@localhost"
    }
  end

  it "includes login if specified" do
    chdir {
      `bundle exec IP "with_login"`.should == "log_RjD2@localhost"
    }
  end

  it "excludes user if --no-user is specified" do
    chdir {
      `bundle exec IP --no-user "with_user"`.should == "localhost"
    }
  end

  it "excludes login if --no-user is specified" do
    chdir {
      `bundle exec IP --no-user "with_login"`.should == "localhost"
    }
  end
  
end # === IP

