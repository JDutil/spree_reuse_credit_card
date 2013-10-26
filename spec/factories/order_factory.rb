FactoryGirl.define do

  factory :order_in_address_state, :parent => :order do
    after(:build) { |order|
      order.line_items << FactoryGirl.create(:line_item)
    }

    after(:create) { |order|
      order.next!
    }
  end

  factory :order_in_delivery_state, :parent => :order_in_address_state do
    after(:create) { |order|
      create(:state, :country => create(:country))
      create(:shipping_method)
      create(:stock_location)
      order.next!
    }
  end

end
