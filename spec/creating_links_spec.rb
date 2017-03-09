feature 'Creating Links' do
  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in 'url', with: 'https://facebook.com/'
    fill_in 'title', with: 'Welcome to Facebook'
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content 'Welcome to Facebook'
    end
  end
end
