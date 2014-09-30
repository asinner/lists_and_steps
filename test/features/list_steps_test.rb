require 'test_helper'

feature 'List steps' do
  scenario '#create' do
    visit list_path(lists(:one))
    fill_in 'Description', with: 'First you turn the oven on'
    click_on 'Create Step'
    page.text.must_include 'Step added'
    page.text.must_include 'First you turn the oven on'
  end

  scenario '#update' do
    visit list_path(lists(:one))
    find("#step_#{steps(:one).id}").click_link('Edit')
    fill_in 'Description', with: 'Updated description'
    click_on 'Update Step'
    page.text.must_include 'Step updated'
    page.text.must_include 'Updated description'
  end

  scenario '#destroy' do
    visit list_path(lists(:one))
    find("#step_#{steps(:one).id}").click_link('Delete')
    page.text.must_include 'Step removed'
    page.text.wont_include steps(:one).description
  end
end
