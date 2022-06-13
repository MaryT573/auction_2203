require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  before(:each) do
    @item = Item.new('Chalkware Piggy Bank')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'exists' do
    expect(@attendee).to be_a(Attendee)
  end

  it ' has name and bids' do
    expect(@attendee.name).to eq('Megan')
    expect(@attendee.budget).to eq(50)
  end
end
