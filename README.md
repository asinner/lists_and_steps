# README
## Approach
This was a relatively easy app to create. The first thing I did was write 6 tests. They were as follows
```ruby
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
```

These tested the CRUD operations of the resource. You may ask where are #show, #edit, #new? These are implicitly tested within tests.

The next set of tests involved steps.
```ruby
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
```

This did the same but for steps. 
Next I generated resources for both objects:
`rails g resource List name`
and
`rails g resource step description list:references`
After adding these two resources I nested the resources in `routes.rb`:
```ruby
resources :list do
	resources :steps
end
```
I inserted `has_many :steps` into the `list.rb` model to give it the association methods.
After this I created the views to allow the behavior I needed.
