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

  # mensagem <- httr::content(meetings)

  existing_meetings <- meetings %>%
    httr::content() %>%
    purrr::pluck("meetings") %>%
    purrr::map(unlist, recursive = TRUE) %>%
    purrr::map_dfr(tibble::enframe, .id = "order") %>%
    tidyr::pivot_wider(
      names_from = name,
      values_from = value,
      names_repair = "unique"
    )

  existing_meetings

}
