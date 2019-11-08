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

  scenario 'Adding an invalid URL' do
    visit('/bookmarks')
    fill_in(:new_url, with: 'invalid_url')
    fill_in(:new_title, with: 'invalid_url_title')
    click_button('Add')
    expect(page).to have_content('Please enter a valid url')
    expect(page).not_to have_content('invalid_url_title')
  end

  scenario 'Adding an invalid title' do
    visit('/bookmarks')
    fill_in(:new_url, with: 'http://www.wired.com')
    fill_in(:new_title, with: '')
    click_button('Add')
    expect(page).to have_content('Please enter a title')
    expect(page).not_to have_content('invalid_url_title')
  end
end