# class PaymentsController < ApplicationController
# 	def new
#     @payment = Payment.new(payment_params)
#     render 'new' # Render your checkout form
#   end

#  def create
#   @amount = 500 # Amount in cents (adjust to your needs)
  
#   # Create a payment intent

#   #  user = Stripe::User.create(
#   #   email: params[:stripeEmail],
#   #   source: params[:stripeToken]
#   # )
#   @session = Stripe::Payment::Session.create({
#   	 payment_method_types: ['card']
#   	 line_items: [{
#   	 	name: course.title,
#         amount: course.price,
#         currency: 'usd',
#         description: 'Course purchase'}],
#         mode: 'payment',
   
#   })
#    rescue Stripe::CardError => e
#   flash[:error] = e.message
#   redirect_to new_payment_path

# end 

#    if payment_succeeded
#     redirect_to success_payment_path
#   else
#     flash[:error] = 'Payment failed. Please check your card details and try again.'
#     redirect_to failure_payment_path
 
#   # Render a view that collects card details and submits the payment
# end

#   def success
#     # Handle successful payment (e.g., display a success message)
#   end

#   def failure
#     # Handle payment failure (e.g., display an error message)
#   end
#   def payment_params
#   params.require(:payment).permit(:amount, :currency, :payment_method_types, :card_number, :expiration_month, :expiration_year, :cardholder_name, :billing_address, :payment_status) # Add your attributes here
# end
# end



class PaymentsController < ApplicationController
  def new

    @payment = Payment.new(payment_params)
    # Render your checkout form
    render 'new'
  end

  def create
    @amount = 500 # Amount in cents (adjust to your needs)

    begin
      # Create a payment intent
      @session = Stripe::Payment::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          name: course.title, # You need to define 'course' somewhere in your code
          amount: @amount,
          currency: 'usd',
          description: 'Course purchase'
        }],
        mode: 'payment',
      })

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
    end

    # Check if payment_succeeded is defined somewhere in your code
    if payment_succeeded
      redirect_to success_payment_path
    else
      flash[:error] = 'Payment failed. Please check your card details and try again.'
      redirect_to failure_payment_path
    end
  end

  def success
    # Handle successful payment (e.g., display a success message)
  end

  def failure
    # Handle payment failure (e.g., display an error message)
  end

  private

  def payment_params
    params.require(:payment).permit(:amount, :currency, :payment_method_types, :card_number, :expiration_month, :expiration_year, :cardholder_name, :billing_address) # Add your attributes here
  end
end
