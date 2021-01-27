class ReportsController < ApplicationController
  # def new
  #   @customer = Customer.find(params[:customer_id])
  #   @report = Report.new
  # end

  def create
    @report = Report.new(strong_params)
    @customer = Customer.find(params[:customer_id])
    @report.customer = @customer
    redirect_to customer_path(@customer) if @report.save
  end

  private

  def strong_params
    params.require(:report).permit(:date, :content)
  end
end
