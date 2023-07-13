class AVC extends Format
	new: =>
		@displayName = "AVC (h264/AAC)"
		@supportsTwopass = true
		@videoCodec = "libx264"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=threads=#{options.threads}",
			"--ovcopts-add=preset=veryslow"
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
			"--ovcopts-add=preset=p7",
		}

formats["avc-nvenc"] = AVCNVENC!

-- TODO: Set gpu encoders to slowest preset

class AVCQSV extends Format
	new: =>
		@displayName = "MP4 (h264-QSV/AAC)"
		@supportsTwopass = false
		@videoCodec = "h264_qsv"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=preset=1",
		}

formats["avc-qsv"] = AVCQSV!

class AVCQSVOPUS extends Format
	new: =>
		@displayName = "MP4 (h264-QSV/OPUS)"
		@supportsTwopass = false
		@videoCodec = "h264_qsv"
		@audioCodec = "libopus"
		@outputExtension = "mp4"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=preset=1",
		}

formats["avc-qsv-opus"] = AVCQSVOPUS!
