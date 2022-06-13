require_relative 'attendee'
class Item
  attr_reader :bids, :name, :open_bid

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
    @open_bid = true
  end

  def add_bid(attendee, bid)
    if @open_bid == true
      @bids[attendee] = bid
    end
  end

  def current_high_bid
    current = []
    @bids.each do |key, value|
      current << value
    end
    current.max
  end

  def current_high_bid
    high = @bids.values.max
  end

  def close_bidding
    @open_bid = false
  end
end
