# == Schema Information
#
# Table name: compras
#
#  id                                                  :integer          not null, primary key
#  sustento_comprobante_id                             :integer          not null
#  cliente_id                                          :integer          not null
#  comprobante_id                                      :integer          not null
#  fecha_registro                                      :date             not null
#  numero_serie_establecimiento                        :string(255)      not null
#  numero_serie_punto_emision                          :string(255)      not null
#  numero_serie_comprobante                            :string(255)      not null
#  fecha_emision                                       :date             not null
#  autorizacion_comprobante                            :string(255)      not null
#  retencion_iva_bienes                                :float            default(0.0), not null
#  retencion_iva_servicios                             :float            default(0.0), not null
#  retencion_iva_cien                                  :float            default(0.0), not null
#  concepto_retencion_fuente_id                        :integer
#  base_imponible_renta                                :float
#  porcentaje_retencion_fuente                         :integer
#  numero_serie_retencion_establecimiento              :string(255)
#  numero_serie_retencion_punto_emision                :string(255)
#  numero_serie_retencion                              :string(255)
#  numero_autorizacion_retencion                       :integer
#  fecha_emision_retencion                             :date
#  comprobante_modificado_id                           :integer
#  numero_serie_comprobante_modificado_establecimiento :string(255)
#  numero_serie_comprobante_modificado_punto_emision   :string(255)
#  numero_serie_comprobante_modificado                 :string(255)
#  numero_autorizacion_comprobante_modificado          :string(255)
#  created_at                                          :datetime
#  updated_at                                          :datetime
#  forma_de_pago                                       :string(255)      default("Efectivo"), not null
#

class Compra < ActiveRecord::Base
  include Orderable
  include Validations
  include OrderableInfo

# scopes
  scope :eager_loaded, -> {
    includes(:cliente, :comprobante, :sustento_comprobante, retenciones: [:concepto_retencion_fuente], order_items: [:item])
    .references(:cliente, :comprobante, :sustento_comprobante, :retenciones, :concepto_retencion_fuente, :order_items, :item)
  }

# relationships
  belongs_to :cliente
  belongs_to :comprobante
  belongs_to :sustento_comprobante
  belongs_to :comprobante_modificado, class_name: Comprobante, foreign_key: :comprobante_modificado_id
  has_many :order_items, as: :order, dependent: :destroy
  has_many :items, through: :order_items
  has_many :retenciones, as: :order
end
