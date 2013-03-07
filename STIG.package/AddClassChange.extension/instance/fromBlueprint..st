initialize-release
fromBlueprint: aClassBlueprint

	imports := self parseImports: aClassBlueprint importsString.
	isPrivate := aClassBlueprint isPrivate.
	superclassName := aClassBlueprint superclassReference ifNotNil: #asString.
	instanceVariableNames := aClassBlueprint instanceVariables.
	classInstanceVariableNames := aClassBlueprint classInstanceVariables.
	indexedType := aClassBlueprint behaviorType.
	objectName := aClassBlueprint reference asString.
	nameSpaceName := aClassBlueprint reference environmentName.
	self package: aClassBlueprint livePackage.
	definition := '<1s> defineClass: #<2s>
	superclass: <3p>
	indexedType: <4p>
	private: <5p>
	instanceVariableNames: <6p>
	classInstanceVariableNames: <7p>
	imports: <8p>
	category: <9p>'
				expandMacrosWithArguments: (OrderedCollection new  
						add: nameSpaceName;
						add: aClassBlueprint reference simpleName;
						add: aClassBlueprint superclassReference;
						add: indexedType;
						add: isPrivate;
						add: aClassBlueprint instanceVariablesString;
						add: aClassBlueprint classInstanceVariablesString;
						add: aClassBlueprint importsString;
						add: aClassBlueprint category; yourself)