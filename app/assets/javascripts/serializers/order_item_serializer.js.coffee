Bandango.OrderItemSerializer = Bandango.ApplicationSerializer.extend
  serialize: (orderItem, options) ->
    cantidad: orderItem.get("cantidad"), item_id: orderItem.get("item.id")
