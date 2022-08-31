#' Import project directory template

#' @param template Template name. Must refer to one of the json files stored in data/templates.
#' @details Function imports a json file describing a project directory, and
#' creates a tree object.
#'
#' @return An object of class data.tree
#'
#' @importFrom jsonlite fromJSON
#' @importFrom data.tree as.Node

LoadTemplate <- function(template) {
    filename <- system.file("extdata/templates", paste0(template, '.json'),
                            package = "arbour")
    data      <- as.Node(fromJSON(filename))
    return(data)
}
