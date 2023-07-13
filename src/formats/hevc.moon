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
			"--ovcopts-add=preset=slow"
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
			"--ovcopts-add=preset=p7",
		}

formats["hevc-nvenc"] = HEVCNVENC!
