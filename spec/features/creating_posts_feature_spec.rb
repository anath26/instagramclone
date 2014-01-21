require 'spec_helper'

describe 'creating a new post' do

  it 'is created from a form, providing Title and Content' do
    login
    visit '/posts/new'
    fill_in 'Title', with: 'Hello world'
    fill_in 'Content', with: 'Hello from our Capybara test'
    click_button 'Create Post'

    expect(page).to have_content 'Hello world'
    expect(page).to have_content 'Hello from our Capybara test'
    expect(current_path).to eq '/posts'
    
  end
end