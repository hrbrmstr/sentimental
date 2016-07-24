#' Perform word stemming on text
#'
#' Not all languages are supported by each stemmer. See the
#' \href{http://text-processing.com/docs/stem.html}{official documentation} for more
#' information.
#'
#' @param text one element character vector containing the text to analyze (stem). Must be
#'   <= 60,000 characters.
#' @param stemmer which stemmer to use. Use \code{NULL} to have the API pick an
#'   appropriate stemmer or choose one along with a supported language (see
#'   \url{http://text-processing.com/docs/stem.html}).
#' @param language the language \code{text} is in. Value should be \code{NULL} (which will
#'   cause the API to pick the appropriate stemmer) or one of the supported languages
#'   here: \url{http://text-processing.com/docs/stem.html}.
#' @return \code{list} containing the stemmed text
#' @note The public API is for non-commercial purposes, and each method is throttled to
#'   1,000 calls per day per IP
#' @export
#' @references \url{http://text-processing.com/docs/stem.html}
#' @examples
#' stem("processing")
#'
#' stem("correr", "snowball", "spanish")
#' stem("interestingly enough they overwhelmingly supported the wrong candidate")
stem <- function(text, stemmer=NULL, language=NULL) {

  if (length(text) > 2000) stop("'text' should be <= 60,000 characters", call.=FALSE)

  res <- httr::POST("http://text-processing.com/api/stem/",
                    encode="form",
                    body=list(text=text,
                              stemmer=stemmer,
                              language=language))

  httr::stop_for_status(res)

  out <- httr::content(res, as="text", encoding="UTF-8")
  out <- jsonlite::fromJSON(out)

  out

}

