#' Create project directory structure

#' @param name Name of project
#' @param template Template name. Must refer to one of the json files stored in data/templates.

#' @details Functions creates a project folder with the specified name in the
#' current working directory. The directory structure of the folder is specified
#' by the provided template. Function halt with an error if a folder with the
#' specified project name already exists.
#'
#' @importFrom data.tree ToDataFrameTable
#'
#' @export

CreateProjectDirectory <- function(name, template) {

    template <- LoadTemplate(template)
    template$`name` <- name
    dirs <- ToDataFrameTable(template, "pathString", direction = 'descend',
                             traversal = 'level')

    # Check if project directory exists
    if (dir.exists(name))
        stop('A folder with that name already exists')

    # Create directory structure
    f <- sapply(dirs, dir.create, recursive = T)
}

