# feature 'User sign up' do
#   scenario 'I can sign up as a new user' do
#     expect { sign_up }.to change(User, :count).by(1)
#     expect(page).to have_content('Welcome, john@makers.com')
#     expect(User.first.email).to eq('john@makers.com')
#   end
# end

feature 'User sign up' do

  scenario 'requires a matching confirmation password' do
    # again it's questionable whether we should be testing the model at this
    # level.  We are mixing integration tests with feature tests.
    # However, it's convenient for our purposes.
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'john@makers.com',
              password: '123',
              password_confirmation: '123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  let!(:user) do
    User.create(email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end

  def sign_in(email: 'john@makers.com', password: '123')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

#   scenario 'with a password that does not match' do
#   expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
#   expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
#   expect(page).to have_content 'Password and confirmation password do not match'
# end

  scenario 'I cant sign up without an email address' do 
    expect {sign_up(email: nil)}.not_to change(User, :count) 
  end 

   scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do 
    sign_up
    expect { sign_up }.to_not change(User, :count)
  expect(page).to have_content('Email is already taken')
  end 

end
