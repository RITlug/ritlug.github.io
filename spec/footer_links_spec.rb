describe "Footer links", type: :feature, js: true do
  
  before(:each) do
    # Navigate to home page before each test
    visit '/'
    
    # Find all links
    @footerLinks = all('.mdl-mega-footer--link-list')
  end
  
  describe "Navigate links" do
    before(:each) do
      @links = @footerLinks[0].all('li > a')
    end
    
    it "has 6 total links" do
      expect(@links.length).to eq(6)
    end
    
    it "renders the links" do
      expect(@links[0].text).to eq('Home')
      expect(@links[1].text).to eq('Announcements')
      expect(@links[2].text).to eq('Talks')
      expect(@links[3].text).to eq('About')
      expect(@links[4].text).to eq('Get Involved')
      expect(@links[5].text).to eq('CampusGroups')
    end
  end
  
  describe "RIT links" do
    before(:each) do
      @links = @footerLinks[1].all('li > a')
    end
    
    it "has 3 total links" do
      expect(@links.length).to eq(3)
    end
    
    it "renders the links" do
      expect(@links[0].text).to eq('www.rit.edu')
      expect(@links[1].text).to eq('RIT School of Computing')
      expect(@links[2].text).to eq('RIT Club Page')
    end
  end
  
  describe "Linux Resources" do
    before(:each) do
      @links = @footerLinks[2].all('li > a')
    end
    
    it "has 5 total links" do
      expect(@links.length).to eq(5)
    end
    
    it "renders the links" do
      expect(@links[0].text).to eq('ArchWiki')
      expect(@links[1].text).to eq('Kernel Newbies')
      expect(@links[2].text).to eq('Linux Subreddit')
      expect(@links[3].text).to eq('DistroWatch')
      expect(@links[4].text).to eq('RIT Mirror')
      expect(@links[0].text).to eq('ArchWiki')
    end
  end
  
  describe "Feeds" do
    before(:each) do
      @links = @footerLinks[3].all('li > a')
    end
    
    it "has 2 total links" do
      expect(@links.length).to eq(2)
    end
    
    it "renders the links" do
      expect(@links[0].text).to eq('Announcements')
      expect(@links[1].text).to eq('Talks')
    end
  end
  
end
