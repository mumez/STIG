menus
stigSetRootMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 90.5>

	^(MenuItem labeled: 'Set Root') value: 
			[| ans |
			ans := Dialog request: 'Root directory for this project?'
						initialAnswer: (STIG.DefaultLayout defaultRootFor: self pundle).
			ans isEmpty ifFalse: [self packages do: [:package | package propertyAt: #STIGRoot put: ans]]]