module Trade
  #Except of the user, items are the most important objects in the trade.
  #They can be sold and bought from the users, if they are listed in the
  #list of all active items.

  class Item

    attr_accessor :name, :price, :active, :owner

    def self.named( name, price, owner)
      item = self.new
      item.name = name
      item.price = price
      item.owner = owner
      item
    end

    def initialize
      self.active = false
    end

    #This function activates an item, which now is able to be sold.
    def activate
      self.active = true
    end

    #This functions deactivates an item, which now is disabled.
    def deactivate
      self.active = false
    end

    def to_s
      "#{name} for #{price}$"
    end

  end

end