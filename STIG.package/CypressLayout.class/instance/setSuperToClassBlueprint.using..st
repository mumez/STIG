private
setSuperToClassBlueprint: blueprint using: properties

	| superref superklass |
	superref := ((properties at: 'superNamespace' ifAbsent: [nil])
				ifNil: ['']
				ifNotNil: [:ns | ns , '.']) , (properties at: 'super').
	superklass := Compiler evaluate: superref.
	superklass ifNil: [
		Transcript cr; show: 'No superclass found. Resolve this class first: ', superref printString.
		^self
	].

	blueprint
		superclassReference: superklass fullName
				asQualifiedReference makeUnambiguous