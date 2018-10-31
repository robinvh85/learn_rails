class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was created.'
    else
      # render :new
      render js: :create
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      respond_to do |format|
        format.js { render :file => "create.js.erb", locals: { model: @customer } }
      end
    end
  end

  def destroy
    @customer.destroy
    format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :phone, :email, :avatar)
  end
end
