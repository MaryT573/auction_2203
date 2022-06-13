require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  before(:each) do
    @item = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  it 'exists' do
    expect(@item).to be_a(Item)
  end

  it ' has name and bids' do
    expect(@item.name).to eq('Chalkware Piggy Bank')
    expect(@item.bids).to eq({})
  end

  it 'can add bids to item' do
    @item.add_bid(@attendee2, 20)
    expect(@item.bids.keys).to eq([@attendee2])
    expect(@item.bids.values).to eq([20])
    @item.add_bid(@attendee1, 22)
    expect(@item.bids.keys).to eq([@attendee2, @attendee1])
  end

  it 'can find current_high_bid' do
    @item.add_bid(@attendee2, 20)
    @item.add_bid(@attendee1, 22)
    expect(@item.current_high_bid).to eq(22)
  end

  it 'can find current high bid' do
    @item.add_bid(@attendee2, 20)
    @item.add_bid(@attendee1, 22)
    expect(@item.current_high_bid).to eq(22)
  end

  it 'can close bidding' do
    @item.add_bid(@attendee2, 20)
    @item.add_bid(@attendee1, 22)
    @item.close_bidding
    @item.add_bid(@attendee3, 70)
    expect(@item.bids.keys).to eq([@attendee2, @attendee1])
  end
end
