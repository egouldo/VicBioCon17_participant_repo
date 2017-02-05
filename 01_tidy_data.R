# Clean and Tidy Data: challenge 3
library(tidyverse)
# Challenge 5: import bat dat
bat_dat <- readr::read_csv("./data/bat_dat.csv")
# Challenge 6:
bat_dat <- readr::read_csv("./data/bat_dat.csv", 
                           col_types = cols(Season = col_factor(levels = c(1,2)),
                                            Habitat = col_factor(levels = c(0,1)),
                                            Bioregion = col_factor(levels = c(1:4,NA))
                           ))
# Challenge 8:
bat_dat <- 
        bat_dat %>%
        mutate(Moon = as.factor(Moon),
               NatEx = as.factor(NatEx),
               Bioregion = as.factor(Bioregion))
# Challenge 9:
# Either
bat_dat <- bat_dat %>% 
        mutate(Site = replace(Site, Site == "Ferny Crrek", "Ferny Creek"))
# Or
bat_dat <- bat_dat %>% 
        mutate(Site = ifelse(Site == "Ferny Crrek", "Ferny Creek", Site))

#Challenge 10
bat_dat <- bat_dat %>%
        rename(water_depth = `Water Depth`,
               Imp_5km = `Imp 5km`,
               Trees_5km = `Trees 5km`,
               Trees_total_plot = `Trees total.plot`,
               TreesLarge_20dbh_plot = `TreesLarge>20dbh.plot`,
               TreesSmall_20dbh_plot = `TreesSmall<20dbh.plot`,
               Trees_total_plot = `Trees total.plot`,
               Shrubs_plot = Shrubs.plot,
               Hollows_total = Hollows.total,
               CG_Mormlp = `CG/Mormlp`,
               Nspp_Mmacr = `Nspp/Mmacr`)
write_csv(bat_dat, "./output/bat_dat.csv")
# Challenge 11
bat_dat %>%
        select(Site, Habitat, Season, Col:Plec) %>%
        gather(key = insect_order, value = abundance, -Site, -Habitat, -Season)


