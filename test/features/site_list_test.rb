require 'test_helper'

feature 'As a site owner I want lists' do
  scenario '#create' do
    visit root_path
    click_on 'New list'
    fill_in 'Name', with: 'This is a test list'
    click_button 'Create List'
    page.text.must_include 'List was successfully created'
    page.text.must_include 'This is a test list'
  end

  scenario '#edit' do
    visit list_path(lists(:one))
    find("#list_#{lists(:one).id}").click_link('Edit')
    fill_in 'Name', with: 'Updated A List'
    click_button 'Update List'
    page.text.must_include 'List was successfully updated'
    page.text.must_include 'Updated A List'
  end

  scenario '#destroy' do
    visit list_path(lists(:one))
    find("#list_#{lists(:one).id}").click_link('Delete')
    page.text.must_include 'List was destroyed'
    page.text.wont_include lists(:one).name
  end
end
