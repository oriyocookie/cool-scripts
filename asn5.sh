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




	#foreach i ($argv)
	#    if ($i !~ *.c) then
	    #	echo "$i is not a .c program"
	    #	continue
	    #    else
	    #	echo "$i is a .c program"
	    #    endif
	    #
	    #    echo "check file ~/backup/$i:t"
	    #
	    #    if(! -r ~/backup/$i:t) then
		#	echo "$i:t not in backup...not cp\'ed"
		#	continue
		#    endif
		#
		#    echo $status
		#    cmp -s $i ~/backup/$i:t
		#    if ($status != 0) then
		    #	echo "making new backup of $i"
		    #	cp $i ~/backup/$i:t
		    #    endif
		    #end

		    #stat -c%Y people.sh
