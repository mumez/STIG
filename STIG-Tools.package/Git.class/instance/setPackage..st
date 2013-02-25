initialize-release
setPackage: aPackage
	| baseFilename dotGitFilename workTreeFilename args |
	baseFilename := self baseFilenameOf: aPackage.
	dotGitFilename := self findDotGitFilenameFrom: baseFilename.
	
	args := OrderedCollection new.
	dotGitFilename ifNotNil: [args add: ('--git-dir=', dotGitFilename asString).
		workTreeFilename := dotGitFilename head asFilename asString.
		args add: ('--work-tree=', workTreeFilename asString).
	].
	globalArgs := args asArray.

	"Array with: '--git-dir='
						, (aPackage stigRoot asFilename / aPackage name / '.git') asString
				with: '--work-tree=' , (aPackage stigRoot asFilename / aPackage name) asString"