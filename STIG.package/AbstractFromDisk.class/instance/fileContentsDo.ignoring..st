accessing
fileContentsDo: aBlock ignoring: rejectBlock
	self directoryContentsDo: 
			[:eachFile :eachTail |
			eachFile isDirectory
				ifFalse: 
					[(rejectBlock value: eachTail)
						ifFalse: [aBlock value: eachFile value: eachTail]]]