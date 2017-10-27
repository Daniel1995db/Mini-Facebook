App.chatrooms = App.cable.subscriptions.create "ChatroomsChannel",
  connected: ->


  disconnected: ->


  received: (data) -> 
    console.log data


