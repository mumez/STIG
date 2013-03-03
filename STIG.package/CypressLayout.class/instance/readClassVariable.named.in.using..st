loading
readClassVariable: aFilename named: classVarName in: classBindingReference using: fromDisk
	| klass blueprint reference props |
	(klass := classBindingReference value) ifNil: [^self]. "this class does not exist"
	props := Dictionary new.
	props at: 'namespace' put: klass fullName asString.
	props at: 'name' put: classVarName.
	reference := self makeReference: props.
	blueprint := SharedVariableBlueprint new.
	blueprint original: aFilename.
	blueprint reference: reference.
	blueprint category: 'accessing' .
	blueprint isPrivate:  false .
	blueprint isConstant: false.
	blueprint initializer: nil .
	fromDisk addBlueprint: blueprint.
	^fromDisk