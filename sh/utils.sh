#!/usr/bin/env bash

#hcp_landscapes
declare -A SOME_ARR
HCP_LANDSCAPES_ARR[ind1]="str10 str11 str12 str13"
HCP_LANDSCAPES_ARR[ind2]="sat20"
HCP_LANDSCAPES_ARR[ind3]="sat0"
HCP_LANDSCAPES_ARR[ind4]="sat40"

#This is a comment

Useful functions
#################
print_and_exec(){
	echo "exec $1"
	$1
	if [ $? -ne 0 ]; then
	    echo "$1 borked it"
	fi
}

#This function makes sure that all the variables at ${MANDATORY_PARAMETERS} are defined
#Usage:
#	1. set list of params as strings to ${MANDATORY_PARAMETERS} (i.e. MANDATORY_PARAMETERS="var1 var2")
#	2. invoke verify_params
#   -- This job will invoke the print_usage function in case of an error, please implement
#Example
#   #List of the mandatory parameters
#   MANDATORY_PARAMETERS="VAR0 VAR1 VAR2 VAR3"
#   verify_params
verify_params() {
	mandatory_parameters_arr=($MANDATORY_PARAMETERS)
	for parameter_to_test in "${mandatory_parameters_arr[@]}"
	do
		if [ -z ${!parameter_to_test+x} ];
		then
			echo "${parameter_to_test} is mandatory and not defined, execution aborted";
			print_usage
			exit -1
		else
			echo "${parameter_to_test} is mandatory and set to ${!parameter_to_test}"
		fi
	done
}


#This function makes take a list of vars and print their values
#Usage: print_vars_value var1 var2 var3
print_vars_value() {
	for parameter_to_test in "${@}"
	do
		echo "${parameter_to_test} is equal to ${!parameter_to_test}"

	done
}

#Several ways to execute a command and control the return value
bash -c "git XXX; exit 0; " # Will allways return 0
./my_script.sh || exit 11 #will return 11 in case of a failure 
