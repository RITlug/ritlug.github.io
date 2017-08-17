describe "tabs active", type: :feature, js: true do
  # Test active tabs
  
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
