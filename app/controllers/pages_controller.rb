class PagesController < ApplicationController
  def home
    @items_import = ItemsImport.new
    @customers = Customer.all
  end
end
