# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book SUNNY', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'JK Rowling'
    fill_in "book[price]", with: 33
    select '2025', from: 'book_published_date_1i'
    select 'December', from: 'book_published_date_2i'
    select '25', from: 'book_published_date_3i'

    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
  end
end  

RSpec.describe 'Creating a book empty title RAINY', type: :feature do
  scenario 'invalid inputs' do
    visit new_book_path
    fill_in "book[title]", with: ''
    click_on 'Create Book'
    expect(page).to have_content('Error creating book.')
  end
end  

RSpec.describe 'Creating a book only author RAINY', type: :feature do
  scenario 'invalid inputs' do
    visit new_book_path
    fill_in "book[author]", with: 'JK ROWling'
    click_on 'Create Book'
    expect(page).to have_content('Error creating book.')
  end
end  

RSpec.describe 'Creating a book only price RAINY', type: :feature do
  scenario 'invalid inputs' do
    visit new_book_path
    fill_in "book[price]", with: 33
    click_on 'Create Book'
    expect(page).to have_content('Error creating book.')
  end
end  

RSpec.describe 'Creating a book only published date RAINY', type: :feature do
  scenario 'invalid inputs' do
    visit new_book_path
    select '2025', from: 'book_published_date_1i'
    select 'December', from: 'book_published_date_2i'
    select '25', from: 'book_published_date_3i'
    click_on 'Create Book'
    expect(page).to have_content('Error creating book.')
  end
end

