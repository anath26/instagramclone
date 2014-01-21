require 'spec_helper'

describe 'editing a post' do
  
  before do
    create(:post)
  end

  it 'can change the Title and Content' do
    login

    visit '/posts'
    click_link 'Edit post'

    fill_in 'Title', with: 'Bye'
    fill_in 'Content', with: 'Universe'
    click_button 'Update Post'

    expect(page).to have_content 'Bye'
    expect(page).to have_content 'Universe'
  end

end