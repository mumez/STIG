STIG
stigFromDisk: aFromDisk preview: aBoolean

	| deltas layout compositeChange |
	layout := DirectoryLayout root: self stigRoot.
	deltas := layout deltaSetsFrom: self to: aFromDisk.
	compositeChange := deltas buildCompositeChange.
	aBoolean
		ifTrue: [compositeChange changesSize > 0 ifTrue: [compositeChange inspect] ifFalse: [Transcript cr; show: 'No changes in: ',  self  printString]]
		ifFalse: [compositeChange execute]