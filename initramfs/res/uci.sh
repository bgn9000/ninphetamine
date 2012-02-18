#!/sbin/busybox sh

# universal configurator interface

ACTION_SCRIPTS=/res/customconfig
source ${ACTION_SCRIPTS}/customconfig-helper

# first, read defaults
read_defaults

# read the config from the active profile
read_config

case "${1}" in
  apply)
    . apply_profile "$2"
    ;;
  rename)
    rename_profile "$2" "$3"
    ;;
  delete)
    delete_profile "$2"
    ;;
  select)
    select_profile "$2"
    ;;
  config)
    print_config
    ;;
  *)
    . ${ACTION_SCRIPTS}/$1 $2 $3 $4 $5 $6
    ;;
esac;

# write back the config to the active profile
write_config
