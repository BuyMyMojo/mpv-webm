class HEVC extends Format
	new: =>
		@displayName = "HEVC"
		@supportsTwopass = true
		@videoCodec = "libx265"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=threads=#{options.threads}",
			"--ovcopts-add=preset=slow",
		}

formats["hevc"] = HEVC!

class HEVCNVENC extends Format
	new: =>
		@displayName = "HEVC (HEVC-NVENC/AAC)"
		@supportsTwopass = true
		@videoCodec = "hevc_nvenc"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=preset=18",
		}

formats["hevc-nvenc"] = HEVCNVENC!

class HEVCQSV extends Format
	new: =>
		@displayName = "HEVC (HEVC-QSV/AAC)"
		@supportsTwopass = true
		@videoCodec = "hevc_nvenc"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=preset=1",
			"--ovcopts-add=movflags=+faststart",
		}

formats["hevc-qsv"] = HEVCQSV!
