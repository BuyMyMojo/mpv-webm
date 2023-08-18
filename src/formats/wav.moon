class WAV extends Format
    new: =>
		@displayName = "WAV"
		@supportsTwopass = false -- uhh
		@videoCodec = ""
		@audioCodec = "wav"
		@outputExtension = "mp3"
		@acceptsBitrate = true

formats["wav"] = WAV!