describe "Home page", type: :feature, js: true do
  it "redirects to announcements page after clicking Previous Announcements button" do
    visit '/'
    find('.mdl-card__actions > a').click
    expect(page).to have_current_path('/announcements')
  end
end
