module Trade
  #An user is a very important piece of the trade.
  #He is able to buy and to activate some items,
  #so that they can be sold to another user.

  class User

    attr_accessor :name, :credits, :items

    def self.named( name )
      student = self.new
      student.name = name
      student
    end

    def initialize
      self.credits = 100
      self.items = Array.new
    end

    #creates an item, with a given name and price.
    # @param [String] name
    # @param [Integer] price
    def create_item(name, price)
      item = Trade::Item.named( name , price , self )
    end

    #adds the created item to the list of items.
    # @param [Item] item
    def add(item)
      items.push(item)
    end

    #activated the item, so that it is able to be sold.
    # @param [Item] item
    def activate(item)
      if items.any? {|x| x == item}
        item.activate
      end
    end

    #deactivates the item, so that it is disabled.
    # @param [Item] item
    def deactivate(item)
      if items.any? {|x| x == item}
        item.deactivate
      end
    end

    #buys an item, if the buyer isn't the owner of this item yet, has enough money and the
    #item itself had been activated so far. So the buyer pays the price and can add the item to his list
    #of items.
    # @param [Item] item
    def buy(item)
      if item.active == true && self.credits >= item.price && item.owner != self
        seller = item.owner
        seller.sell(item)
        item.owner = self
        self.credits -= item.price
        self.add(item)
        self.deactivate(item)
      end
    end

    #sells an item, so that the user gets the money and take the
    #item out of his list of items.
    # @param [Item] item
    def sell(item)
      self.credits += item.price
      items.delete_if {|x| x == item}
    end

    def list_of_active_items
      active_items = items.clone
      active_items.delete_if {|x| !x.active}
      string = ""
      active_items.each {|x| string += x.to_s + " -- "}
      "#{string}"
    end

    def list_of_all_items
      string = ""
      items.each {|x| string += x.to_s + " -- "}
      "#{string}"
    end

  end

end