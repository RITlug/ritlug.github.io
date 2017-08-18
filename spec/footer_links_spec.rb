describe "Footer links", type: :feature, js: true do
  describe "navigate links" do
    before(:each) do
      # Navigate to home page before each test
      visit '/'
      @links = all('.mdl-mega-footer--link-list > li > a')
    end
    
    it "first link is Home" do
      expect(@links[0].text).to eq('Home')
    end
    
    it "second link is Announcements" do
      expect(@links[1].text).to eq('Announcements')
    end
    
    it "third link is Talks" do
      expect(@links[2].text).to eq('Talks')
    end
    
    it "fourth link is About" do
      expect(@links[3].text).to eq('About')
    end
    
    it "fifth link is Get Involved" do
      expect(@links[4].text).to eq('Get Involved')
    end
  end
end
