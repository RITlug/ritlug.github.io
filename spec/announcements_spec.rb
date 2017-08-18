describe "Announcements page", type: :feature, js: true do
  it "has valid continue reading links" do
    visit '/announcements/'
    all('.mdl-card__actions > a').each do |el|
      el.click
      expect(page).to have_css('.announcements-page')
      visit '/announcements/'
    end
  end
end
