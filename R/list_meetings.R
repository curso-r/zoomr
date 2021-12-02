#' List Zoom meetings
#'
#' This functions returns a tibble with all the
#' zoom meetings in a account.
#'
#' @param user_id the email or user id of your account
#'
#' @return a tibble
#' @export
list_meetings <- function(user_id) {
  # user_id <- "julio.trecenti@gmail.com"
  meetings <- httr::GET(
    paste0("https://api.zoom.us/v2/users/", user_id, "/meetings"),
    httr::add_headers(authorization = paste("Bearer", Sys.getenv("ZOOM_API")))
  )
  # TODO check authentication
  # mensagem <- httr::content(meetings)

  existing_meetings <- meetings %>%
    httr::content(simplifyDataFrame = TRUE) %>%
    purrr::pluck("meetings") %>%
    tibble::as_tibble()

  if (nrow(existing_meetings) == 0) {
    usethis::ui_stop("No meetings found.")
  }

  existing_meetings

}
