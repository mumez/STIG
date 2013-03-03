loading
readVariableOrPropertiesFrom: eachTail parent: eachFile using: fromDisk
	eachTail = self propertyFile	ifTrue: [ (fromDisk name endsWith: '.pool')
						ifTrue: [^ self readNamespace: eachFile using: fromDisk]
						ifFalse: [^ self readClass: eachFile using: fromDisk ] ].
	((fromDisk name endsWith: '.pool') 
		or: [(fromDisk name endsWith: '.class') and: [eachTail first isUppercase and: [eachTail endsWith: '.json']]])
			 ifTrue: [^ self readSharedVariable: eachFile using: fromDisk ]