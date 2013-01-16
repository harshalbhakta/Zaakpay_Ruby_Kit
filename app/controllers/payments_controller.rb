class PaymentsController < ApplicationController
  
  # GET /merchant_test  
  def merchant_test
    render :layout => false 
  end
  
  # POST /post_to_zaakpay
  def post_to_zaakpay
    zr = Zaakpay::Request.new(params) 
    @zaakpay_data = zr.all_params   
    render :layout => false    
  end
  
  # POST /z_response
  def z_response
    zr = Zaakpay::Response.new(request.raw_post)  
    @checksum_check = zr.valid?
    @zaakpay_post = zr.all_params
    render :layout => false
  end
  
end