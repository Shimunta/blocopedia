class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki) # Wiki.all
  end

  def show
    @wiki = find_id
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = current_user.wikis.new(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was saved successfully."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = find_id
  end

  def update
    @wiki = find_id
    @wiki.assign_attributes(wiki_params)


    if @wiki.save
      flash[:notice] = "Wiki was updated successfully"
      redirect_to @wiki
    else
      flash.now[:alerts]= "There was an error updated the Wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = find_id
  

    if @wiki.destroy
      flash[:notice] ="\"#{@wiki.title}\" was deleted"
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end
  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
  def find_id
    Wiki.find(params[:id])
  end
end
