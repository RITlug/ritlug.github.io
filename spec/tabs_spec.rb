describe "Navigation tabs", type: :feature, js: true do
  describe "has tabs" do
    before(:each) do
      # Navigate to home page before each test
      visit '/'
    end
    
    it "first tab is Home" do
      expect(find('.mdl-layout__tab-bar > a:nth-child(1)').text).to eq('HOME')
    end
    
    it "second tab is Announcements" do
      expect(find('.mdl-layout__tab-bar > a:nth-child(2)').text).to eq('ANNOUNCEMENTS')
    end
    
    it "third tab is Talks" do
      expect(find('.mdl-layout__tab-bar > a:nth-child(3)').text).to eq('TALKS')
    end
    
    it "fourth tab is About" do
      expect(find('.mdl-layout__tab-bar > a:nth-child(4)').text).to eq('ABOUT')
    end
    
    it "fifth tab is Get Involved" do
      expect(find('.mdl-layout__tab-bar > a:nth-child(5)').text).to eq('GET INVOLVED')
    end
    
    it "sixth tab is The Link" do
      expect(find('.mdl-layout__tab-bar > a:nth-child(6)').text).to eq('THE LINK')
    end
  end
  
  context "responds to click" do
    before(:each) do
      # Navigate to home page before each test
      visit '/'
    end
    
    it "redirects to / after clicking Home tab" do
      find('.mdl-layout__tab-bar > a:nth-child(1)').click
      expect(page).to have_current_path('/')
    end
    
    it "redirects to /announcements/ after clicking Announcements tab" do
      find('.mdl-layout__tab-bar > a:nth-child(2)').click
      expect(page).to have_current_path('/announcements/')
    end
    
    it "redirects to /talks/ after clicking Talks tab" do
      find('.mdl-layout__tab-bar > a:nth-child(3)').click
      expect(page).to have_current_path('/talks/')
    end
    
    it "redirects to /about/ after clicking About tab" do
      find('.mdl-layout__tab-bar > a:nth-child(4)').click
      expect(page).to have_current_path('/about.html')
    end
    
    it "redirects to /get-involved.html after clicking Get Involved tab" do
      find('.mdl-layout__tab-bar > a:nth-child(5)').click
      expect(page).to have_current_path('/get-involved.html')
    end
  end
  
  describe "indicates active tab" do
    it "Home tab is active on / route" do
      visit '/'
      expect(find('.mdl-layout__tab.is-active').text).to eq('HOME')
    end
    
    it "Announcements tab is active on /announcements/ route" do
      visit '/announcements/'
      expect(find('.mdl-layout__tab.is-active').text).to eq('ANNOUNCEMENTS')
    end
    
    it "Talks tab is active on /talks/ route" do
      visit '/talks/'
      expect(find('.mdl-layout__tab.is-active').text).to eq('TALKS')
    end
    
    it "About tab is active on /about.html route" do
      visit '/about.html'
      expect(find('.mdl-layout__tab.is-active').text).to eq('ABOUT')
    end
    
    it "Get Involved tab is active on /get-involved.html route" do
      visit '/get-involved.html'
      expect(find('.mdl-layout__tab.is-active').text).to eq('GET INVOLVED')
    end
  end
end
