get = Ember.get
Bandango.OrderableSerializer = DS.ActiveModelSerializer.extend
  serializeHasMany: (record, json, relationship) ->
    key = relationship.key
    if key == "orderItems"
      json["order_items_params"] = get(record, key).map (orderItem) ->
        { cantidad: orderItem.get("cantidad"), item_id: orderItem.get("item.id") }
