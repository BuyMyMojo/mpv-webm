bold = (text) ->
	"{\\b1}#{text}{\\b0}"

-- OSD message, using ass.
message = (text, duration) ->
	ass = mp.get_property_osd("osd-ass-cc/0")
	-- wanted to set font size here, but it's completely unrelated to the font
	-- size in set_osd_ass.
	ass ..= text
	mp.osd_message(ass, duration or options.message_duration)

append = (a, b) ->
	for _, val in ipairs b
		a[#a+1] = val
	return a

seconds_to_time_string = (seconds, no_ms, full) ->
	if seconds < 0
		return "unknown"
	ret = ""
	ret = string.format(".%03d", seconds * 1000 % 1000) unless no_ms
	ret = string.format("%02d:%02d%s", math.floor(seconds / 60) % 60, math.floor(seconds) % 60, ret)
	if full or seconds > 3600
		ret = string.format("%d:%s", math.floor(seconds / 3600), ret)
	ret

seconds_to_path_element = (seconds, no_ms, full) ->
	time_string = seconds_to_time_string(seconds, no_ms, full)
	-- Needed for Windows (and maybe for Linux? idk)
	time_string, _ = time_string\gsub(":", "_")
	return time_string

file_exists = (name) ->
	f = io.open(name, "r")
	if f ~= nil
		io.close(f)
		return true
	return false

format_filename = (startTime, endTime) ->
	replaceTable =
		"%%f": mp.get_property("filename")
		"%%F": mp.get_property("filename/no-ext")
		"%%s": seconds_to_path_element(startTime)
		"%%S": seconds_to_path_element(startTime, true)
		"%%e": seconds_to_path_element(endTime)
		"%%E": seconds_to_path_element(endTime, true)
		"%%T": mp.get_property("media-title")
		"%%M": (mp.get_property_native('aid') and not mp.get_property_native('mute')) and '-audio' or ''
	filename = options.output_format

	for format, value in pairs replaceTable
		filename, _ = filename\gsub(format, value)

	-- Remove invalid chars
	-- Windows: < > : " / \ | ? *
	-- Linux: /
	filename, _ = filename\gsub("[<>:\"/\\|?*]", "")

	return "#{filename}.#{options.output_extension}"

parse_directory = (dir) ->
	home_dir = os.getenv("HOME")
	if not home_dir
		-- Windows home dir is obtained by USERPROFILE, or, if it fails, HOMEDRIVE + HOMEPATH
		home_dir = os.getenv("USERPROFILE")

	if not home_dir
		drive = os.getenv("HOMEDRIVE")
		path = os.getenv("HOMEPATH")
		if drive and path
			home_dir = utils.join_path(drive, path)
		else
			msg.warn("Couldn't find home dir.")
			home_dir = ""
	dir, _ = dir\gsub("^~", home_dir)
	return dir

get_null_path = ->
	if file_exists("/dev/null")
		return "/dev/null"
	return "NUL"