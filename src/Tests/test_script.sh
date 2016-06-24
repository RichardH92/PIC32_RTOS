#!/bin/bash

TEST_FILES="*.c"

function build_test {
	CC="/opt/microchip/xc32/v1.40/bin/xc32-gcc"
	CFLAGS1="-g -x c -c -mprocessor=32MX795F512L -MMD -MF"
	CFLAGS2="-mprocessor=32MX795F512L -o"
	B2H="/opt/microchip/xc32/v1.40/bin/xc32-bin2hex"

	#Strip the file extension
	test_name=${1%.*}

	echo "Building test $test_name..."

	#Compile the test and build the hex file
	$CC $CFLAGS1 $test_name.o.d -o $test_name.o $1
	$CC $CFLAGS2 $test_name.elf $test_name.o
	$B2H $test_name.elf
}

function run_test {
	QEMU="/usr/local/qemu-mips/bin/qemu-system-mipsel -machine pic32mx7-max32 -nographic -monitor none -serial stdio -bios ../../boot-max32.hex -kernel"

	#Strip the file extension
	test_name=${1%.*}

	echo "Running test $test_name..."

	#If the result file exists, delete it
	if [ -f "$test_name.result" ]
	then
		rm "$test_name.result"
	fi

	#Run the test in Qemu
	($QEMU $test_name.hex 2>/dev/null) > $test_name.result &

	qemu_pid=$!

	wait_until_test_finishes $test_name.result

	kill $qemu_pid
}

function wait_until_test_finishes {
	#Wait until the file exists
	while true
	do
		if [ -f "$1" ]
		then
			break
		fi
	done

	while true
	do
		if grep -q "Test Finished." "$1"
		then
			break
		fi
	done
}

function check_test_results {
	#Strip the file extension
	test_name=${1%.*}

	echo "Printing test results..."
	echo "$(cat $test_name.result)"

	diff --brief <(sort $test_name.result) <(sort $test_name.ck) >/dev/null
	comp_value=$?

	if [ $comp_value -eq 1 ]
	then
		echo "$test_name passed."
	else
		echo "$test_name failed."
	fi
}

for f in $TEST_FILES
do
	build_test $f
	run_test $f
	check_test_results $f
done
