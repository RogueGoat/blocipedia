class WikiController < ApplicationController
    
    def new
        @wiki = Wiki.new
    end
    
    def index
        @wiki = Wiki.all
    end
    
    def create

     @wiki = Wiki.new
     @wiki.title = params[:post][:title]
     @wiki.body = params[:post][:body]

     if @wiki.save
       flash[:notice] = "Your new Wiki was saved"
       redirect_to @wiki
     else
       flash.now[:alert] = "Error! Wiki was not saved, please try again"
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
     @wiki.title = params[:post][:title]
     @wiki.body = params[:post][:body]

     if @wiki.save
       flash[:notice] = "Your updates have been noted!"
       redirect_to @wiki
     else
       flash.now[:alert] = "Error! Wiki was not updated, please try again"
       render :new
     end
    end
    
    def destroy
        @wiki = []
    end
    
end
