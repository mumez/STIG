loading
readClass: aFilename using: fromDisk
	"For FileTree compatibility"

	| blueprint properties file reference |
	properties := JSON read: (fromDisk fileContents: aFilename) readStream.
	reference := self makeReference: properties.
	fromDisk reference: reference.
	(fromDisk name endsWith: '.extension') ifTrue: [^self].
	blueprint := ClassBlueprint new.
	blueprint original: aFilename.
	blueprint reference: reference.
	blueprint importsString: (self
				decodeImportsString: (properties at: 'imports' ifAbsent: [''])).
	blueprint isPrivate: (properties at: 'private' ifAbsent: [false]).
	blueprint
		instanceVariables: (properties at: 'instvars' ifAbsent: [Array new]).
	blueprint classInstanceVariables: (properties at: 'classinstvars'
				ifAbsent: [Array new]).
	blueprint attributes: (properties at: 'attributes' ifAbsent: [Array new]).
	self setTypeToClassBlueprint: blueprint using: properties.
	blueprint
		comment: ((file := aFilename directory / self commentFile) exists
				ifTrue: [fromDisk fileContents: file]
				ifFalse: ['']).
	self setSuperToClassBlueprint: blueprint using: properties.
	blueprint
		comment: ((file := aFilename directory / self commentFile) exists
				ifTrue: [fromDisk fileContents: file]
				ifFalse: ['']).
	fromDisk addBlueprint: blueprint.
	^fromDisk