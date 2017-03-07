require './app/models/link.rb'

feature 'Viewing links' do
  scenario 'so that I can see existing links on the webpage' do
    Link.create(url: 'http://www.facebook.com', title: 'Facebook')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
  end
end
