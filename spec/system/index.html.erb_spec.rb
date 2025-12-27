# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Activities index', type: :system do
  before do
    create(:activity, name: 'Read a book')
    create(:activity, name: 'Write a book')
    visit activities_path
  end

  it 'shows a list of activities' do
    expect(page).to have_text('book', count: 2)
  end

  it 'displays a form to create a new activity' do
    expect(page).to have_button('Add activity')
  end

  context 'when the form is submitted with a valid name' do
    before do
      fill_in 'activity_name', with: 'New Activity'
      click_button 'Add activity'
    end

    it 'creates a new activity' do
      expect(page).to have_text('New Activity')
    end
  end

  context 'when the form is submitted with an invalid name' do
    before do
      fill_in 'activity_name', with: ''
      click_button 'Add activity'
    end

    it 'creates a new activity' do
      expect(page).to have_text("Name can't be blank")
    end
  end

  context 'when an activity is deleted' do
    before do
      click_button 'Delete', match: :first
    end

    it 'removes it from the page' do
      expect(page).to have_text('book', count: 1)
    end
  end

  context "when user clicks the 'I'm bored' button" do
    before do
      click_link "I'm bored"
    end

    it 'displays a random activity' do
      expect(page).to have_text('You should')
    end
  end
end
