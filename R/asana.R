#' @import dplyr
#' @importFrom httr http_type user_agent modify_url add_headers timeout content status_code
#' @import janitor
#' @import purrr
#' @importFrom jsonlite fromJSON
#' @import logger
#' @import lubridate
#' @import tidyr
NULL

USER_AGENT <- user_agent("https://github.com/datawookie/asana")
BASE_URL <- "https://app.asana.com/api/1.0"
BASE_PATH <- "api/1.0"

.onLoad <- function(libname, pkgname) {
}
