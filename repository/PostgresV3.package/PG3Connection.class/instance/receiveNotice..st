simple-query-protocol
receiveNotice: aPG3NoticeResponse

	noticeHandler ifNotNil: [ noticeHandler value: aPG3NoticeResponse ]