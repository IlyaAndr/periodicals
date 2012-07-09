class KindsController < ApplicationController

  load_and_authorize_resource

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @kinds = Kind.paginate(page: params[:page]).order(:name)
  end

  def show
    @editions = @kind.editions.paginate page: params[:page] 
  end

  def new
  end

  def edit
  end

  def create
    if @kind.save
      redirect_to @kind, notice: 'Kind was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @kind.update_attributes(params[:kind])
      redirect_to @kind, notice: 'Kind was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @kind.destroy
    redirect_to kinds_url
  end

end
