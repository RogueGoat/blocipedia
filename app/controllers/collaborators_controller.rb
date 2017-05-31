class CollaboratorsController < ApplicationController
    
  before_action :require_sign_in
  before_action :authorize_user

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user.User.where(email: params[:user])
    collaborator = @wiki.collaborators.build(user_id: @user.id)

    if collaborator.save
      flash[:notice] = "Collaborator has been saved!"
    else
      flash.now[:alert] = "We couldn't save your collaborators, try adding them again."
    end

    redirect_to wikis_path
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed successfully."
      redirect_to wikis_path
    else
      flash[:alert] = "There was an error deleting the collaborators."
      render :show
    end
  end

  private

  def authorize_user
    wiki = Wiki.find(params[:id])
    unless current_user == wiki.user && current_user.role == 'premium' || current_user.role == 'admin'
      flash[:alert] = "Upgrade to Premium to add Collaborators!"
      redirect_to root_path
    end
  end
  
end
