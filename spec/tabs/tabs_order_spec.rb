describe "tabs order", type: :feature, js: true do
  # Test tabs order
  
  it "First tab is Home" do
    visit '/'
    expect(find('.mdl-layout__tab-bar > a:nth-child(1)').text).to eq('HOME')
  end
  
  it "Second tab is Announcements" do
    visit '/'
    expect(find('.mdl-layout__tab-bar > a:nth-child(2)').text).to eq('ANNOUNCEMENTS')
  end
  
  it "Third tab is Talks" do
    visit '/'
    expect(find('.mdl-layout__tab-bar > a:nth-child(3)').text).to eq('TALKS')
  end
  
  it "Fourth tab is About" do
    visit '/'
    expect(find('.mdl-layout__tab-bar > a:nth-child(4)').text).to eq('ABOUT')
  end
  
  it "Fifth tab is Get Involved" do
    visit '/'
    expect(find('.mdl-layout__tab-bar > a:nth-child(5)').text).to eq('GET INVOLVED')
  end
  
  it "Sixth tab is The Link" do
    visit '/'
    expect(find('.mdl-layout__tab-bar > a:nth-child(6)').text).to eq('THE LINK')
  end
end
