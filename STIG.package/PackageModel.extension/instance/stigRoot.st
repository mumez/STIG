STIG
stigRoot

	^(self propertyAt: #STIGRoot ifAbsent: [ nil ]) ifNil: [ STIG.DefaultLayout defaultRoot ]