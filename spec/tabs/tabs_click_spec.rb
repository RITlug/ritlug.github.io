describe "tabs click", type: :feature, js: true do
  # Click tabs
  
  it "Click Home tab" do
    visit '/'
    find('.mdl-layout__tab-bar > a:nth-child(1)').click
    expect(page).to have_current_path('/')
  end
  
  it "Click Announcements tab" do
    visit '/'
    find('.mdl-layout__tab-bar > a:nth-child(2)').click
    expect(page).to have_current_path('/announcements/')
  end
  
  it "Click Talks tab" do
    visit '/'
    find('.mdl-layout__tab-bar > a:nth-child(3)').click
    expect(page).to have_current_path('/talks/')
  end
  
  it "Click About tab" do
    visit '/'
    find('.mdl-layout__tab-bar > a:nth-child(4)').click
    expect(page).to have_current_path('/about.html')
  end
  
  it "Click Get Involved tab" do
    visit '/'
    find('.mdl-layout__tab-bar > a:nth-child(5)').click
    expect(page).to have_current_path('/get-involved.html')
  end
end
