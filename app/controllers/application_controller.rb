
class ApplicationController < ActionController::API
  ALLOWED_ORDER_DIRECTION = %w[desc asc].freeze

  def initialize
    super
    @direction = 'ASC'
    @order = 'id'
    @allowed_order_columns = []
    @order_by = nil
    @entity_class = nil
    @entity = nil
    @controller_params = []
  end

  protected

  # GET /entities/:id
  def show
    render json: @entity
  end

  # GET /entities(/:order(/:direction))
  def index
    begin
      @entities = @entity_class.order(@order_by).all
    rescue NoMethodError
      raise EntityClassException, @entity_class
    end
    render json: @entities
  end

  # POST /entities
  def create
    begin
      entity = @entity_class.new(entity_params)
    rescue NoMethodError
      raise EntityClassException, @entity_class
    end
    if entity.save
      render json: entity, status: :created, location: @entities
    else
      render json: entity.errors, status: :unprocessable_entity
    end
  end

  # PATCH /entities/:id
  def update
    if @entity.update(entity_params)
      render json: @entity
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entities/:id
  def destroy
    @entity.destroy
  end

  def set_order_by
    @direction = params[:direction] if ALLOWED_ORDER_DIRECTION.include? params[:direction]
    @order = params[:order] if @allowed_order_columns.include? params[:order]
    @order_by = "#{@order} #{@direction}"
  end

  def set_entity
    @entity = @entity_class.find(params[:id])
  rescue NoMethodError
    raise EntityClassException, @entity_class
  end

  def entity_params
    params.permit(*@controller_params)
  end

end
