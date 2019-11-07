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
end