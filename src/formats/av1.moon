class AV1 extends Format
	new: =>
		@displayName = "AV1"
		@supportsTwopass = true
		@videoCodec = "libaom-av1"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=threads=#{options.threads}"
		}

formats["av1"] = AV1!

class AV1QSV extends Format
	new: =>
		@displayName = "WebM (AV1_QSV)"
		@supportsTwopass = false
		@videoCodec = "av1_qsv"
		@audioCodec = "libopus"
		@outputExtension = "mp4"
		@acceptsBitrate = false

	getFlags: =>
		{
			"--ovcopts-add=preset=1",
		}

formats["av1-qsv"] = AV1QSV!