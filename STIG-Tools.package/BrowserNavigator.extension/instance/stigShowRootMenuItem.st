menus
stigShowRootMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 91.5>

	^(MenuItem labeled: 'Show Root')
		value: [ self packages do: [ :package | Transcript cr; show: package printString, ' - ', (package propertyAt: #STIGRoot) printString]	]