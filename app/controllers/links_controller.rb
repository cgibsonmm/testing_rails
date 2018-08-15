class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
    else
      render :new
      flash.now[:error] = "Error saving Link."
    end
  end

  private

  def link_params
    params.require(:link).permit(:link_title, :link_url)
  end
end
