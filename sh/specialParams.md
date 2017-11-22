# General Tips about shell special characters
*  Argument list ${@}
*  Switch list of strings to an array
    * STR_LIST "STR0 STR1 STR2"
    * str_arr=(STR_LIST)
*  Control exit code
    * Will allways return 0
      bash -c "git XXX; exit 0; "
    * Will return 11 in case of a failure 
      ./my_script.sh || exit 11
* remove prefix/sufix  
   * tmp=${a#*_}   # remove prefix ending in "_"
   * b=${tmp%_*}   # remove suffix starting with "_"
* important paths
   * crontab -e -> will create a file at /var/spool/cron/XXX
   * lock files /var/lock/subsys/
