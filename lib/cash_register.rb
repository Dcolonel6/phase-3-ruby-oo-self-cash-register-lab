
require 'pry'
class CashRegister
    attr_accessor :discount, :total
    attr_reader :items_added

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items_added = {}
    end

    def add_item(title,price,quantity=1)
        items_added[title] = {price: price,quantity:quantity}
        self.total += price * quantity       

    end
    
    def apply_discount
        self.total = self.total * (100 - self.discount) / 100        
        discount > 0 ? "After the discount, the total comes to $#{self.total}." : "There is no discount to apply." 
    end

    def items
        items_str = []
        self.items_added.each do |key,hash_details|
            hash_details[:quantity].times { |i| items_str << key}
        end
        items_str
    end

    def void_last_transaction
        last_item = self.items_added.keys.last
        self.total = self.total - self.items_added[last_item][:price] * self.items_added[last_item][:quantity]

    end
end
#cr = CashRegister.new 20
#binding.pry
#0