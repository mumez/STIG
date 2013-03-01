private
setSuperToClassBlueprint: blueprint using: properties

	| superref superklass |
	superref := ((properties at: 'superNamespace' ifAbsent: [nil])
				ifNil: ['']
				ifNotNil: [:ns | ns , '.']) , (properties at: 'super').

	(BindingReference pathString: superref) ifDefinedDo: [:found | 
		superklass := found.
	] elseDo: [
		superklass := (Smalltalk bindingFor: superref) value.
		superklass ifNil: [ | candidates |
			candidates := Smalltalk allNameSpaces select: [:each | (each bindingFor: superref) notNil].
			candidates isEmpty ifTrue: [^ Transcript cr; show: 'No superclass found. Resolve this class first: ', superref printString].
			candidates size > 1 ifFalse: [^ Transcript cr; show: 'Ambiguous cass name: ', superref, ' Mutiple candidates: ', candidates printString].
			superklass := candidates first at: superref.
		]
	].

	blueprint
		superclassReference: superklass fullName
				asQualifiedReference makeUnambiguous