#' #' Set or query workspace ID
#' #'
#' #' @param id Workspace ID.
#' #'
#' #' @return
#' #' @export
#' #'
#' #' @examples
#' #' # Set workspace ID.
#' #' workspace(1125279076968849)
#' #' # Get workspace ID.
#' #' workspace()
#' workspace <- function(id = NULL) {
#'   if (is.null(id)) {
#'     cache_get("workspace")
#'   } else {
#'     cache_set(WORKSPACE, id)
#'   }
#' }
