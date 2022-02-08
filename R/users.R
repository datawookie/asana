prepare_user <- function(user) {
  user$photo <- as_tibble(user$photo) %>%
    pivot_longer(cols = everything(), names_to = "dimension") %>%
    mutate(dimension = sub("image_", "", dimension))

  user$photo <- list(user$photo)
  user$workspaces <- list(user$workspaces)

  user
}

#' Get User Details
#'
#' Retrieve details of users.
#'
#' @details The following information is available:
#'
#' * email
#' * name
#' * photos (various dimensions) and
#' * workspaces.
#'
#' @name users
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' # Get details of authenticated user.
#' me()
#'
me <- function() {
  data <- GET("users/me")
  data %>% prepare_user() %>% as_tibble()
}

#' @rdname users
#'
#' @param workspace Workspace ID.
#' @export
#'
#' @examples
#' # Get details of users in workspace.
#' users_workspace(1125279076968849)
#'
users_workspace <- function(workspace) {
  data <- GET("users", query = list(workspace = workspace))
  as_tibble(data)
}

#' @rdname users
#'
#' @param gid User ID.
#' @export
#'
#' @examples
#' # Get details of user by GID.
#' users_gid(887375868389530)
users_gid <- function(gid) {
  data <- GET(file.path("users", gid))
  data %>% prepare_user() %>% as_tibble()
}
