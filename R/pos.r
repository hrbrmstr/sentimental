#' Part-of-peech tagging and chunking on text
#'
#' Not all languages are supported for each \code{output} format. See the
#' \href{http://text-processing.com/docs/tag.html}{official documentation} for more
#' information.
#'
#' @param text one element character vector containing the text to analyze (part of
#'   speech). Must be <= 2,000 characters.
#' @param language the language \code{text} is in. Value should be \code{NULL} (which will
#'   cause the API to pick the appropriate stemmer) or one of the supported languages
#'   here: \url{http://text-processing.com/docs/tag.html}.
#' @param output The tagged (and chunked) text can be returned in one of the following
#'   output formats: "\code{tagged}", "\code{sexpr}" or "\code{iob}". See
#'   \href{http://text-processing.com/docs/tag.html}{the official documentation} for more
#'   information. Use \code{NULL} for default API behavior.
#' @return \code{list} with parsed \code{text}
#' @note The public API is for non-commercial purposes, and each method is throttled to
#'   1,000 calls per day per IP
#' @export
#' @references \url{http://text-processing.com/docs/tag.html}
#' @examples
#' part_of_speech("hello world")
#'
#' part_of_speech("hello world", output="iob")
#'
#' # named entity recoginition
#' part_of_speech("Maine is nice")
part_of_speech <- function(text, language=NULL, output=NULL) {

  if (length(text) > 2000) stop("'text' should be <= 2,000 characters", call.=FALSE)

  res <- httr::POST("http://text-processing.com/api/tag/",
                    encode="form",
                    body=list(text=text,
                              output=output,
                              language=language))

  httr::stop_for_status(res)

  out <- httr::content(res, as="text", encoding="UTF-8")
  out <- jsonlite::fromJSON(out)

  out

}

