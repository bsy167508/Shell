echo "HELLO"

#Basically, variable names are exapnded within double quotes, but not single quotes. If you do not need to refer to variables, single quotes are good to use as the results are more predictable.

echo -n '$USER=' # -n option stops echo from breaking the line
echo "$USER" 
echo "\$USER=$USER" # this does the same thing as the first two lines
echo "Using Quotes to enclose your variables"
#Sometimes, it is a good idea to protect variable names in double quotes. This is usually the most important if your variables value either (a) contains spaces or (b) is the empty string. An example is as follows:

X=""
if [ -n $X ]; then # -n tests to see if the argument is non empty
	echo "the variable X is not the empty string"
fi

#Why? because the shell expands $X to the empty string. The expression [ -n ] returns true (since it is not provided with an argument). A better script would be:

if [ -n "$X" ]; then
	echo "the variable X is not the empty string"
else
	echo "It is empty"
fi

echo "Variable Expansion in action"

#One convincing example

LS="ls"
LS_FLAGS="-al"

$LS $LS_FLAGS $HOME
# That is, the shell simply replaces the variables with their values, and then executes the command.

echo 'Using Braces to protect your variables'
#OK. Here's a potential problem situation. Suppose you want to echo the value of the variable X, followed immediately by the letters "abc". Question: how do you do this ? Let's have a try :

X=ABC
echo "${X}abc"

