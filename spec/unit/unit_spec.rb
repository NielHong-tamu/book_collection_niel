# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
        title: 'harry potter',
        author: 'JK ROwling',
        price: 33,
        published_date: Date.today
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an author name ' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without price ' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid price not integer' do
    subject.price = 'dbc'
    expect(subject).not_to be_valid
  end

  it 'is not valid without publish date' do
    subject.published_date = nil
    expect(subject).not_to be_valid
  end
end

  