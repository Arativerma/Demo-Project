class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    # Render your checkout form
    #render 'new'
  end

  def create
    @amount = 500 # Amount in cents (adjust to your needs)
 # Create a payment session using the Stripe gem
    begin
    	@course =Course.find_by(params[:id])
    @session = Stripe::Checkout::Session.create({
    payment_method_types: ['card'],
     mode: 'payment', 
    line_items: [
      {
        price_data: {
          currency: 'INR',
          product_data: { # Change 'course_data' to 'product_data'
            name: 'Course title', # Customize the name
            description: 'Description of the course purchase' # Customize the description
          },
          unit_amount: @amount
        },
         quantity: 1 
      }
    ],
    success_url: 'https://example.com/success',
    cancel_url: 'https://example.com/cancel' 
   })
rescue Stripe::CardError => error
  flash[:error] = error.message
  redirect_to new_payment_path
  return
    end
    
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :currency, :payment_method_types, :card_number, :expiration_month, :expiration_year, :cardholder_name, :billing_address)
    
  end
end
