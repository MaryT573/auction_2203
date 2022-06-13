require_relative 'item'
require_relative 'attendee'

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    names = []
    @items.each {|item| names << item.name}
    names
  end

  def unpopular_items
    unpopular = []
    @items.each do |item|
      if item.bids == {}
        unpopular << item
      end
    end
    unpopular
  end

  def potential_revenue
    collection = []
    @items.each do |item|
      if item.bids != {}
        collection << item.bids.values.max
      end
    end
    collection.sum
  end

  # def bidders
  #   names = []
  #   @items.each do |item|
  #     if item.bids != {}
  #       item.bids.each do |bid|
  #         bid.each do |attendee|
  #           names << attendee.name
  #         end
  #       end
  #     end
  #   end
  #   names
  # end

  def bidders
    @items.map do |item|
      item.bids.keys.map do |attendee|
        attendee.name
      end
    end.flatten.uniq
  end
end

# def potential_revenue
  #   high_item_bids = @items.map do |item|
  #       item.current_high_bid.to_i
  #   end.sum
  # end

  # def potential_revenue
  #   high_item_bids = @items.map do |item|
  #     item.current_high_bid.to_i
  #   end.sum
  # end
