module SubscriptionsHelper

  def pay_button user, subscription
    if subscription.paid?
      button_tag class: 'btn btn-success' do
        content_tag :strong, 'Paid :)'
      end
    else
        link_to 'pay now!', pay_user_subscription_path(user_id: user.id, id: subscription.id), method: :post, class: 'btn btn-danger'
    end
  end

end
