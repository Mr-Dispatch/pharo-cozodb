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

		spec package: 'CozoDB-Core'.

		spec
			group: 'default' with: #( 'Core' );
			group: 'Core' with: #( 'CozoDB-Core' 'NeoJSON') ]
]
