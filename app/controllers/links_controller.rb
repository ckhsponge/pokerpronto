class LinksController < ApplicationController
  before_filter :authenticate
  
  def index
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :list }

  def list
    @link_pages, @links = paginate :links, :per_page => 100
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(params[:link])
    if @link.save
      flash[:notice] = 'Link was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(params[:link])
      flash[:notice] = 'Link was successfully updated.'
      redirect_to :action => 'show', :id => @link
    else
      render :action => 'edit'
    end
  end

  def destroy
    Link.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
