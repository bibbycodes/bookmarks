feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end

  feature 'Veiwing bookmarks' do
    scenario 'A user can see bookmarks' do
      visit('/bookmarks')

      expect(page).to have_content("http://www.makersacademy.com")
      expect(page).to have_content("http://www.google.com")
      expect(page).to have_content("http://www.github.com")
    end
  end
end