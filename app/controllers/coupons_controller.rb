 class CouponsController < ApplicationController
   def index
     @coupons = Coupon.all
   end

   def show
     #calling an instance from the class
     @coupon = Coupon.find(params[:id])
   end

   def new
      @coupon = Coupon.new
   end

   def create
     # @coupon = Coupon.new
     # @coupon.coupon_code = params[:coupon][:coupon_code]
     # @coupon.store = params[:coupon][:store]
     # # byebug
     # @coupon.save
     @coupon = Coupon.create(coupon_params)
     redirect_to coupon_path(@coupon)
   end

   private

   def coupon_params
     params.require(:coupon).permit(:store, :coupon_code)
   end
 end
