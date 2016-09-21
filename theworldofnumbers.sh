#can be done either simply like this
read a
read b
echo `expr $a + $b`   
echo `expr $a - $b`   
echo `expr $a \* $b`   
echo `expr $a / $b` 

#or you can do this

echo $a + $b
echo $a - $b
echo $a * $b
echo $a / $b

#or in POSIX shells

echo "$( ($a+$b) )"
echo "$( ($a-$b) )"
echo "$( ($a*$b) )"
echo "$( ($a/$b) )"



