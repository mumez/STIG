STIG
stigFromDisk: aFromDisk preview: aBoolean

	| deltas layout compositeChange |
	layout := DirectoryLayout root: self stigRoot.
	deltas := layout deltaSetsFrom: self to: aFromDisk.
	compositeChange := deltas buildCompositeChange.
	aBoolean ifTrue: [compositeChange inspect] ifFalse: [compositeChange execute]