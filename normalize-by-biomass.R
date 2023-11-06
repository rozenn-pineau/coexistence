
################################################################################
####                           normalize by biomass                        #####
################################################################################

# Goal: to have the proportion not in terms of cluster number, but biomass importance. 

list_of_dataset_names <- c( 'l1_d1', 'l1_d5', 'l1_d10','l1_d15','l1_d20', 'l1_d40',
                            'l3_d1', 'l3_d5', 'l3_d10','l3_d15','l3_d20', 'l3_d40', 
                            'l4_d1', 'l4_d5', 'l4_d10','l4_d15','l4_d20', 'l4_d40', 
                            's1_d1', 's1_d5', 's1_d10','s1_d15','s1_d20', 's1_d40',
                            's2_d1', 's2_d5', 's2_d10','s2_d15','s2_d20', 's2_d40', 
                            's3_d1', 's3_d5', 's3_d10','s3_d15','s3_d20', 's3_d40', 
                            's4_d1', 's4_d5', 's4_d10','s4_d15','s4_d20', 's4_d40' )


for (i in 1:length(list_of_dataset_names)) {
  
  name <- list_of_dataset_names[i]
  dataset <- get(name)
  
  # From area, calculate radius
  radius <- sqrt(dataset/pi)
  
  # From radius, calculate volume
  volume <- 4/3*pi*(radius)^3
  
  # Parameters
  nbins <-1500 # Decide a number of bins (high number because volume)
  
  # Calculate total biomass
  total_biomass <- sum(volume)
  
  # Calculate the size of each bin
  binsize <- (max(volume)-min(volume))/nbins
  
  # Make the vector recording bin sizes
  bin_vec <- c()
  
  for (i in 1:c(nbins+1)){ # has the min and max sizes
    bin_vec <- c(bin_vec, min(volume)+(i-1)*binsize)
  }
  
  # Find the bin for each sample
  biomass <- c()
  
  for (b in 1:nbins){
    temp_size <- c()
    
    for (s in 1:length(volume)){
      if (volume[s]>=bin_vec[b] && volume[s]<=bin_vec[b+1]){
        temp_size <- c(temp_size, (volume[s]/total_biomass))}
    }
    biomass <- c(biomass, sum(temp_size))
    
  }
  
  # Find mean bin size (otherwise distribution is skewed to the left)
  mean_bin_size <- c()
  
  for (i in 1:c(length(bin_vec)-1)){
    mean_bin_size <- c(mean_bin_size, (bin_vec[i]+bin_vec[i+1])/2)
  }
  
  # Convert back to radius
  mean_bin_size_radius <- ((mean_bin_size*3)/(4*pi))^(1/3)
  
  # Output
  newname <- paste(name, "norm", sep = "_")
  assign(newname, cbind(mean_bin_size_radius, biomass))
  
}





