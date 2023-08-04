# This script calls other scripts to make the elements of Figure 1. 

# Change the path to your F1 directory
setwd("/Users/rpineau3/Dropbox (GaTech)/BioSci-Ratcliff/Rozenn/2.CoexistenceProject/12-Writing/11-NE&Esubmission/resubmission/final/scripts/F1/")

# Makes Figure 1 panel B - size distributions
source("panel-b-size-distributions.R")
# Makes Figure 1 panel C - cell aspect ratio
source("panel-c-aspect-ratio.R")
