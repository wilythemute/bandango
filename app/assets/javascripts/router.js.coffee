# For more information see: http://emberjs.com/guides/routing/

Bandango.Router.map ()->
  @route "login"
  @route "dashboard"
  @resource "me", ->
    @route "index", path: "/"
    @route "edit"
  @resource "facturas", ->
    @route "index", path: "/"
    @route "new"
  @resource "clientes", ->
    @route "index", path: "/"
    @route "new"
