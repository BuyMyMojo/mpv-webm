class WAV16 extends Format
    new: =>
		@displayName = "WAV 16bit"
		@supportsTwopass = false -- uhh
		@videoCodec = ""
		@audioCodec = "pcm_s16le"
		@outputExtension = "wav"
		@acceptsBitrate = false

formats["wav16"] = WAV16!

class WAV24 extends Format
    new: =>
		@displayName = "WAV 24bit"
		@supportsTwopass = false -- uhh
		@videoCodec = ""
		@audioCodec = "pcm_s24le"
		@outputExtension = "wav"
		@acceptsBitrate = false

formats["wav24"] = WAV24!

class WAV32 extends Format
    new: =>
		@displayName = "WAV 32bit"
		@supportsTwopass = false -- uhh
		@videoCodec = ""
		@audioCodec = "pcm_s32le"
		@outputExtension = "wav"
		@acceptsBitrate = false

formats["wav32"] = WAV32!

class WAV64 extends Format
    new: =>
		@displayName = "WAV 64bit"
		@supportsTwopass = false -- uhh
		@videoCodec = ""
		@audioCodec = "pcm_s64le"
		@outputExtension = "wav"
		@acceptsBitrate = false

formats["wav64"] = WAV64!
