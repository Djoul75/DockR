class InvoicesController < ApplicationController
  before_action :publication_find, only: %i[show edit update destroy]

  def index
    # @invoices = Invoice.all
    @invoices = policy_scope(Invoice).order(created_at: :desc)
  end

  def show
    authorize @invoice
  end

  def new
    @invoice = Invoice.new
    authorize @invoice
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user_id = current_user.id
    authorize @invoice
    if @invoice.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    authorize @invoice
  end

  def update
    authorize @invoice
  end

  def destroy
    authorize @invoice
    @invoice.destroy
    redirect_to root_path
  end

  private

  def invoice_find
    @publication = Publication.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:purchase_date,
                                    :number_year_warranty,
                                    :brand_name,
                                    :product_name,
                                    :product_category,
                                    :document)
  end
end
