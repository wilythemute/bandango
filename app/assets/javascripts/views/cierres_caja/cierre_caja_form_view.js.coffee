Bandango.CierreCajaFormView = Bandango.ModelBackedView.extend
  modelBinding: "controller.model"

  cierreCajaSaved: (cierreCaja) ->
    @successCallback "Cierre de caja guardado"
    @get("controller").transitionToRoute "cierres_caja.show", cierreCaja.get("id")

  saveCierreCaja: ->
    @get("model").save().then $.proxy(@cierreCajaSaved, @), $.proxy(@failureSavingCierreCaja, @)

  submit: ->
    @saveCierreCaja()
    @set "submitting", true
    false
