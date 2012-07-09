class SubscriptionsController < ApplicationController

  load_resource :user
  load_resource through: :user
  authorize_resource through: :current_user

  before_filter :authenticate_user!

  before_filter :authorize_index!, only: [:index]

  def index
    @subscriptions = @user.subscriptions.paginate(:page => params[:page]).order(:created_at)
  end

  def show
    @container_items = @subscription.container_items.paginate(:page => params[:page])
  end

  def edit
  end

  def create
    @subscription.container_items  << @user.cart.container_items.map{|item| item.dup}
    @user.subscriptions << @subscription
    begin
      User.transaction do
        raise ActiveRecord::Rollback unless @user.cart.container_items.clear
        @user.save!
      end
      redirect_to user_subscriptions_path, notice: 'Subscription was successfully created.'
    rescue
      @container_items = @user.cart.container_items.paginate(page: params[:page])
      render "users/cart"
    end
  end

  def update
    @subscription = Subscription.find(params[:id])
    if @subscription.update_attributes(params[:subscription])
      redirect_to user_subscriptions_path(id: @subscription.id), notice: 'Subscription was successfully updated.'
    else
      render "edit"
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    if @subscription.destroy
      flash[:notice] = "Successfully unsubscribed"
    else
      flash[:notice] = "Can't unsubscribe now"
    end
    redirect_to user_subscriptions_path
  end

  def pay
    @subscription = Subscription.find(params[:id])
    @subscription.paid = true
    if @subscription.save
      flash[:notice] = "Successfully paid"
    else
      flash[:notice] = "Not possible to pay for subscription"
    end
    redirect_to user_subscriptions_path
  end

  private 

  def authorize_index!
    if params[:user_id] != current_user.id.to_s && !current_user.admin?
      raise CanCan::AccessDenied
    end
  end
  
end
