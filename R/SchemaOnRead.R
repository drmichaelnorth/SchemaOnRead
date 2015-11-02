##
## File: SchemaOnRead.R
## Author: Michael J. North
## Date: September 14, 2015
##

##
## Define the directory processor.
##
schemaOnReadProcessDirectory <- function(path = ".",
                                         processors = schemaOnReadDefaultProcessors(),
                                         verbose = FALSE) {
  
  ## Define the results holder.
  results <- list()
  
  ## Check the entry.
  if ((file.exists(path)) && (file.info(path)$isdir)) {
    
    ## Find the entries in the the given source path.
    listing <- dir(path = path,
                   all.files = FALSE,
                   full.names = FALSE,
                   recursive = FALSE,
                   ignore.case = FALSE,
                   include.dirs = TRUE,
                   no.. = TRUE)
    
    ## Process the entries.
    for (entry in listing) {
      
      ## Find the full path to the entry.
      file <- paste(path, .Platform$file.sep, entry, sep = "")
      
      ## Define the variable name.
      variable <-formatVariableName(entry)
      while (eval(parse(
        text = paste("exists(\"results$", variable, "\")",
                     sep = "")))) {
        variable <- paste(variable, "_A", sep = "")
      }
      
      ## Setup the processing command.
      command <- paste("results$", variable,
                       " <- schemaOnRead",
                       "(file, processors, verbose)", sep = "")
      
      
      ## Evaluate the processing command.
      eval(parse(text = command))
      
    }
    
    ## Return the results.
    return(results)
    
  } else {
    
    ## Note that this is not match.
    return(NULL)
    
  }
  
}

##
## Define the bitmap (BMP, PNG, and JPG) file processor.
##
schemaOnReadProcessBitmapsFile <- function(path = ".",
                                           processors = schemaOnReadDefaultProcessors(),
                                           verbose = FALSE) {
  
  ## Check the given path.
  if (file.exists(path)) {
    
    ## Check the given file.
    type_code <- readbitmap::image_type(path)
    if ((!is.na(type_code)) &&
        ((type_code == "bmp") ||
         (type_code == "jpg") ||
         (type_code == "png"))) {
      
      ## Attempt to read the file.
      return(readbitmap::read.bitmap(path))
      
    } else {
      
      ## Return the default value.
      return(NULL)
      
    }
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the OpenDocument spreadsheet file processor.
##
schemaOnReadProcessODSFile <- function(path = ".",
                                       processors = schemaOnReadDefaultProcessors(),
                                       verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "ods")) {
    
    ## Attempt to read the file.
    return(readODS::read.ods(file = path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the DIF file processor.
##
schemaOnReadProcessDIFFile <- function(path = ".",
                                       processors = schemaOnReadDefaultProcessors(),
                                       verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "dif")) {
    
    ## Attempt to read the file.
    try (
      return(utils::read.DIF(path)),
      silent = TRUE
    )
    
    ## Attempt to read the file again.
    try (
      return(utils::read.DIF(path, transpose = TRUE))
    )
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the EPIINFO file processor.
##
schemaOnReadProcessEPIINFOFile <- function(path = ".",
                                           processors = schemaOnReadDefaultProcessors(),
                                           verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "rec")) {
    
    ## Attempt to read the file.
    return(suppressWarnings(
      foreign::read.epiinfo(path)
    ))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the CSV file processor.
##
schemaOnReadProcessCSVFile <- function(path = ".",
                                       processors = schemaOnReadDefaultProcessors(),
                                       verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "csv")) {
    
    ## Attempt to read the file.
    return(utils::read.csv(path, header = TRUE))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the GIF file processor.
##
schemaOnReadProcessGIFFile <- function(path = ".",
                                       processors = schemaOnReadDefaultProcessors(),
                                       verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "gif")) {
    
    ## Attempt to read the file.
    return(caTools::read.gif(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the TIFF file processor.
##
schemaOnReadProcessTIFFFile <- function(path = ".",
                                        processors = schemaOnReadDefaultProcessors(),
                                        verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      ((tolower(tools::file_ext(path)) == "tif") ||
       (tolower(tools::file_ext(path)) == "tiff"))) {
    
    ## Attempt to read the file.
    return(tiff::readTIFF(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the ARFF file processor.
##
schemaOnReadProcessARFFFile <- function(path = ".",
                                        processors = schemaOnReadDefaultProcessors(),
                                        verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      ((tolower(tools::file_ext(path)) == "arf") ||
       (tolower(tools::file_ext(path)) == "arff"))) {
    
    ## Attempt to read the file.
    return(foreign::read.arff(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the DBF file processor.
##
schemaOnReadProcessDBFFile <- function(path = ".",
                                       processors = schemaOnReadDefaultProcessors(),
                                       verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "dbf")) {
    
    ## Attempt to read the file.
    return(foreign::read.dbf(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the HTML file processor.
##
schemaOnReadProcessHTMLFile <- function(path = ".",
                                        processors = schemaOnReadDefaultProcessors(),
                                        verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      ((tolower(tools::file_ext(path)) == "htm") ||
       (tolower(tools::file_ext(path)) == "html"))) {
    
    ## Attempt to read the file.
    return(XML::htmlTreeParse(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the SPSS file processor.
##
schemaOnReadProcessSPSSFile <- function(path = ".",
                                        processors = schemaOnReadDefaultProcessors(),
                                        verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "sav")) {
    
    ## Attempt to read the file.
    return(foreign::read.spss(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the SYS file processor.
##
schemaOnReadProcessSYSFile <- function(path = ".",
                                       processors = schemaOnReadDefaultProcessors(),
                                       verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "sys")) {
    
    ## Attempt to read the file.
    return(foreign::read.systat(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the Stata 13 file processor.
##
schemaOnReadProcessStata13File <- function(path = ".",
                                           processors = schemaOnReadDefaultProcessors(),
                                           verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "dta")) {
    
    ## Attempt to read the file.
    return(readstata13::read.dta13(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the Pajek file processor.
##
schemaOnReadProcessPajekFile <- function(path = ".",
                                         processors = schemaOnReadDefaultProcessors(),
                                         verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      ((tolower(tools::file_ext(path)) == "net") ||
       (tolower(tools::file_ext(path)) == "paj"))) {
    
    ## Attempt to read the file.
    return(network::read.paj(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the text file processor.
##
schemaOnReadProcessTextFile <- function(path = ".",
                                        processors = schemaOnReadDefaultProcessors(),
                                        verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "txt")) {
    
    ## Attempt to read the file.
    return(read.csv(path, header = FALSE))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the RDS file processor.
##
schemaOnReadProcessRDSFile <- function(path = ".",
                                       processors = schemaOnReadDefaultProcessors(),
                                       verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "rds")) {
    
    ## Attempt to read the file.
    return(base::readRDS(path))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the XML file processor.
##
schemaOnReadProcessXMLFile <- function(path = ".",
                                       processors = schemaOnReadDefaultProcessors(),
                                       verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      (tolower(tools::file_ext(path)) == "xml")) {
    
    ## Attempt to read the file.
    return(XML::xmlToList(XML::xmlParse(path), simplify = TRUE))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the XLS and XLSX spreadsheet file processor.
##
schemaOnReadProcessXLSandXLSXFile <- function(path = ".",
                                              processors = schemaOnReadDefaultProcessors(),
                                              verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      ((tolower(tools::file_ext(path)) == "xls") ||
       (tolower(tools::file_ext(path)) == "xlsx"))) {
    
    ## Create the results holder.
    results <- list()
    
    ## Attempt to read the file.
    workbook <- XLConnect::loadWorkbook(path)
    
    ## Scan the worksheets.
    for (worksheet in XLConnect::getSheets(workbook)) {
      
      ## Define the variable name.
      variable <- formatVariableName(worksheet)
      while (eval(parse(
        text = paste("exists(\"results$", variable, "\")",
                     sep = "")))) {
        variable <- paste(variable, "_A", sep = "")
      }
      
      ## Setup the processing command.
      command <- paste("results$", variable,
                       " <- XLConnect::readWorksheet",
                       "(workbook, sheet = worksheet)", sep = "")
      
      ## Evaluate the processing command.
      eval(parse(text = command))
      
    }
    
    ## Return the results.
    return(results)
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the NetCDF and HDF5 file processor.
##
schemaOnReadProcessNetCDandH5FFile <- function(path = ".",
                                               processors = schemaOnReadDefaultProcessors(),
                                               verbose = FALSE) {
  
  ## Check the given path.
  if ((file.exists(path)) &&
      ((tolower(tools::file_ext(path)) == "nc") ||
       (tolower(tools::file_ext(path)) == "h5"))) {
    
    ## Create the results holder.
    results <- list()
    
    ## Attempt to read the file.
    dimensions <- ncdf.tools::infoNcdfVars(path)
    
    ## Scan the dimensions
    for (name in dimensions$name) {
      
      ## Define the variable name.
      variable <- formatVariableName(name)
      
      ## Setup the processing command.
      command <- paste("try (results$", variable,
                       " <- ncdf.tools::readNcdf",
                       "(path, var.name = name), silent = TRUE)",
                       sep = "")
      
      ## Attempt to evaluate the processing command.
      eval(parse(text = command))
      
    }
    
    ## Return the results.
    return(results)
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the default file processor.
##
schemaOnReadProcessDefaultFile <- function(path = ".",
                                           processors = schemaOnReadDefaultProcessors(),
                                           verbose = FALSE) {
  
  ## Check the given path.
  if (file.exists(path)) {
    
    ## Note that that file is not recognized.
    return(paste(path, "File Type Unknown"))
    
  } else {
    
    ## Return the default value.
    return(NULL)
    
  }
  
}

##
## Define the file existance processor.
##
schemaOnReadProcessEntryDoesNotExist <- function(path = ".",
                                                 processors = schemaOnReadDefaultProcessors(),
                                                 verbose = FALSE) {
  
  ## Check the given path.
  if (file.exists(path)) {
    
    ## Return the default value.
    return(NULL)
    
  } else {
    
    ## Note that the file does not exist.
    return("Entry Does Not Exist")
    
  }
  
}

##
## Define the variable name formatter.
##
formatVariableName <- function(entry) {

  # Define the results holder.
  results <- gsub("[^[:alnum:]]", "_", entry)

  # Check the results.
  if (nchar(results) >= 1) {
    if ((substr(results, 1, 1) == "_") ||
        (grepl("^(0|1|2|3|4|5|6|7|8|9)", results))) {
      results <- paste("A", results, sep = "")
    } 
  }
  
  # Return the results.
  return(results)

}

##
## Define the default processors getter.
##
schemaOnReadSimpleProcessors <- function() {
  
  ## Define the default processors list.
  defaultProcessors <- list(
    schemaOnReadProcessEntryDoesNotExist,
    schemaOnReadProcessDirectory,
    schemaOnReadProcessDefaultFile
  )
  
  ## Return the results.
  return(defaultProcessors)
  
}

##
## Define the default processors getter.
##
schemaOnReadDefaultProcessors <- function() {
  
  ## Define the default processors list.
  defaultProcessors <- list(
    schemaOnReadProcessEntryDoesNotExist,
    schemaOnReadProcessDirectory,
    schemaOnReadProcessCSVFile,
    schemaOnReadProcessTextFile,
    schemaOnReadProcessRDSFile,
    schemaOnReadProcessXMLFile,
    schemaOnReadProcessXLSandXLSXFile,
    schemaOnReadProcessDIFFile,
    schemaOnReadProcessODSFile,
    schemaOnReadProcessStata13File,
    schemaOnReadProcessBitmapsFile,
    schemaOnReadProcessGIFFile,
    schemaOnReadProcessTIFFFile,
    schemaOnReadProcessNetCDandH5FFile,
    schemaOnReadProcessPajekFile,
    schemaOnReadProcessHTMLFile,
    schemaOnReadProcessARFFFile,
    schemaOnReadProcessEPIINFOFile,
    schemaOnReadProcessSPSSFile,
    schemaOnReadProcessDefaultFile
  )
  
  ## Return the results.
  return(defaultProcessors)
  
}

##
## Define the schema reader.
##
schemaOnRead <- function(path = ".",
                         processors = schemaOnReadDefaultProcessors(),
                         verbose = FALSE) {
  
  ## Note the status, if requested.
  if (verbose) {
    print(paste("schemaOnRead processing ", path, sep = ""))
    warnings()
  }
  
  ## Try the assigned processors.
  for (processor in processors) {
    
    ## Try the next processor.
    if (verbose) {
      results <- processor(path, processors, verbose)
    } else {
      suppressWarnings(
        results <- processor(path, processors, verbose)
      )
    }
    
    ## Check the results.
    if (!is.null(results)) {
      
      ## Note the status, if requested.
      if (verbose) {
        warnings()
      }
      
      ## Return the results.
      return(results)
      
    }
    
  }
  
  ## Return the default value.
  return("File Type Unknown")
  
}