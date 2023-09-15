"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestBaselineOfCozoDB,
	#superclass : #PackageManifest,
	#category : #'BaselineOfCozoDB-Manifest'
}

{ #category : #'code-critics' }
ManifestBaselineOfCozoDB class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#BaselineOfCozoDB)) #'2023-09-14T18:29:13.366+02:00') )
]
