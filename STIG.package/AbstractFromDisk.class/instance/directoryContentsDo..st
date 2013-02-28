accessing
directoryContentsDo: aBlock
	directory exists ifFalse: [^ Transcript cr; show: 'Directory does not exist - just ignore: ', directory asString].
	directory directoryContents
		do: [:each | aBlock value: (directory trustedConstruct: each) value: each]