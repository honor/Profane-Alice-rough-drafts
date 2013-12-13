require 'pusher'

Pusher.app_id = '61393'
Pusher.key = '08ad4c8d921285548468'
Pusher.secret = '68ff270e2db1ed3280c9'

data = {'message' => 'This is an HTML5 Realtime Push Notification!'}
Pusher['my_notifications'].trigger('notification', data)