# Shortcut for commiting GLSAs. Allow to copy full line.
#
# Usage (run from console):
#
# Gentoo Linux Security Advisory                           GLSA 201701-19
function Gentoo() {
  case $1 in
    Linux)
      case $2 in
        Security)
          case $3 in
            Advisory)
              case $4 in
                GLSA)
                  GLSA $5 || return $?
                  ;;
              esac
              ;;
          esac
          ;;
      esac
      ;;
  esac
}
