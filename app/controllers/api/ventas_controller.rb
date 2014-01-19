module Api
  class VentasController < ApiController
  
    before_action :require_login
    respond_to :json

    def index
      @ventas = Venta.includes(:cliente, :comprobante, :order_items => [:item]).page(params[:page])
      render json: @ventas, meta: { total_pages: @ventas.total_pages, page: @ventas.current_page }
    end

    def show
      respond_with Venta.includes(:order_items => [:item]).cached_find(params[:id])
    end

    def create
      respond_with :api, Venta.create_with_order_items(venta_params, order_items_venta_params)
    end

    def update
      venta = Venta.update_with_order_items(params[:id], venta_params, order_items_venta_params)
      render json: venta
    end

    private

    def venta_params
      params.require(:venta).permit :cliente_id,
                                    :comprobante_id
    end
    def order_items_venta_params
      params.require(:venta).permit :order_items => [:cantidad, :item_id]
    end
    
  end
end
