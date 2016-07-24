#' Phrase extraction & named entity recognition on text
#'
#' @param text one element character vector containing the text to analyze (part of
#'   speech). Must be <= 21000 characters.
#' @param language the language \code{text} is in. One of "\code{english}",
#'   "\code{dutch}", "\code{portugese}" or "\code{spanish}". here:
#'   \url{http://text-processing.com/docs/phrases.html}.
#' @return \code{list} with parsed \code{text}
#' @note The public API is for non-commercial purposes, and each method is throttled to
#'   1,000 calls per day per IP
#' @export
#' @references \url{http://text-processing.com/docs/phrases.html}
#' @examples
#' phrase_extract("Maine is nice")
phrase_extract <- function(text, language=c("english", "dutch", "portuguese", "spanish")) {

  if (length(text) > 1000) stop("'text' should be <= 1,000 characters", call.=FALSE)

  language <- tolower(language)
  language <- match.arg(language, c("english", "dutch", "portuguese", "spanish"))

  res <- httr::POST("http://text-processing.com/api/tag/",
                    encode="form",
                    body=list(text=text,
                              language=language))

  httr::stop_for_status(res)

  out <- httr::content(res, as="text", encoding="UTF-8")
  out <- jsonlite::fromJSON(out)

  out

}

