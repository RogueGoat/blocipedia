class WikiController < ApplicationController
    
    def new
        @wiki = Wiki.new
    end
    
    
end
