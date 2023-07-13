class AVC extends Format
	new: =>
		@displayName = "AVC (x264/AAC)"
		@supportsTwopass = true
		@videoCodec = "libx264"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=threads=#{options.threads}",
			"--ovcopts-add=preset=veryslow",
			"--ovcopts-add=profile=high",
			"--ovcopts-add=movflags=+faststart",
		}

formats["avc"] = AVC!

class AVCNVENC extends Format
	new: =>
		@displayName = "AVC (h264-NVENC/AAC)"
		@supportsTwopass = true
		@videoCodec = "h264_nvenc"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=preset=18",
			"--ovcopts-add=profile=2",
			"--ovcopts-add=movflags=+faststart",
		}

formats["avc-nvenc"] = AVCNVENC!

class AVCQSV extends Format
	new: =>
		@displayName = "AVC (h264-QSV/AAC)"
		@supportsTwopass = false
		@videoCodec = "h264_qsv"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=preset=1",
			"--ovcopts-add=movflags=+faststart",
		}

formats["avc-qsv"] = AVCQSV!

class AVCQSVOPUS extends Format
	new: =>
		@displayName = "AVC (h264-QSV/OPUS)"
		@supportsTwopass = false
		@videoCodec = "h264_qsv"
		@audioCodec = "libopus"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=preset=1",
			"--ovcopts-add=movflags=+faststart",
		}

formats["avc-qsv-opus"] = AVCQSVOPUS!
