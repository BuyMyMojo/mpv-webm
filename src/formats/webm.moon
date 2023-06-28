class WebmVP8 extends Format
	new: =>
		@displayName = "WebM"
		@supportsTwopass = true
		@videoCodec = "libvpx"
		@audioCodec = "libvorbis"
		@outputExtension = "webm"
		@acceptsBitrate = true

	getPreFilters: =>
		-- colormatrix filter
		colormatrixFilter =
			"bt.709": "bt709"
			"bt.2020": "bt2020"
			"smpte-240m": "smpte240m"
		ret = {}
		-- vp8 only supports bt.601, so add a conversion filter
		-- thanks anon
		colormatrix = mp.get_property_native("video-params/colormatrix")
		if colormatrixFilter[colormatrix]
			append(ret, {
				"lavfi-colormatrix=#{colormatrixFilter[colormatrix]}:bt601"
			})
		return ret

	getFlags: =>
		{
			"--ovcopts-add=threads=#{options.libvpx_threads}",
			"--ovcopts-add=auto-alt-ref=1",
			"--ovcopts-add=lag-in-frames=25",
			"--ovcopts-add=quality=good",
			"--ovcopts-add=cpu-used=0",
		}

formats["webm-vp8"] = WebmVP8!

class WebmVP9 extends Format
	new: =>
		@displayName = "WebM (VP9)"
		@supportsTwopass = false
		@videoCodec = "libvpx-vp9"
		@audioCodec = "libopus"
		@outputExtension = "webm"
		@acceptsBitrate = true

	getFlags: =>
		{
			"--ovcopts-add=threads=#{options.libvpx_threads}"
		}

formats["webm-vp9"] = WebmVP9!


class WebmVP9QSV extends Format
	new: =>
		@displayName = "WebM (VP9_QSV)"
		@supportsTwopass = false
		@videoCodec = "vp9_qsv"
		@audioCodec = "libopus"
		@outputExtension = "webm"
		@acceptsBitrate = false

	getFlags: =>
		{
			"--preset:v=1",
		}

formats["webm-vp9-qsv"] = WebmVP9QSV!

class WebmAV1QSV extends Format
	new: =>
		@displayName = "WebM (AV1_QSV)"
		@supportsTwopass = false
		@videoCodec = "av1_qsv"
		@audioCodec = "libopus"
		@outputExtension = "webm"
		@acceptsBitrate = false

	getFlags: =>
		{
			"--preset:v=1",
		}

formats["webm-av1-qsv"] = WebmAV1QSV!
