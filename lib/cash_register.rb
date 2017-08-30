require 'pry'

class CashRegister

  attr_reader :discount, :item
  attr_accessor :total

  def initialize(discount=20)
    @total = 0
    @discount = discount
  end

  def add_item(item, price, quantity=1)
    @items_array ||= []
    @items_array.fill(item, @items_array.length, quantity)
    @last_transaction = price * quantity
    self.total += price * quantity
  end

  def items
    @items_array
  end

  def num_initialize_args
    puts self.method(:new).arity
  end

  def apply_discount
    if self.discount == 20 #is there a better way to do this?
      "There is no discount to apply."
    else
      self.total *= (1-(self.discount/100.0))
      "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def void_last_transaction
    self.total -= @last_transaction
  end

end

# blah = CashRegister.new(30)
# blah.add_item("apple", 100)
# binding.pry
# ""
