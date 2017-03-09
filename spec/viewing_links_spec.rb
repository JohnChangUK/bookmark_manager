require './app/models/link.rb'

feature 'Viewing links' do

  before(:each) do
    Link.create(url: 'www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  end

  scenario 'so that I can see existing links on the webpage' do
    Link.create(url: 'http://www.facebook.com', title: 'Facebook')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
  end


end
