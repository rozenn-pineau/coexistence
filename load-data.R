# ------------------------------------------------------------------------------------------ Day 0-20

# Small area
setwd("/Users/rpineau3/Dropbox (GaTech)/BioSci-Ratcliff/Rozenn/2.CoexistenceProject/2-Lab/17-EvolutionExperiment/Days0-20/area/small_area/")
s1_d1 <- as.matrix(read.table("area_monoculture_small_line1_day1.txt", sep="\t", header = FALSE))
s2_d1 <- as.matrix(read.table("area_monoculture_small_line2_day1.txt", sep="\t", header = FALSE))
s3_d1 <- as.matrix(read.table("area_monoculture_small_line3_day1.txt", sep="\t", header = FALSE))
s4_d1 <- as.matrix(read.table("area_monoculture_small_line4_day1.txt", sep="\t", header = FALSE))

s1_d5 <- as.matrix(read.table("area_monoculture_small_line1_day5.txt", sep="\t", header = FALSE))
s2_d5 <- as.matrix(read.table("area_monoculture_small_line2_day5.txt", sep="\t", header = FALSE))
s3_d5 <- as.matrix(read.table("area_monoculture_small_line3_day5.txt", sep="\t", header = FALSE))
s4_d5 <- as.matrix(read.table("area_monoculture_small_line4_day5.txt", sep="\t", header = FALSE))

s1_d10 <- as.matrix(read.table("area_monoculture_small_line1_day10.txt", sep="\t", header = FALSE))
s2_d10 <- as.matrix(read.table("area_monoculture_small_line2_day10.txt", sep="\t", header = FALSE))
s3_d10 <- as.matrix(read.table("area_monoculture_small_line3_day10.txt", sep="\t", header = FALSE))
s4_d10 <- as.matrix(read.table("area_monoculture_small_line4_day10.txt", sep="\t", header = FALSE))

s1_d15 <- as.matrix(read.table("area_monoculture_small_line1_day15.txt", sep="\t", header = FALSE))
s2_d15 <- as.matrix(read.table("area_monoculture_small_line2_day15.txt", sep="\t", header = FALSE))
s3_d15 <- as.matrix(read.table("area_monoculture_small_line3_day15.txt", sep="\t", header = FALSE))
s4_d15 <- as.matrix(read.table("area_monoculture_small_line4_day15.txt", sep="\t", header = FALSE))

s1_d20 <- as.matrix(read.table("area_monoculture_small_line1_day20.txt", sep="\t", header = FALSE))
s2_d20 <- as.matrix(read.table("area_monoculture_small_line2_day20.txt", sep="\t", header = FALSE))
s3_d20 <- as.matrix(read.table("area_monoculture_small_line3_day20.txt", sep="\t", header = FALSE))
s4_d20 <- as.matrix(read.table("area_monoculture_small_line4_day20.txt", sep="\t", header = FALSE))

setwd("/Users/rpineau3/Dropbox (GaTech)/BioSci-Ratcliff/Rozenn/2.CoexistenceProject/2-Lab/17-EvolutionExperiment/Days0-20/area/large_area")
# Large area
l1_d1 <- as.matrix(read.table("area_monoculture_large_line1_day1.txt", sep="\t", header = FALSE))
l3_d1 <- as.matrix(read.table("area_monoculture_large_line3_day1.txt", sep="\t", header = FALSE))
l4_d1 <- as.matrix(read.table("area_monoculture_large_line4_day1.txt", sep="\t", header = FALSE))

l1_d5 <- as.matrix(read.table("area_monoculture_large_line1_day5.txt", sep="\t", header = FALSE))
l3_d5 <- as.matrix(read.table("area_monoculture_large_line3_day5.txt", sep="\t", header = FALSE))
l4_d5 <- as.matrix(read.table("area_monoculture_large_line4_day5.txt", sep="\t", header = FALSE))

l1_d10 <- as.matrix(read.table("area_monoculture_large_line1_day10.txt", sep="\t", header = FALSE))
l3_d10 <- as.matrix(read.table("area_monoculture_large_line3_day10.txt", sep="\t", header = FALSE))
l4_d10 <- as.matrix(read.table("area_monoculture_large_line4_day10.txt", sep="\t", header = FALSE))

l1_d15 <- as.matrix(read.table("area_monoculture_large_line1_day15.txt", sep="\t", header = FALSE))
l3_d15 <- as.matrix(read.table("area_monoculture_large_line3_day15.txt", sep="\t", header = FALSE))
l4_d15 <- as.matrix(read.table("area_monoculture_large_line4_day15.txt", sep="\t", header = FALSE))

l1_d20 <- as.matrix(read.table("area_monoculture_large_line1_day20.txt", sep="\t", header = FALSE))
l3_d20 <- as.matrix(read.table("area_monoculture_large_line3_day20.txt", sep="\t", header = FALSE))
l4_d20 <- as.matrix(read.table("area_monoculture_large_line4_day20.txt", sep="\t", header = FALSE))


# ------------------------------------------------------------------------------------------ Day 40
# Set directory
setwd("/Users/rpineau3/Dropbox (GaTech)/BioSci-Ratcliff/Rozenn/2.CoexistenceProject/2-Lab/17-EvolutionExperiment/Day40/area_1698")

# Large monoculture lines
# Line 1
l1_1698_1 <- read.table("20211124_1698_5_1.csv", header = T, sep = ",")
l1_1698_2 <- read.table("20211124_1698_5_2.csv", header = T, sep = ",")
l1_1698_3 <- read.table("20211124_1698_5_3.csv", header = T, sep = ",")
l1_1698_4 <- read.table("20211124_1698_5_4.csv", header = T, sep = ",")
l1_d40 <- as.matrix(l1_1698_1$Area, l1_1698_2$Area, l1_1698_2$Area, l1_1698_2$Area)


# Line 2
l3_1698_1 <- read.table("20211124_1698_6_1.csv", header = T, sep = ",")
l3_1698_2 <- read.table("20211124_1698_6_2.csv", header = T, sep = ",")
l3_1698_3 <- read.table("20211124_1698_6_3.csv", header = T, sep = ",")
l3_1698_4 <- read.table("20211124_1698_6_4.csv", header = T, sep = ",")
l3_d40 <- as.matrix(l3_1698_1$Area, l3_1698_2$Area, l3_1698_2$Area, l3_1698_2$Area)


# Line 3
l4_1698_1 <- read.table("20211124_1698_7_1.csv", header = T, sep = ",")
l4_1698_2 <- read.table("20211124_1698_7_2.csv", header = T, sep = ",")
l4_1698_3 <- read.table("20211124_1698_7_3.csv", header = T, sep = ",")
l4_1698_4 <- read.table("20211124_1698_7_4.csv", header = T, sep = ",")
l4_d40 <- as.matrix(l4_1698_1$Area, l4_1698_2$Area, l4_1698_2$Area, l4_1698_2$Area)

setwd("/Users/rpineau3/Dropbox (GaTech)/BioSci-Ratcliff/Rozenn/2.CoexistenceProject/2-Lab/17-EvolutionExperiment/Day40/area_1717")

# Small monoculture lines
# Line 1
s1_1717_1 <- read.table("20211124_1717_1_1.csv", header = T, sep = ",")
s1_1717_2 <- read.table("20211124_1717_1_2.csv", header = T, sep = ",")
s1_1717_3 <- read.table("20211124_1717_1_3.csv", header = T, sep = ",")
s1_1717_4 <- read.table("20211124_1717_1_4.csv", header = T, sep = ",")
s1_d40 <- as.matrix(s1_1717_1$Area, s1_1717_2$Area, s1_1717_2$Area, s1_1717_2$Area)

# Line 2
s2_1717_1 <- read.table("20211124_1717_2_1.csv", header = T, sep = ",")
s2_1717_2 <- read.table("20211124_1717_2_2.csv", header = T, sep = ",")
s2_1717_3 <- read.table("20211124_1717_2_3.csv", header = T, sep = ",")
s2_1717_4 <- read.table("20211124_1717_2_4.csv", header = T, sep = ",")
s2_d40 <- as.matrix(s2_1717_1$Area, s2_1717_2$Area, s2_1717_2$Area, s2_1717_2$Area)

# Line 3
s3_1717_1 <- read.table("20211124_1717_3_1.csv", header = T, sep = ",")
s3_1717_2 <- read.table("20211124_1717_3_2.csv", header = T, sep = ",")
s3_1717_3 <- read.table("20211124_1717_3_3.csv", header = T, sep = ",")
s3_1717_4 <- read.table("20211124_1717_3_4.csv", header = T, sep = ",")
s3_d40 <- as.matrix(s3_1717_1$Area, s3_1717_2$Area, s3_1717_2$Area, s3_1717_2$Area)

# Line 4
s4_1717_1 <- read.table("20211124_1717_4_1.csv", header = T, sep = ",")
s4_1717_2 <- read.table("20211124_1717_4_2.csv", header = T, sep = ",")
s4_1717_3 <- read.table("20211124_1717_4_3.csv", header = T, sep = ",")
s4_1717_4 <- read.table("20211124_1717_4_4.csv", header = T, sep = ",")
s4_d40 <- as.matrix(s4_1717_1$Area, s4_1717_2$Area, s4_1717_2$Area, s4_1717_2$Area)

# Clean environment
rm(list= ls()[!(ls() %in% c('l1_d1', 'l1_d5', 'l1_d10','l1_d15','l1_d20', 'l1_d40',
                            'l3_d1', 'l3_d5', 'l3_d10','l3_d15','l3_d20', 'l3_d40', 
                            'l4_d1', 'l4_d5', 'l4_d10','l4_d15','l4_d20', 'l4_d40', 
                            's1_d1', 's1_d5', 's1_d10','s1_d15','s1_d20', 's1_d40',
                            's2_d1', 's2_d5', 's2_d10','s2_d15','s2_d20', 's2_d40', 
                            's3_d1', 's3_d5', 's3_d10','s3_d15','s3_d20', 's3_d40', 
                            's4_d1', 's4_d5', 's4_d10','s4_d15','s4_d20', 's4_d40'))])





setwd("/Users/rpineau3/Dropbox (GaTech)/BioSci-Ratcliff/Rozenn/2.CoexistenceProject/12-Writing/8-scripts/2-second-round-revisions/pre-revision/Figure5")
