class AAC extends Format
    new: =>
		@displayName = "AAC (.m4a)"
		@supportsTwopass = false -- uhh
		@videoCodec = ""
		@audioCodec = "aac"
		@outputExtension = "m4a"
		@acceptsBitrate = true

formats["aac"] = AAC!
