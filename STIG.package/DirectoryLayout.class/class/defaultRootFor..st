accessing
defaultRootFor: aPundle
	| curRoot |
	curRoot := aPundle propertyAt: #STIGRoot.
	(curRoot isNil or: [curRoot isEmpty]) ifTrue: [curRoot := aPundle name].
	^(Filename currentDirectory construct: curRoot)