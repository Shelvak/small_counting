class Flow < ActiveRecord::Base
  has_paper_trail

  attr_accessible :description, :amount, :earn

  validates :description, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validates :earn, inclusion: { in: [true, false] }

  after_save :sum_to_flows_count

  def initialize(attributes = nil, options = {})
    super(attributes, options)

    self.earn ||= false
  end

  def to_s
    self.description
  end

  def self.filtered_list(query)
    query.present? ? magick_search(query) : scoped
  end

  def sum_to_flows_count
    flows_count = FlowsCount.first

    calc_amount = self.amount_was.present? ?
      self.amount - self.amount_was :
      self.amount
      
    self.earn ? 
      flows_count.sum_to_in(calc_amount) : 
      flows_count.sum_to_out(calc_amount)
  end
end
