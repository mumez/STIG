converting
emitModificationFrom: anOriginalBlueprint changesTo: aCompositeChange

	(anOriginalBlueprint hasSameDefinition: self)
		ifFalse: 
			[aCompositeChange
				addChange: (Refactory.Browser.AddClassChange new fromBlueprint: self)].
	(anOriginalBlueprint hasSameComment: self)
		ifFalse: [aCompositeChange addChange: self asCommentUpdateChange]