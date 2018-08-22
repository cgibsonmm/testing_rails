class LinksController < ApplicationController
  def index
    @links = Link.all.order("upvotes - downvotes DESC")

    @link_json = LinkSerializer.new(@links).serialized_json

    respond_to do |format|
      format.html
      format.json { render json: @link_json}
    end
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

  def upvote
    @link = Link.find(params[:id])
    @link.upvote
    redirect_to links_path
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:link_title, :link_url)
  end
end
