feature 'editing bookmarks' do
  scenario 'editing a bookmark' do
    truncate_and_load_bookmarks
    visit('/bookmarks')
    find_by_id('edit_makers_academy').click
    fill_in(:edit_url, with: 'http://www.ohmydayz.com')
    fill_in(:edit_title, with: 'Oh My Dayz')
    click_button('Edit Bookmark')
    expect(page).to have_content('Oh My Dayz')
  end

  scenario 'Adding an invalid URL' do
    truncate_and_load_bookmarks
    visit('/bookmarks')
    find_by_id('edit_makers_academy').click
    fill_in(:edit_url, with: 'invalid_url')
    fill_in(:edit_title, with: 'invalid_url_title')
    click_button('Edit Bookmark')
    expect(page).to have_content('Please enter a valid url')
    expect(page).not_to have_content('invalid_url_title')
  end

  scenario 'Adding an invalid title' do
    truncate_and_load_bookmarks
    visit('/bookmarks')
    find_by_id('edit_makers_academy').click
    fill_in(:edit_url, with: 'http://www.wired.com')
    fill_in(:edit_title, with: '')
    click_button('Edit Bookmark')
    expect(page).to have_content('Please enter a title')
    expect(page).not_to have_content('invalid_url_title')
  end
end