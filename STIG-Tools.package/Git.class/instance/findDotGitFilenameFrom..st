private
findDotGitFilenameFrom: aFilename
	| fname dotGit |
	fname := aFilename asAbsoluteFilename.
	[fname components size <= 1] whileFalse: [
	(dotGit := fname / '.git') exists ifTrue: [^dotGit].
	fname := fname head asFilename.
	].
	^nil