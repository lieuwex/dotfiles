function serve # Serves the current folder on the given port (defualt 3000) using Python's http.server.
	if count $argv >/dev/null
		set port $argv
	else
		set port 3000
	end

	lopen $port
	python3 -m http.server $port 2>&1 >/dev/null
end
