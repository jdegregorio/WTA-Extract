# # The purpose of this script is to crawl the WTA hike pages and download all
# # HTML content.
# 
# # SETUP -----------------------------------------------------------------------
# 
# library(Rcrawler)
# library(here)
# 
# 
# # CRAWL WEBPAGES --------------------------------------------------------------
# 
# Rcrawler(
#   Website = "https://www.wta.org/go-outside/hikes",
#   crawlZoneCSSPat = ".search-listing",
#   no_cores = 4,
#   no_conn = 4,
#   MaxDepth = 10,
#   DIR = here("data", "raw_html"),
#   RequestsDelay = 3,
#   Useragent = "Mozilla/5.0 (Windows NT 6.3; Win64; x64)"
# )
