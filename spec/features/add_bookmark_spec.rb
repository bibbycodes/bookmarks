feature 'adding bookmarks' do
  scenario 'add one bookmark' do
    truncate_and_load_bookmarks
    visit('/bookmarks')
    fill_in(:new_url, with: 'http://www.wired.com')
    fill_in(:new_title, with: 'wired')
    click_button('Add')
    expect(page).to have_content('wired')
    expect(page).not_to have_content('http://www.wired.com')
  end
end