class ChargesController < ApplicationController

  def create
   customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken]
    )
    
   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: 1500,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
    )
    # subscription = Stripe::Subscription.create(
    #   customer: customer.id,
    #   plan: "Monthly Subscription for #{current_user.email}'s Premium Memberhip."
    # )
    
    # current_user.update_attributes(stripe_id: customer.id)
    # current_user.update_attributes(role: 'premium')
    # current_user.update_attributes(stripe_subscription: subscription.id)
    
    current_user.update_attributes(role: 'premium')
 
   flash[:notice] = "You've been upgraded to premium, #{current_user.email}!"
   redirect_to root_path 
 
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
  end
  
  def destroy
    customer = Stripe::Customer.find(
      email: current_user.email,
      source: params[:stripeToken]
    )
    customer.update_attributes(role: 'standard')
    
    flash[:notice] = "You've cancelled your subscription, #{current_user.email}! (peasant!)"
    redirect_to root_path 
  end
end