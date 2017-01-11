# Will make git commit with that GLSA as message.
# Speeds up processing GLSA emails.
#
# usage:
#
# GLSA 201701-29
function GLSA() {
  git commit -a -m "GLSA $1"
}
