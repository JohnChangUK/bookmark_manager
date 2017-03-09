feature 'adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'www.facebook.com'
    fill_in 'title', with: 'Facebook'
    fill_in 'tags', with: 'photos'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('photos')
  end

  scenario 'Can add multiple tags to links' do
    visit '/links/new'
    fill_in 'url', with: 'www.youtube.com'
    fill_in 'title', with: 'Youtube'
    fill_in 'tags', with: 'videos education'
    click_button 'Create link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('videos', 'education')
  end
end
