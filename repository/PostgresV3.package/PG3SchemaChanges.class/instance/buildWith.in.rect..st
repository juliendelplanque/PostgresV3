toolbuilder
buildWith: builder in: window rect: rect
	| listSpec textSpec |
	selected := changes first.	
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #changes; 
		getSelected: #selected; 
		setSelected: #selected:; 
		"menu: #changeSetMenu:shifted:; 
		keyPress: #changeSetListKey:from:;
		autoDeselect: false;"
		frame: (((0@0 extent: 1@0.5)
			scaleBy: rect extent) translateBy: rect origin).
	window children add: listSpec.

	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #diffText; 
		"setText: #contents:notifying:; 
		selection: #contentsSelection; 
		menu: #codePaneMenu:shifted:;"
		frame: (((0@0.5 corner: 1@1) scaleBy: rect extent) translateBy: rect origin).
	window children add: textSpec.
	^window