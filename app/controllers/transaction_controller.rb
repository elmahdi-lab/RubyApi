# TransactionController

class TransactionController < ApplicationController

  @all_filters = false
  before_action :set_entity, only: %w[show update destroy]
  before_action only: %w[create update] do
    @all_filters = true
  end
  before_action :set_order_by, only: %w[index]

  def initialize
    super
    @entity_class = Transaction
    @allowed_order_columns = %w[id description amount created_at]
    @controller_params = %w[description amount]
    @controller_params.push(:account_id, :bank_id) if @all_filters
  end

end
