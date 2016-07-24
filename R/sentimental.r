#' Analyze the sentiment of text
#'
#' @param text one element character vector containing the text to analyze. . Must be <=
#'   80,000 characters.
#' @param language one of "\code{english}", "\code{french}", "\code{dutch}".
#' @return \code{list} containing the \code{label} and \code{probability} estimates
#' @references \url{http://text-processing.com/docs/sentiment.html}
#' @export
#' @examples
#' sentiment("hi friend")
sentiment <- function(text, language=c("english", "dutch", "french")) {

  if (length(text) > 80000) stop("'text' should be <= 80,000 characters", call.=FALSE)

  language <- tolower(language)
  language <- match.arg(language, c("english", "dutch", "french"))

  res <- httr::POST("http://text-processing.com/api/sentiment/",
                    encode="form",
                    body=list(text=text,
                              language=language))

  httr::stop_for_status(res)

  out <- httr::content(res, as="text", encoding="UTF-8")
  out <- jsonlite::fromJSON(out)

  out

}

