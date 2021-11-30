# AccountController
class AccountController < ApplicationController
  before_action :set_entity, only: %w[show update destroy duplicate sum]
  before_action :set_order_by, only: %w[index]

  def initialize
    super
    @entity_class = Account
    @allowed_order_columns = %w[id name created_at]
    @controller_params = [:name]
  end

  # GET /entities/1/sum
  def sum
    sum = Transaction.sum_per_account(@entity)
    render json: sum
  end

  # GET /entities/1/duplicate
  def duplicate
    duplicates = Transaction.duplicate_per_account(@entity)
    render json: duplicates
  end

end
