
describe "IP" do
  
  it "returns only one result" do
    chdir {
      `bundle exec IP "*"`.should == "freemont"
    }
  end
  
end # === IP

