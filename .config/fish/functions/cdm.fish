function cdm
	if test -z "$argv"
		echo 'usage: cdm <path>'
		return
	end
	mkdir -p -- $argv; and cd $argv
end
