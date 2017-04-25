class WikiController < ApplicationController
    
    def new
        @wiki = Wiki.new
    end
    
    def index
        @wiki = Wiki.all
    end
    
    def create
     @wiki = Wiki.new
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]

     if @wiki.save
       flash[:notice] = "Your new Bloci was saved"
       redirect_to @wiki
     else
       flash.now[:alert] = "Error! Bloci was not saved, please try again"
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

     if @wiki.save
       flash[:notice] = "Your updates have been noted!"
       redirect_to @wiki
     else
       flash.now[:alert] = "Error! Bloci was not updated, please try again"
       render :new
     end
    end
    
    def destroy
      @wiki = Wiki.find(params[:id])
      if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" has been deleted. I hope you're proud of yourself!"
      redirect_to root_path
      else
      flash[:alert] = "Error! This Bloci remains! Maybe you should think again about deleting someone else's hard work!"
      render :show
      end
    end
end
