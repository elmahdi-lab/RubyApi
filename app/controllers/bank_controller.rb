# frozen_string_literal: true

class BankController < ApplicationController
  before_action :set_entity, only: %w[show update destroy]
  before_action :set_order_by, only: %w[index]

  def initialize
    super
    @entity_class = Bank
    @allowed_order_columns = %w[id name created_at]
    @controller_params = [:name]
  end

end
