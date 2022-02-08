TIMEOUT_SECONDS = 30

check_response <- function(response) {
  if (is.null(content(response))) {
    warning("API returned an empty result.")
    FALSE
  } else if (http_type(response) != "application/json") {
    log_debug(content(response, as = "text"))
    stop("API did not return JSON.", call. = FALSE)
  } else if (status_code(response) != 200) {
    stop(
      sprintf(
        "API request failed [%s] %s",
        status_code(response),
        content(response)$msg
      ),
      call. = FALSE
    )
  } else {
    TRUE
  }
}

GET <- function(
  path,
  query = list()
) {
  # url <- file.path(BASE_URL, path = path)
  url <- modify_url(BASE_URL, path = file.path(BASE_PATH, path))
  log_debug("GET {url}.")

  pat <- authenticate()
  if (is.null(pat)) stop("Please authenicate first!")

  headers = c(
    `Authorization` = sprintf('Bearer %s', pat)
  )

  response <- purrr::insistently(httr::GET)(
    url,
    query = query,
    add_headers(.headers=headers),
    USER_AGENT,
    timeout(TIMEOUT_SECONDS)
  )

  if (check_response(response)) {
    fromJSON(
      content(response, as = "text"),
      simplifyVector = TRUE
    )$data
  } else {
    NULL
  }
}
