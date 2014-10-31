require 'rails_helper'

describe "sign in flow" do
  include TestFactories

  describe "successful" do
    it "redirects to the topics index" do
      user = authenticated_user
      visit root_path

      within '.user-info' do
        click_link 'Sign in'
      end

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      within 'form' do
        click_button 'Log in'
      end

      expect(current_path).to eq topics_path
    end
  end
end


