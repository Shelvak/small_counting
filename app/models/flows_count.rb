class FlowsCount < ActiveRecord::Base
  has_paper_trail

  attr_accessible :out, :in, :total

  def sum_to_in(amount)
    self.in += amount
    self.total += amount
    self.save
  end

  def sum_to_out(amount)
    self.out += amount
    self.total -= amount
    self.save
  end
end
