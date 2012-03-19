
describe "permissions of bin/" do
  
  it "should be 750" do
    `stat -c %a bin`.strip
    .should.be == "750"
  end
  
end # === permissions of bin/

