class ChargesController < ApplicationController

  def create
      
   customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken]
    )
   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 1500,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )
    
    current_user.update_attributes(role: 'premium')
 
   flash[:notice] = "You've been upgraded to premium, #{current_user.email}!"
   redirect_to root_path # or wherever
 
   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end

  def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 1500
   }
#   binding.pry
  end
  
  def destroy
    #   binding.pry
   current_user.update_attributes(role: 'standard')
   
   flash[:notice] = "You're no longer subscribed as  premium user, #{current_user.email} (CHUM!)"
   redirect_to root_path    
  end
end