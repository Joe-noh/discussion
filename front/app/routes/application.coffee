`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`

ApplicationRoute = Ember.Route.extend ApplicationRouteMixin,
  beforeModel: ->
    @_super.apply(this, arguments)
    return @csrf.fetchToken()

`export default ApplicationRoute`
