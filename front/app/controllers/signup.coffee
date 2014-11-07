`import Ember from 'ember'`
`import { request } from 'ic-ajax'`

SignupController = Ember.Controller.extend
  needs: ['login']
  actions:
    signup: ->
      user =
        email:    @get('identification')
        password: @get('password')
        password_confirmation: @get('password_confirmation')

      request '/users',
        type: 'POST'
        data: user: user
        dataType: 'json'
      .then (response) =>
        if response['success']
          console.log 'Signed up!'
          @get 'controllers.login'
          .get 'session'
          .authenticate 'simple-auth-authenticator:devise',
            identification: user['email']
            password:       user['password']
          @transitionToRoute 'application'
        else
          console.log 'Oops!'

`export default SignupController`
