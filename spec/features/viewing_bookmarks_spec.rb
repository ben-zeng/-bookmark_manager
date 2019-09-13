require './app.rb'

feature 'viewing bookmarks' do

  scenario 'bookmarks can be added and are visible' do
    create_test_rows
    visit '/bookmarks'
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end

  scenario 'bookmarks can be deleted' do
    create_test_rows
    visit '/bookmarks'
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end

  scenario 'bookmarks can be updated' do
    create_test_rows
    visit '/bookmarks'
    first('.bookmark').click_button'Edit'
    fill_in 'title', with: 'MA'
    click_button 'Submit'
    expect(page).to have_link('MA', href: 'http://www.makersacademy.com')
  end

  scenario 'invalid url entered' do
    visit '/bookmarks'
    fill_in 'title', with:'BBC'
    fill_in 'url', with: 'htttps://www.bbc.co.uk'
    click_button 'Submit'
    expect(page).to have_content('Invalid url!!!!')
  end

  scenario 'clicking first comments button will take you to comment page for bookmark clicked' do
    create_test_rows
    visit '/bookmarks'
    first('.bookmark').click_button'Comments'
    expect(page).to have_content('Makers Academy')
  end


end
