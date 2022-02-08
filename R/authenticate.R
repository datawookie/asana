#' Set Asana Personal Access Token
#'
#' @param pat Personal Access Token.
#' @export
#'
#' @examples
#' \dontrun{
#' authenticate("1/889385868389540:a2af991203342d0be4fcde70e5d7c3cd")
#' }
authenticate <- function(pat = NULL) {
  if (is.null(pat)) {
    cache_get(PAT)
  } else {
    cache_set(PAT, pat)
  }
}
