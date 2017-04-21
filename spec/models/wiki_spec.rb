require 'rails_helper'

RSpec.describe Wiki, type: :model do
    
  describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
 
 
      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end
 

      it "instantiates @wiki" do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end
    
end
