class WikisController < ApplicationController
    # skip_before_action :authenticate_user!
    # wikis controller has user assigned and privacy assigned
    def new
        @user = current_user
        @wiki = Wiki.new
    end
    
    def index
        @user = current_user
        @wiki = Wiki.order("published_at DESC")
        @wiki = Wiki.all
    end
    
    def create
     @wiki = Wiki.new
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     @wiki.private = params[:wiki][:private]
     @user = current_user

     if @wiki.save
       flash[:notice] = "Your new Chomp was saved"
       redirect_to @wiki
     else
       flash.now[:alert] = "Error! Your Chomp jumped back into the ocean, please try again"
       render :new
     end
    end
    
    def show
        @wiki = Wiki.find(params[:id])
    end
    
    def edit
        @wiki = Wiki.find(params[:id])
    end
    
    def update
     @wiki = Wiki.find(params[:id])
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     @wiki.private = params[:wiki][:private]

     if @wiki.save
       flash[:notice] = "Your updates have been noted!"
       redirect_to @wiki
     else
       flash.now[:alert] = "Error! Chomp was not updated, please try again"
       render :new
     end
    end
    
    def destroy
      @user = current_user
      @wiki = Wiki.find(params[:id])
      if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" has been deleted. I hope you're proud of yourself!"
      redirect_to root_path
      else
      flash[:alert] = "Error! This Chomp remains! Maybe you should think again about deleting someone else's hard work!"
      render :show
      end
    end
end
