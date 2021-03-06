menus
stigDiffMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.6>

	^(MenuItem labeled: 'Diff')
		value: [ 
			self packages with: (self packages collect: #stigDeltasFromDisk) do: [ :package :delta |
				Transcript cr; cr; print: package; space; print: delta; space; print: Timestamp now.
				delta additions do: [:each | Transcript cr; nextPut: $+; print: each ].
				delta changes with: delta originals do: [:eachChange :eachOriginal | Transcript cr; nextPut: $*; print: eachChange ].
				delta removals reverseDo: [:each | Transcript cr; nextPut: $-; print: each ] ] ]