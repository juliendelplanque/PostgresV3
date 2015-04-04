listen-notify-subprotocol
receiveNotification: aPG3NotificationResponse

	(actions at: aPG3NotificationResponse conditionName ifAbsent: [ ^self ])
		cull: aPG3NotificationResponse payload