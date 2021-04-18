class PaymentJob < ApplicationJob
  queue_as :default

  def perform(args)
    sleep 60

    order = Order.find(args['order_id'])
    order.paid!
  end
end
