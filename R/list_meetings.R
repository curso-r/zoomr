list_meetings <- function(user_id){

  # user_id <- "milz.bea@gmail.com"


  meetings <- httr::GET(
    paste0("https://api.zoom.us/v2/users/", user_id, "/meetings"),
    httr::add_headers(authorization = paste("Bearer", Sys.getenv("zoom_api")))
  )


mensagem <- httr::content(meetings)$message


}
