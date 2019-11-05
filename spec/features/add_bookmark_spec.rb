feature 'adding bookmarks' do
  scenario 'add one bookmark' do
    truncate_and_load_bookmarks
    visit('/bookmarks')
    fill_in(:new_url, with: 'http://www.wired.com')
    click_button('Add')
    expect(page).to have_content('http://www.wired.com')
  end
end