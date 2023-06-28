class UtVideo420 extends Format
	new: =>
		@displayName = "UT Video yuv420p"
		@supportsTwopass = false
		@videoCodec = "utvideo"
		@audioCodec = "pcm_s16le"
		@outputExtension = "avi"
		@acceptsBitrate = false

	getPostFilters: =>
		{"format=yuv420p"}

formats["utvideo-yuv420p"] = UtVideo420!

class UtVideo22 extends Format
	new: =>
		@displayName = "UT Video yuv422p"
		@supportsTwopass = false
		@videoCodec = "utvideo"
		@audioCodec = "pcm_s16le"
		@outputExtension = "avi"
		@acceptsBitrate = false

	getPostFilters: =>
		{"format=yuv422p"}

formats["utvideo-yuv422p"] = UtVideo22!

class UtVideo444 extends Format
	new: =>
		@displayName = "UT Video yuv444p"
		@supportsTwopass = false
		@videoCodec = "utvideo"
		@audioCodec = "pcm_s16le"
		@outputExtension = "avi"
		@acceptsBitrate = false

	getPostFilters: =>
		{"format=yuv444p"}

formats["utvideo-yuv444p"] = UtVideo444!
