class UsersController < ApplicationController

  load_and_authorize_resource

  before_filter :authenticate_user!

  def index
    @users = User.paginate(page: params[:page]).where('id != ?', current_user.id).order(:username)
  end

  def new
  end
  
  def create
    if @user.save
      redirect_to users_path, notice: "Successfully created User." 
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @user != current_user && @user.destroy
      flash[:notice] = "Successfully delete User."
    else
      flash[:alert] = "Unable to delete User."
    end
    redirect_to users_path
  end

  def cart
    @container_items = @user.cart.container_items.paginate(page: params[:page])
    @subscription = Subscription.new user_id: @user.id
  end

  def delete_from_cart
    if @user.delete_from_cart params[:container_item_id]
      redirect_to cart_user_path, notice: "Successfully deleted from cart"
    else
      redirect_to cart_user_path, alert: "Unable to delete from cart"
    end
  end

  def add_to_cart
    container_item = @user.add_to_cart(params[:edition_id])
    if container_item.save
      redirect_to editions_path, notice: "Successfully added to cart"
    else
      redirect_to editions_path, alert: "Unable to add to cart"
    end
  end

end
