test_that("list_meetings works", {

  chamadas_julio <- list_meetings(user_id = "julio.trecenti@gmail.com")

  testthat::expect_s3_class(chamadas_julio, "data.frame")
  testthat::expect_equal(ncol(chamadas_julio), 11)

  #chamadas_bea <- list_meetings(user_id = "milz.bea@gmail.com")

  testthat::expect_error(list_meetings(user_id = "milz.bea@gmail.com"))

})
