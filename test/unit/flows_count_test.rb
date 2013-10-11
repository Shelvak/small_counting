require 'test_helper'

class FlowsCountTest < ActiveSupport::TestCase
  def setup
    @flows_count = Fabricate(:flows_count)
  end

  test 'update' do
    assert_no_difference 'FlowsCount.count' do
      assert @flows_count.update_attributes(in: 200)
    end
  
    assert_equal 200, @flows_count.reload.in
  end
end
