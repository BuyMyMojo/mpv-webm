class MP4 extends Format
	new: =>
		@displayName = "MP4 (h264/AAC)"
		@supportsTwopass = true
		@videoCodec = "libx264"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

formats["mp4"] = MP4!

class MP4NVENC extends Format
	new: =>
		@displayName = "MP4 (h264-NVENC/AAC)"
		@supportsTwopass = true
		@videoCodec = "h264_nvenc"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

formats["mp4-nvenc"] = MP4NVENC!

class MP4X264QSVAAC extends Format
	new: =>
		@displayName = "MP4 (h264-NVENC/AAC)"
		@supportsTwopass = true
		@videoCodec = "h264_qsv"
		@audioCodec = "aac"
		@outputExtension = "mp4"
		@acceptsBitrate = true

formats["mp4-x264QSV_aac"] = MP4X264QSVAAC!

class MP4X264QSVOPUS extends Format
	new: =>
		@displayName = "MP4 (h264-NVENC/AAC)"
		@supportsTwopass = true
		@videoCodec = "h264_qsv"
		@audioCodec = "libopus"
		@outputExtension = "mp4"
		@acceptsBitrate = true

formats["mp4-x264QSV_opus"] = MP4X264QSVOPUS!