require './app.rb'

feature 'viewing bookmarks' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content('BookmarkManager')
  end
end
