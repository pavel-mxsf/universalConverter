rollout universalConverter "Universal Converter" (
	struct prop (name, type)
	local mysuperclasses = #(light, camera, material, textureMap, shape, helper, modifier, filter, atmospheric)
	local mysuperclassesNames = for n in mysuperclasses collect n as string
	local currentclasses
	local currentclassesNames =#()
	local props
	local propsNames
	dropdownlist ddsuperclasses "" items:mysuperclassesNames across:1
	dropdownlist ddsource "source" across:2 items:currentclassesNames
	dropdownlist dddestination "destination" items:currentclassesNames
	listbox lbsourceProps "" across:2
	listbox lbdestProps ""
	
	function extractProperties cls = (
		ss = stringstream ""
		ret = #()
		showclass ((cls as string)+".*") to ss
		while not eof ss do (
			readline ss
			
			)
		)
	
	on ddsuperclasses selected val do (
		currentclasses = mysuperclasses[val].classes
		currentclassesNames = for o in currentclasses collect o as string
		ddsource.items = currentclassesNames
		dddestination.items = currentclassesNames		
		)
		
	on ddsource selected val do (
		props = getpropnames currentclasses[val]
		propsNames = for o in props collect (o as string + "   " + classof o)
		lbsourceProps.items = propsNames
		lbdestProps.items = propsNames
		)
	
	on universalConverter open do
		(
			
			
			
			)
	)
	
createdialog universalConverter width:500