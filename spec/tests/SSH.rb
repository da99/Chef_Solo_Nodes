
describe "SSH" do
  
  it "returns one result" do
    chdir {
      `SSH "*"`.should == File.basename(Dir.glob("nodes/*.json").first).sub(".json", '')
    }
  end
  
end # === SSH

