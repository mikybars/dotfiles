#!/usr/bin/env zsh

include_cfg_file=~/.config/git/include-if.config
dev="~/dev"

dev() { echo ${dev/#\~/$HOME} }

main() {
	edit_include_config
	edit_each_missing_collection_config
}

edit_include_config() {
	local temp=$(mktemp)

	for collection in $(all_collections); do
		gitdir="$dev/$collection"
		if ! silent grep "includeIf.*$gitdir" $include_cfg_file; then
			cat <<-eof >>$temp

			; [includeIf "gitdir:$gitdir"]
			; 	path = ${collection//\//}.config
			eof
		fi
	done

	${EDITOR:-nvim} $include_cfg_file \
		+"set ft=gitconfig" \
		+"let modeline='# vi: ft=gitconfig' | \
			if search(modeline, 'nw') == 0 | \
				call append(0, [ \
					modeline, \
					'# ' . expand('%:t') . ': specific git config for each collection of repositories under $dev' \
					]) | \
        delete | \
			endif" \
      +"if getfsize(\"$temp\") > 0 | \
          call append(line('$'), readfile(\"$temp\")) | \
        endif"
	rm -f $temp
}

edit_each_missing_collection_config() {
	while IFS="," read -r gitdir cfg_path; do
		cfg_path=$([[ "$cfg_path" =~ ^/ ]] && echo $cfg_path || echo $(dirname $include_cfg_file)/$cfg_path)
		if [[ ! -f $cfg_path ]]; then
			${EDITOR:-nvim} $cfg_path \
				+"set ft=gitconfig" \
				+"call append(0, [ \
					'# vi: ft=gitconfig', \
					'# ' .expand('%:t') . ': git config for repositories under $gitdir', \
					'', \
					'[user]', \
					'	name = ', \
					'	email = ' \
					])" \
				+"normal kk" \
				+"startinsert!"
		fi
	done < <(collection_configs)
}

all_collections() {
	fd . --base-directory $(dev) --type directory --max-depth 1
}

# return pairs of the following form:
#  gitdir1,cfg_path1
#  gitdir2,cfg_path2
collection_configs() {
	cat << 'AWK' | awk -f - $include_cfg_file 2>/dev/null
/^\[includeIf.*gitdir:/ {
		gsub(/^\[includeIf "gitdir:|".*/, "")
		dir=$0
}
/^[[:space:]]*path =/ {
		gsub(/^[[:space:]]*path = /, "")
		print dir "," $0
}
AWK
}

silent() {
	"${@}" >/dev/null 2&>1
}

main
