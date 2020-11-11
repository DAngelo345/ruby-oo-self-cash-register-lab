require 'pry'
class CashRegister

    attr_accessor :total, :discount, :all_items, :price, :quantity, :last_transaction

    def initialize(discount = 0)
        @all_items = []
        @total = 0
        @discount = discount
        @last_item = {}
        
    end

    def add_item(item, price, quantity = 1)
        counter = 0
        while counter < quantity 
            all_items << item
            counter += 1
        end
        self.total += price * quantity 
        self.last_transaction = price * quantity 
        self.quantity = quantity
    end

    def apply_discount 
        
        if discount != 0
            #binding.pry
            self.total = (total * ((100.0 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."
        end
    end

    def items
       return all_items
    end

    def void_last_transaction
        counter = 0
       
      self.total -= last_transaction
      while counter < quantity
        all_items.pop
        counter += 1

      end



    end

end