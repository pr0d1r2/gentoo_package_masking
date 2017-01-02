# Example usage:
#
# gentoo_package_mask "x11-misc/xdg-utils           < 1.1.1"
function gentoo_package_mask() {
  case $@ in
    *\*\<*) # mask out packages that are still vulterable
      local gentoo_package_mask_PACKAGE=`echo $(echo $@ | tr "\n" ' ' | cut -f 1 -d '*')`
      local gentoo_package_mask_VERSION=""
      ;;
    *)
      local gentoo_package_mask_PACKAGE=`echo $(echo $@ | tr "\n" ' ' | cut -f 1 -d '<')`
      local gentoo_package_mask_VERSION=`echo $(echo $@ | tr "\n" ' ' | cut -f 2 -d '<')`
      ;;
  esac
  local gentoo_package_mask_FILE="$HOME/projects/gentoo_package_masking/masks.d/$gentoo_package_mask_PACKAGE.rb"
  local gentoo_package_mask_DIR=`dirname $gentoo_package_mask_FILE`
  cd $HOME/projects/gentoo_package_masking || return $?
  if [ ! -d $gentoo_package_mask_DIR ]; then
    mkdir $gentoo_package_mask_DIR || return $?
  fi
  case $gentoo_package_mask_VERSION in
    "")
      echo "gentoo_package_mask '$gentoo_package_mask_PACKAGE'" > $gentoo_package_mask_FILE || return $?
      ;;
    *)
      echo "gentoo_package_mask '<$gentoo_package_mask_PACKAGE-$gentoo_package_mask_VERSION'" > $gentoo_package_mask_FILE || return $?
      ;;
  esac
  git add $gentoo_package_mask_FILE || return $?
  git diff HEAD $gentoo_package_mask_FILE || return $?
}
