accessing
fileContentsDo: aBlock
	self fileContentsDo: aBlock ignoring: [:tail | false]