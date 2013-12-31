# == Schema Information
#
# Table name: ventas
#
#  id             :integer          not null, primary key
#  cliente_id     :integer          not null
#  comprobante_id :integer          not null
#  base_no_iva    :float            not null
#  base_iva_zero  :float            not null
#  base_iva       :float            not null
#  monto_iva      :float            not null
#  iva_retenido   :float            not null
#  renta_retenido :float            not null
#  created_at     :datetime
#  updated_at     :datetime
#

class Venta < ActiveRecord::Base
  self.table_name = :ventas

# relationships
  belongs_to :cliente
  belongs_to :comprobante

end
