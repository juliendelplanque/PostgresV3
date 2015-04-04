toolbuilder
buildWith: builder

	|  windowSpec listSpec panelSpec buttonSpec textSpec |
	windowSpec := builder pluggableWindowSpec new.
	windowSpec label: 'Differences of schema ', schemaMirror schema, ' and ', schemaMirror className.
	windowSpec model: self.
	windowSpec children: OrderedCollection new.
	
	selected := changes at: 1 ifAbsent: nil.	
	listSpec := builder pluggableListSpec new.
	listSpec 
		model: self;
		list: #changes; 
		getSelected: #selected; 
		setSelected: #selected:; 
		menu: #changeMenu:shifted:;
		frame: (0@0 corner: 1@0.3).
	windowSpec children add: listSpec.

	panelSpec := builder pluggablePanelSpec new.
	panelSpec children: OrderedCollection new.
	panelSpec frame: (0@0.3 corner: 1@0.38).

	buttonSpec := builder pluggableButtonSpec new.
	buttonSpec 
			model: self;
			label: 'Download All'; 
			action: #downloadAll;
			frame: (0@0 corner: 0.32@1).
	panelSpec children addLast: buttonSpec.

	buttonSpec := builder pluggableButtonSpec new.
	buttonSpec 
			model: self;
			label: 'Refresh'; 
			action: #refresh;
			frame: (0.33@0 corner: 0.65@1).
	panelSpec children addLast: buttonSpec.

	buttonSpec := builder pluggableButtonSpec new.
	buttonSpec 
			model: self;
			label: 'Upload All'; 
			action: #uploadAll;
			frame: (0.66@0 corner: 1@1).
	panelSpec children addLast: buttonSpec.
		
	windowSpec children add: panelSpec.

	textSpec := builder pluggableTextSpec new.
	textSpec 
		model: self;
		getText: #diffText; 
		frame: (0@0.38 corner: 1@1).
	windowSpec children add: textSpec.
	
	^builder build: windowSpec