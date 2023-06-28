class OGG extends Format
    new: =>
		@displayName = "OGG (libopus)"
		@supportsTwopass = false -- uhh
		@videoCodec = ""
		@audioCodec = "libopus"
		@outputExtension = "ogg"
		@acceptsBitrate = true

formats["ogg"] = OGG!
