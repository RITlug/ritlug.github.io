#!/usr/bin/env sh

case "$0" in
	/dev/*)
		export tmp="$(mktemp "${TMP:-/tmp}/presentation.XXXXXX")"
		cp "$0" "$tmp"
		chmod +x "$tmp"
		"$tmp"
		exit $?
		;;
	*sh)
		</dev/tty
		export tmp="$(mktemp "${TMP:-/tmp}/presentation.XXXXXX")"
		cat > "$tmp"
		chmod +x "$tmp"
		"$tmp" < /dev/tty
		exit $?
		;;
esac
#!/usr/bin/env sh

echo -n -e "\033]0;RITLUG week 9: Shell Scripting\007"

export SELF="$0"
export PAGER="${PAGER:-less}"
export EDITOR="${EDITOR:-nano}"

if type nix-shell >/dev/null 2>&1
then
	nix=1
elif type guix >/dev/null 2>&1
then
	guix=1
fi

get_dep () {
	if type $1 >/dev/null 2>&1
	then
		return 0
	fi
	package="$({[ -n "$3" ] && [ -n "$nix" ] && echo "$3"} || echo "$2")"
	MISSING_DEPS="$MISSING_DEPS${MISSING_DEPS+ }$package"
}

first () {
	echo $1
}

get_dep figlet figlet
get_dep $(first $PAGER) less
get_dep clear ncurses
get_dep tput ncurses
get_dep $(first $EDITOR) nano
get_dep cbonsai cbonsai
get_dep sleep coreutils
if [ -n "${DISPLAY:+1}" ]
then
	get_dep xnotify xnotify
fi
get_dep curl curl
get_dep python3 python python3
get_dep printf coreutils
get_dep grep grep gnugrep
get_dep tail coreutils
get_dep rev util-linux
get_dep cut coreutils
get_dep tr coreutils
get_dep getent gcc-toolchain
get_dep env coreutils

if [ -n "${MISSING_DEPS:+1}" ]
then
	if [ -n "$nix" ]
	then
		exec nix-shell -p $MISSING_DEPS -- $SELF
	elif [ -n "$guix" ]
	then
		exec guix shell $MISSING_DEPS man-db -- $SELF
	fi
	echo "Missing dependencies: $MISSING_DEPS"
	exit 1
fi

export step="${step:-0}"

escape_char=$(printf "\u1b")

uppies () {
	just_upped=1 bash "$SELF" && return 0
	echo 'An error occurred in the modified version of the script, continue'
	return 1
}

progress () {
	while true
	do
		# thanks stack overflow
		tput cup $(tput lines) 0
		read -p "use right arrow to progress, left arrow to go back, r to repeat, or q to quit..." -rsn1 mode # get 1 character
		[[ $mode == $escape_char ]] && read -rsn2 mode # read 2 more chars
		case $mode in
			'q')
				echo
				return 0
				;;
			'r')
				return 1
				;;
			's')
				${SHELL:-bash}
				return $?
				;;
			'u')
				uppies
				return $?
				;;
			'[D')
				export step=$(($step - 1))
				return 1
				;;
			'[C')
				export step=$(($step + 1))
				return 1
				;;
		esac
	done
}

get_any () {
	read -s -n1 KEY
	[[ $KEY == $escape_char ]] && read -rsn2 KEY # read 2 more chars
}

banner () {
	figlet -f banner "$@"
}

title () {
	figlet -ct "$@"
}

stepped () {
	m_num=0
	for m in "$@"
	do
		banner -t "$m"
		m_num=$(($m_num + 1))
		[ $m_num != $# ] && get_any
	done
}

script_test () {
	tmp_script="$(mktemp "${TMP:-/tmp}/$1.XXXXXX")"
	printf "\
#!/usr/bin/env %s
%s" "$2" "$3" > "$tmp_script"
	chmod +x "$tmp_script"
	while true
	do
		$EDITOR "$tmp_script"
		clear
		"$tmp_script"

		while true
		do
			# thanks stack overflow
			tput cup $(tput lines) 0
			read -p "success? (y/n)" -rsn1 mode # get 1 character
			[[ $mode == $escape_char ]] && read -rsn2 mode # read 2 more chars
			case $mode in
				[yY])
					rm "$tmp_script"
					clear
					return
					;;
				[nN])
					break
					;;
			esac
		done
	done
}

page_exists () {
	[ -e "$1" ] && $PAGER "$1" 
}

while true
do
	clear

	if [ -z "${just_upped:+1}" ]
	then

		case $step in
			-*|0)
				export step=0
				tput cup $(($(tput lines) / 2 - 20)) 0
				title $'RITLUG Week 9\n*X*X*\nShell Scripting'
				;;
			1)
				stepped 'Interactive shells are cool.' \
						'Did you know you can make scripts to automate repetitive tasks?' 
				;;
			2)
				title 'Why?'
				[ -n "${DISPLAY:+1}" ] && {
					sleep 10
					echo 'schedule notifications...' | xnotify -G C -b 1
				} &

				stepped 'You can...' \
						' * customize the text on a widget...' \
						' * automate updates...' \
						' * configure, build, and install packages...' \
						' * manage your environment...' \
						' * or even make a whole presentation!'
				;;
			3)
				title 'Shells Galore & Portability'
				stepped 'Not all shells are equal.  Make sure you know yours.'\
						"your \$SHELL is: $SHELL" \
						"your login shell is: $(getent passwd ${LOGNAME:-$USER} | cut -d: -f7)"
				get_any
				man echo
				;;
			4)
				title 'Shell languages'
				stepped $'Shell languages are just like any other language!\nThey have:' \
						' * function calls' \
						' * control flow' \
						' * and environment manipulation!'
				;;
			5)
				stepped '2 main differences:' \
						' * Heavy emphasis on calling other programs,' \
						' * Designed for interactive use.'
				;;
			6)
				title 'Scripts in Files'
				stepped '#!shebang' \
						'#!/usr/bin/env'
				get_any
				man env
				script_test cbonsai 'cbonsai' ''
				script_test cbonsai-i '-S cbonsai -i' ''
				;;
			7)
				title 'Shell Options'
				stepped 'Different default options between interactive and non-interactive sessions'
				for line in $(curl https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html 2>/dev/null \
								  | grep '<dt><code class="code">' \
								  | tail -n +5 \
								  | rev \
								  | cut -c 13- \
								  | rev \
								  | cut -c 24-)
				do
					get_any
					stepped " * $line"
				done
				;;
			8)
				title 'File Structure'
				stepped '1 line in file = 1 command in terminal'
				get_any
				script_test bash bash '
< /dev/urandom tr -d -c [:graph:] | head -c 32'
				;;
			9)
				title 'Other scripting languages'
				get_any
				script_test python python3 '
import string, random

def main(length: int) -> str:
    characters = string.ascii_letters + string.digits + string.punctuation
    return "".join(random.choice(characters) for i in range(length))

print(main(32))'
				stepped 'The design differences make some things very easy, by outsourcing the difficulty to other programs.'
				get_any
				script_test quine-bash bash '
cat $0'
				script_test quine-python python3 '
import sys

with open(sys.argv[0]) as file:
	 print(file.read())'
				;;
			10)
				title 'Honorable Weirdos'
				stepped 'A few shells do things a bit differently.' \
						'intended for interactive use:' \
						' * fish' \
						'more structured:' \
						' * nushell' \
						' * oh' \
						'access to other languages:' \
						' * xonsh' \
						' * gash' \
						' * closh' \
						' * hilbish' \
						' * dune' \
						' * osh/ysh' \
						'is another programming language:' \
						' * elvish' \
						' * solidity' \
						'not for linux:' \
						' * ion' \
				;;
			11)
				title 'A Mixed Environment'
				stepped 'The environment of a shell is strange compared to other programming languages.' \
						'Function namespace is shared with executables on the computer' \
						'Variable namespace is shared with environment variables' \
						'But they are different!'
				get_any
				script_test non-exported-variables bash '
###
### example of a non-exported variable not being exposed to child processes
###

value="This value exists!"

bash -c "echo \$value"
echo "$value"

read -s -n1 KEY

export value

bash -c "echo \$value"
echo "$value"

read -s -n1 KEY

value=""

bash -c "echo \$value"
echo "$value"

read -s -n1 KEY

unset value

bash -c "echo \$value"
echo "$value"'
				;;
			12)
				title 'Calling the File'
				stepped '2 steps:' \
						' * making it executable' \
						' * placing on $PATH' \
						'Both are optional, if you like suffering'
				;;
			13)
				title 'Environment Mangaement'
				stepped 'Find your shell config file.'
				get_any
				page_exists ~/.profile
				page_exists ~/.bashrc
				page_exists ~/.zshrc
				page_exists ~/.config/fish/config.fish
				page_exists ~/.config/nushell/config.nu
				page_exists ~/.config/sway/config
				;;
			14)
				title 'Control structures'
				get_any
				script_test conditionals bash '
###
### There are actually a bunch of ways to do conditionals in bash
###
### this was also talked about in the unix shell talk
###

res=true

if $res
then
	echo true
fi

if not $res
then
	echo false
fi

$res && echo true

$res || echo false'
				script_test blocks bash '
###
### Blocks, like in most programming languages group together commands to run.
### You can use this in conjunction with the more basic conditionals to run multiple commands
###
### this was also talked about in the unix shell talk
###

true && {
	echo thing 1
	echo thing 2
}

###
### there are also subshells using parenthesis ()
###

false && (
	echo thing 3
	echo thing 4
)'
				script_test functions bash '
###
### Functions are basically file-local files
###
### Unlike variables, they cannot be exported
###

example_function () {
        local variable="$1"
        echo $variable
        return $?
}

example_function thing

###
### aliases are a special syntax for functions
###
'
				script_test iteration bash '
###
### there are 2 looping syntaxes: for and while
###
### they behave similarly to most programming languages
###
### this was also talked about in the unix shell talk
###

i=0

while [ $i != 3 ]
do
	echo $i
	i=$(($i + 1))
done

i=0

until [ $i = 3 ]
do
	echo $i
	i=$(($i + 1))
done

for i in 0 1 2
do
	echo $i
done
'
				script_test case bash '
###
### case statements match their input with regex to determine what clause to run
###
### this was also talked about in the unix shell talk
###

case 1
in
	1)
		echo branch 1
		;;
	[23])
		echo branch 2 or 3
		;;
	4|14)
		echo branch 4 or 14
		;;
	*5)
		echo branch "*5"
		;;
	*)
		echo default branch
		;;
esac'
				;;
			15)
				title 'Manipulating Command Output'
				get_any
				script_test capturing bash '
###
### functions and commands just return a 8 bit number.  Not enough information
###

value="$(echo putting a \$ in front of a subshell lets you capture the output into a string)"

echo $value
'
				;;
			16)
				title 'Interactivity'
				stepped 'Most shells provide a read primitive, which can get input and record it into a variable.' \
						'This can be used to pause until any input, get a line of text, or check simple yes/no'
				get_any
				script_test interactivity bash '
read -r cmd
$cmd'
				;;
			17)
				title 'Now you try'
				get_any
				$EDITOR "$SELF"
				uppies && break
				banner -t 'whoops... something messed up with editing.  Try again!'
				;;
			18)
				cbonsai -l -L 70 -M 10
				;;
			19)
				title 'Questions?'
				;;
			*)
				break
				;;
		esac
	else
		unset just_upped
	fi

	progress && break
done

[ -n "${tmp:+1}" ] && [ -e "$tmp" ] && rm $tmp

exit 0
