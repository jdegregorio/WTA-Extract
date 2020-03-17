# The purpose of this script is extract the pages from the "Hike Finder" tool on
# WTA to identify the entire list of hikes, breif summaries, and the url to the
# full hike page.

# SETUP -----------------------------------------------------------------------

# Clear workspace
rm(list = ls())

# Load required package libraries
library(tidyverse)
library(lubridate)
library(rvest)
library(httr)
library(here)

# Load functions
source(here("code", "helpers.R"))

# Define user agent
ua <- user_agent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36")
set_config(ua)

# Parameters
query_size = 100
query_end_max = 500

# QUERY HIKES -----------------------------------------------------------------

# Initialize first query to find total hike count
hike_count <- 
  create_hike_query_url(int_interval = 10) %>%
  read_wait() %>%
  html_node(".search-count") %>%
  html_node("span") %>%
  html_text() %>%
  as.numeric()

# Check size and constrain to query_end_max parameter if necessary
if (hike_count > query_end_max) {
  query_end <- query_end_max
} else {
  query_end <- hike_count
}

# Create urls for all required queries
urls <- create_hike_query_url(seq(0, query_end, query_size))
  
# Run queries
map(
  urls,
  read_wait_save_query,
  path_dir = here("data", "html_query_hikes")
)
