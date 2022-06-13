require_relative 'item'
class Attendee
  attr_reader :name, :budget

  def initialize(attendee)
    @name = attendee[:name]
    @budget = attendee[:budget].delete!("$").to_f
  end
end
