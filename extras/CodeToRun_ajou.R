library(SevereCovidPrediction)
# USER INPUTS
#=======================
# The folder where the study intermediate and result files will be written:
outputFolder <- "/home/scyou/output/SevereCovidPredictionV2T1"

# Specify where the temporary files (used by the ff package) will be created:
options(fftempdir = "/home/scyou/temp")

# Details for connecting to the server:
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = "sql server",
                                                                server = "128.1.99.53",
                                                                user = "chandryou",
                                                                password = "dbtmdcks12#")


# Add the database containing the OMOP CDM data
cdmDatabaseSchema<- "AUSOMv5_3.dbo" #AUSOMv5_3_1
# Add a sharebale name for the database containing the OMOP CDM data
cdmDatabaseName <- 'NHIS-NSC'
# Add a database with read/write access as this is where the cohorts will be generated
cohortDatabaseSchema <- "cohortDb.dbo"

oracleTempSchema <- NULL

# table name where the cohorts will be generated
cohortTable <- 'SevereCovidPrediction'
#=======================

execute(connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cdmDatabaseName = cdmDatabaseName,
        cohortDatabaseSchema = cohortDatabaseSchema,
        cohortTable = cohortTable,
        outputFolder = outputFolder,
        createProtocol = F,
        createCohorts = T,
        runAnalyses = T,
        createResultsDoc = F,
        packageResults = T,
        createValidationPackage = T, 
        minCellCount= 1,
        createShiny = T,
        createJournalDocument = F,
        analysisIdDocument = 1
)

# if you ran execute with: createShiny = T
# Uncomment and run the next line to see the shiny app:
viewShiny()
