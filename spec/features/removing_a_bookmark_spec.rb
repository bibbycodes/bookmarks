feature 'removing bookmarks' do
  scenario 'removes a single url' do
    truncate_and_load_bookmarks
    visit('/bookmarks')
    find_by_id('remove_makers_academy').click
    expect(page).not_to have_content('Makers Academy')
  end
end