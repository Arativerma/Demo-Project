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
    @payment = Payment.new
    # Render your checkout form
    render 'new'
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

  #   # Success URL and Cancel URL are important for redirecting the user after payment
    success_url: 'https://example.com/success', # Customize this URL
    cancel_url: 'https://example.com/cancel' # Customize this URL
   })

  # Handle successful payment session creation
  # You can use @session.id to associate it with your payment record

rescue Stripe::CardError => error
  flash[:error] = error.message
  redirect_to new_payment_path
  return
    end
    # # Check if payment_succeeded is defined somewhere in your code
    # if success(@session) # You should define this method based on your application logic
    #   redirect_to root_path
    # else
    #   flash[:error] = 'Payment failed. Please check your card details and try again.'
    #   redirect_to failure_payment_path
    # end
  end
 
  # def success

  # # @payment = Payment.success # Handle successful payment (e.g., display a success message)
  # end

  # def failure
  #   # Handle payment failure (e.g., display an error message)
  # end

  private

  def payment_params
    params.require(:payment).permit(:amount, :currency, :payment_method_types, :card_number, :expiration_month, :expiration_year, :cardholder_name, :billing_address)
    # Add your attributes here as needed
  end
end
