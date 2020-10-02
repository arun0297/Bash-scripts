
a=$(cat /etc/ssh/config.conf | grep ClientAliveInterval | grep ^[^#] | grep -o '[a-Z0-9]*$')
b=$(cat /etc/ssh/config.conf | grep ClientAliveCountMax | grep ^[^#] | grep -o '[0-9]*')

if [[ ${a: -1} = 'm' ]]
then
if [[ $b -eq 0 ]]
then
echo ${a%?}m                       
else
echo $((${a%?}*$b))m          
fi
elif [[ ${a: -1} = 's' ]] 
then
if [[ $b -eq 0 ]]
then
echo $((${a%?}/60))m
else
echo $(((${a%?}*$b)/60))m
fi
elif [[ ${a: -1}  =~ ^[0-9]+$ ]]
then
if [[ $b -eq 0 ]]
then
echo $(($a/60))m
else
echo $((($a*$b)/60))m
fi
else
echo 'fail'
fi
