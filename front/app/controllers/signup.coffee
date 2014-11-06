`import Ember from 'ember'`

SignupController = Ember.Controller.extend
  actions:
    signup: ->
      data = {}
      data['user'] =
        email:    @get('identification')
        password: @get('password')
        password_confirmation: @get('password_confirmation')

      params =
        url:  '/users'
        type: 'POST'
        data: data
        dataType: 'json'
        beforeSend: (xhr, settings) ->
          xhr.setRequestHeader 'Accept', settings.accepts.json

      new Ember.RSVP.Promise (resolve, reject) ->
        Ember.$.ajax params
        .then (response) ->
          Ember.run ->
            resolve response
        , (xhr, status, error) ->
          Ember.run ->
            reject(xhr.responseJSON || xhr.responseText)


`export default SignupController`
