
# Function to read HTML and then wait 
read_wait <- function (url) {
  
  # Print URL
  print(url)
  
  # Read HTML
  html <- read_html(url)
  
  # Set delay based on normal distribution
  delay <- runif(1, 4, 6)
  Sys.sleep(delay)

  return(html)
}

# Function to read HTML and then wait then save hike query
read_wait_save_query <- function (url, path_dir) {

  # Read HTML
  html <- read_wait(url)
  
  # Extract start/end
  start <- str_extract(url, "(?<=b_start:int=)[:digit:]+") %>% as.numeric()
  size  <- str_extract(url, "(?<=b_size:int=)[:digit:]+") %>% as.numeric()
  end   <- start + size
  file  <- str_c("query_hike_", start, "_", end, ".html")
  
  # Save HTML
  write_html(html, str_c(path_dir, "/", file))

}

# Function to create hike page query url
create_hike_query_url <- function(int_start = 0, int_interval = 100) {
  
  # Construct URL
  url <- paste0(
    "https://www.wta.org/go-outside/hikes?", 
    "b_start:int=", int_start,
    "&b_size:int=", int_interval
  )

  return(url)
}
