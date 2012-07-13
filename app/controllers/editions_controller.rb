class EditionsController < ApplicationController

  load_and_authorize_resource 
  before_filter :authenticate_user!, except: [:index, :show]

  cache_sweeper :edition_sweeper

  def index
    @editions = Edition.paginate(:page => params[:page]).order(:title)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @edition.save
      redirect_to @edition, notice: 'Edition was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @edition.update_attributes(params[:edition])
      redirect_to @edition, notice: 'Edition was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @edition.destroy
    redirect_to editions_url
  end

  def search
    @search = Edition.search do
      fulltext params[:q] do
        minimum_match 1
        boost_fields :title => 2.0
        phrase_fields :title => 3.0
      end
      paginate page: params[:page], :per_page => 8
    end
  end

end
