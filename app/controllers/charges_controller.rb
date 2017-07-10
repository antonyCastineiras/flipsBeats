class ChargesController < ApplicationController
	def new
		@amount = current_order.subtotal * 100
	end

	def create
		@order = current_order
		@amount = @order.subtotal
		@amount_in_pence = (@amount * 100).to_i

		customer = Stripe::Customer.create(
				email: params[:stripeEmail],
				source: params[:stripeToken]
			)

		charge = Stripe::Charge.create(
			customer: customer.id,
			amount: @amount_in_pence,
			description: 'Rails Stripe customer',
			currency: 'gbp'
		)

		if charge["paid"] == true
			@order.order_status_id = 4
			@order.save	
			session[:order_id] = nil
		end

		rescue Stripe::CardError => e
  		flash[:error] = e.message
  		redirect_to new_charge_path 
  	
	end
end
