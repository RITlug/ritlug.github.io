describe "title", type: :feature, js: true do
  it "contains RITlug in page title" do
    visit '/'
    # `binding.pry` is useful for crafting the right selector
    # or checking the actual state of the page
    #binding.pry # test will pause here
    expect(page).to have_title "RITlug"
  end
end
