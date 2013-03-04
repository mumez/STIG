converting
emitAdditionChangesTo: aCompositeChange

	| change |
	change := Refactory.Browser.AddMethodChange new.
	change source: self source.
	change objectName: self classReference asString.
	change isMeta: self isInstanceBehavior not.
	change protocols: self category.
	change package: (Store.Registry packageNamed: self packageName).
	aCompositeChange addChange: change