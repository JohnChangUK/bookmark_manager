def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'john@makers.com'
  fill_in :password, with: '123'
  click_button 'Sign up'
end
