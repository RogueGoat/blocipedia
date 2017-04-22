class WikiController < ApplicationController
    
    def new
        @wiki = Wiki.new
    end
    
    def index
        @wiki = Wiki.all
    end
    
    def create
    end
    
    def show
        Wiki.find(params[:id])
    end
    
    def edit
    end
    
    def update
    end
    
    def destroy
        @wiki = []
    end
    
end
