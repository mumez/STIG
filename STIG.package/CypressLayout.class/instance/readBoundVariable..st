loading
readBoundVariable: variable

	variable fileContentsDo: [:eachFile :eachTail |
		self readVariableOrPropertiesFrom: eachTail parent: eachFile using: variable
	] ignoring: [:eachTail | eachTail = self commentFile].

	variable directory: 'class' contentsDo: [ :file :tail |
		file extension = '.st' ifTrue: [ self readMethod: file tail: tail instance: false using: variable ] ].
	variable directory: 'instance' contentsDo: [ :file :tail |
		file extension = '.st' ifTrue: [ self readMethod: file tail: tail instance: true using: variable ] ].
	^variable