private
setTypeToClassBlueprint: blueprint using: properties

	| type |
	type := (properties at: 'type' ifAbsent: [#none]) asSymbol.
	type = #normal ifTrue: [type := #none].	"For FileTree compatibility"
	blueprint behaviorType: type