class TransactionController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @Transaction =ItemTransaction.new
    @Rental =Rental.new
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction = ItemTransaction.new(transaction_params)
    @rental = Rental.new(rental_params)
   
    if @transaction.valid? && @rental.valid?
    pay_item
    @transaction.save &&  @rental.save
    redirect_to root_path
    else
      render :index
    end
   end

  private

def transaction_params
  params.permit(:token, :arium_id, :city, :house_number, :building_name, :tellnumber, :postnumber, :item_id).merge(user_id: current_user.id )
end

def rental_params
  params.permit(:rental_start, :rental_end, :item_id).merge(user_id: current_user.id)
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.price,
    card: params[:token],
    currency: 'jpy'
  )
end
end