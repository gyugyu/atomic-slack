Dotenv = require 'dotenv'
Dotenv.load

SlackClient = require 'slack-client'
$ = require 'react'

client = new SlackClient process.env.SLACK_API_TOKEN

class MessageListItem extends $.Component
  render: ->
    $.createElement 'div', {},
      $.createElement 'div', {}, @props.message.text

class MessagesSection extends $.Component
  state:
    messages: []

  componentDidMount: ->
    client.on 'message', @_appendMessage.bind @

  componentWillUnmount: ->
    client.removeListener 'message', @_appendMessage.bind @

  render: ->
    messages = @state.messages.map (message) ->
      $.createElement MessageListItem, {key: message.ts, message: message}
    $.createElement 'div', {}, messages

  _appendMessage: (message) ->
    messages = @state.messages
    messages.push message
    console.log message
    @setState
      messages: messages

client.login()

module.exports = MessagesSection
