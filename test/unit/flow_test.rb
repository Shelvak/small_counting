require 'test_helper'

class FlowTest < ActiveSupport::TestCase
  def setup
    @flows_count = Fabricate(:flows_count)
    @flow = Fabricate(:flow)
  end

  test 'create' do
    assert_difference 'Flow.count' do
      @flow = Flow.create(Fabricate.attributes_for(:flow))
    end 
  end
    
  test 'update' do
    assert_no_difference 'Flow.count' do
      assert @flow.update_attributes(description: 'Updated')
    end

    assert_equal 'Updated', @flow.reload.description
  end

  test 'update amount' do
    @flow = Fabricate(:flow, amount: 200, earn: true)
    new_flows_count_total = @flows_count.reload.total + 100

    assert_no_difference 'Flow.count' do
      assert @flow.update_attributes(amount: 300)
    end

    assert_equal 300, @flow.reload.amount
    assert_equal new_flows_count_total.to_i, @flows_count.reload.total.to_i
  end
    
  test 'destroy' do 
    assert_difference('Flow.count', -1) { @flow.destroy }
  end
    
  test 'validates blank attributes' do
    @flow.description = ''
    @flow.amount = ''
    
    assert @flow.invalid?
    assert_equal 3, @flow.errors.size
    assert_equal [error_message_from_model(@flow, :description, :blank)],
      @flow.errors[:description]
    assert_equal [
      error_message_from_model(@flow, :amount, :blank),
      error_message_from_model(@flow, :amount, :not_a_number)
    ].sort, @flow.errors[:amount].sort
  end

  test 'validates inclusion attributes' do
    @flow.earn = nil 
    assert @flow.invalid?
    assert_equal 1, @flow.errors.count
    assert_equal [error_message_from_model(@flow, :earn, :inclusion)],
      @flow.errors[:earn]
  end
end
