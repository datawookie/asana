cache <- new.env()

# Cache environment keys.
#
WORKSPACE <- "workspace"
PAT = "pat"

cache_get <- function(x) {
  keys <- ls(cache)
  if (length(keys) == 0) {
    log_debug("Cache is empty.")
    NULL
  } else {
    log_debug("Cache contents:")
    for (key in keys) {
      log_debug("- {key} -> {get(key, envir = cache)} {ifelse(x == key, '*', '')}")
    }
    possibly(get, NULL)(x, envir = cache)
  }
}

cache_set <- function(x, value) {
  assign(x, value, envir = cache)
}
