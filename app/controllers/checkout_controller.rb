class CheckoutController < ApplicationController
    def create
        @case = Case.find(params[:id])

        if @case.nil?
            redirect_to root_path
            return
        end

        @session =Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                name: @case.name,
                amount: @case.national_id,
                currency: 'egp',
                quantity: 1,
            }],
            success_url: checkout_success_url + "?session_id={CHECKOUT_SESSION_ID}" ,
            cancel_url:  checkout_cancel_url
        )

        respond_to do |format|
          format.html { render(:text => "not implemented") }
          format.js #render create.js.erb
        end
    end

    
    def success
        @session = Stripe::Checkout::Session.retrieve(params[:session_id])
        @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
    end


    def cancel
    
    end
end
