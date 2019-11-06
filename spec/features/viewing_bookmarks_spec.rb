feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  feature 'Veiwing bookmarks' do
    scenario 'A user can see bookmarks' do
      visit('/bookmarks')

      expect(page).to have_content("Makers Academy")
      expect(page).to have_content("Ask Jeeves")
      expect(page).to have_content("Google")
    end
  end
end