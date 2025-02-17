require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
  end

  it 'exists' do
    expect(@auction).to be_a(Auction)
  end

  it 'has no items' do
    expect(@auction.items).to eq([])
  end

  it 'can add_items' do
  @auction.add_item(@item1)
  expect(@auction.items).to eq([@item1])
  end

  it 'can list item names' do
  @auction.add_item(@item1)
  @auction.add_item(@item2)
  expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  it 'can find unpopular_items' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @item1.add_bid(@attendee2, 20)
    @item2.add_bid(@attendee1, 22)
    expect(@auction.unpopular_items).to eq([@item3, @item4])
  end

  it 'can find potential revenue' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item3.add_bid(@attendee2, 15)
    @item4.add_bid(@attendee3, 50)
    expect(@auction.potential_revenue).to eq(87)
  end

  it 'can find bidder' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item3.add_bid(@attendee2, 15)
    @item4.add_bid(@attendee3, 50)
    expect(@auction.bidders).to eq(["Bob", "Megan", "Mike"])
  end

end
