Class {
	#name : #BaselineOfCozoDB,
	#superclass : #BaselineOf,
	#category : #BaselineOfCozoDB
}

{ #category : #baselines }
BaselineOfCozoDB >> baseline: spec [
	<baseline>

	spec for: #common do: [
		spec
			baseline: 'NeoJSON'
			with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].

		spec
			package: 'CozoDB-Core' with: [ spec requires: #( 'NeoJSON' ) ];
			package: 'CozoDB-Core-Tests' with: [ spec requires: #( 'CozoDB-Core' ) ];
			package: 'CozoDB-Tools-Pharo' with: [ spec requires: #( 'CozoDB-Core' ) ].

		spec
			group: 'Core' with: #( 'CozoDB-Core' );
			group: 'Tests' with: #( 'CozoDB-Core-Tests' );
			group: 'Tools' with: #( 'CozoDB-Tools-Pharo' );
			group: 'all' with: #( 'Core' 'Tests' 'Tools');
			group: 'default' with: #( 'all' ) ]
]
