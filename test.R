library(asana)
library(logger)

log_threshold(DEBUG)

ASANA_WORKSPACE <- Sys.getenv("ASANA_WORKSPACE")
ASANA_PAT <- Sys.getenv("ASANA_PAT")

# Workspace should initially be empty.
# workspace()
#
# workspace(ASANA_WORKSPACE)
# workspace()

# This will generate an error because there's no PAT yet.
# me()

authenticate(ASANA_PAT)
authenticate()

me()
users_workspace(ASANA_WORKSPACE)
users_gid(887375868389530)
