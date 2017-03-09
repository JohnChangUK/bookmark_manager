require './app/models/link.rb'

feature 'Viewing links' do

  before(:each) do
    Link.create(url: 'www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'social media')])
    Link.create(url: 'www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'www.yahoo.com', title: 'Yahoo', tags: [Tag.first_or_create(name: 'search')])
  end

  scenario 'so that I can see existing links on the webpage' do
    Link.create(url: 'http://www.facebook.com', title: 'Facebook')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
  end

  scenario 'I can filter links by tags' do
    visit '/tags/search' do
      expect(page.status_code).to eq(200)

      within 'ul#links' do
      expect(page).not_to have_content 'Facebook'
      expect(page).not_to have_content 'Makers Academy'
      expect(page).to have_content 'Yahoo'
      expect(page).to have_content 'Google'
  end
end
end
end
