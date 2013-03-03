menus
stigReadPreviewMenuItem
	<itemInMenu: #(#pundleMenu #stigMenu) position: 10.2>

	^(MenuItem labeled: 'Read Preview')
		value: [self packages do: [:eachPackage | eachPackage stigFromDiskPreview]]