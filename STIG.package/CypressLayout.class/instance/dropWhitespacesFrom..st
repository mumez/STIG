private
dropWhitespacesFrom: aString
	| str |
	str := aString.
	^str copyFrom: 1 to: (str findLast: [:each | each isSeparator not])