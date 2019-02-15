#!/bin/tcsh 
echo "Do you want to make a backup?"
set var1 = $<
switch ($var1)
case [yY][eE][sS]: 
    case [yY]:
	(mkdir ./backup) >& /dev/null 
	if ($status == 0) then
	    foreach c ( *.c )
		cp $c ./backup/$c:t
	    end
	    echo "backup created"
	else

	    foreach c ( *.c )
		(ls backup | grep $c) >& /dev/null
		#echo "$status"
		if ($status == 1) then
		    cp $c ./backup/$c:t
		    echo "$c copied"
		endif
	    end

	    foreach c ( *.c )
		(diff $c ./backup/$c) >& /dev/null
		if ($status == 1) then
		    cp $c ./backup/$c:t
		    echo "$c updated"
		endif
	    end

	    echo "backup up to date"
	endif
	breaksw 
    case [nN][oO]: 
	case [nN]:
	    echo "no backup created"
	    breaksw
	default:
	    echo "Invalid response"
	    breaksw
	endsw

