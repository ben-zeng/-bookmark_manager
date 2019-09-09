require './app.rb'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content('BookmarkManager')
  end

  scenario 'visiting /bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('["Bookmark1", "Bookmark2", "Bookmark3"]')
  end

end
