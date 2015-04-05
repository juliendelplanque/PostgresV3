baselines
baseline: spec
	<baseline>
	spec for: #'common' do: [
		spec blessing: #'baseline'.
		"Dependencies"
		spec project: 'JSON' with: [
				spec
					className: #ConfigurationOfJSON;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/JSON/main/' ].
		"Packages"
		spec package: #PostgresV3. ].
