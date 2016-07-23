# Load the required libraries
library(RColorBrewer)
library(dplyr)
library(ggplot2)
library(reshape2)
library(grid)
library(extrafont)


plover_HSR <- read.csv("/Users/Luke/Downloads/nestusef.csv", stringsAsFactors = FALSE)

plover_HSR$species <- as.factor(plover_HSR$species)



# Comparative plot of bootstrap results of ASR
HSR_histogram <- 
  ggplot(data = plover_HSR, aes(y = prop_male, factor(species))) +
  # coord_flip() +
  # annotate("rect", xmin=0.15, xmax=0.5, ymin=0, ymax=170, alpha=0.7,
  #          fill= brewer.pal(8, "Dark2")[c(1)]) +
  # annotate("rect", xmin=0.5, xmax=0.85, ymin=0, ymax=170, alpha=0.7,
  #          fill= brewer.pal(8, "Dark2")[c(2)]) +
  # annotate("text", x = c(0.2), y = c(85),
  #          label = c("\u2640"), size = 7,
  #          family="Menlo", vjust = c(0.5), hjust = c(0.5)) +
  # annotate("text", x = c(0.8), y = c(85),
  #          label = c("\u2642"), size = 7,
  #          family="Menlo", vjust = c(0.5), hjust = c(0.5)) +
  geom_boxplot() +
  #geom_errorbarh(data = All_pops_CI, aes(y = 160, x = lcl, xmin = lcl, xmax = ucl), color = "black", size = 0.8, linetype = "solid") +
  facet_grid(. ~ species) +
  theme_bw() +
  theme(text=element_text(family="Menlo"),
        legend.position="none",
        legend.position = c(0, 1), 
        legend.justification = c(0, 1),
        legend.text=element_text(size=11),
        legend.title=element_blank(),
        legend.key.height=unit(0.8,"line"),
        legend.key.width=unit(0.8,"line"),
        legend.background = element_rect(fill=NA),
        axis.title.y = element_text(size=12, vjust=-0.1),
        axis.text.y  = element_text(size=10), 
        axis.title.x = element_text(size=12),
        axis.text.x  = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_line(size = 0.5, colour = "grey40"),
        axis.ticks.length = unit(0.2, "cm"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        plot.margin = unit(c(0.5,1.75,1.95,0.7), "cm"),
        strip.background = element_blank(), 
        strip.text = element_text(size=11),
        panel.margin = unit(0.75, "lines")) +
  xlab("Species") +
  ylab("Hatching sex ratio (proportion \u2642)")
HSR_histogram

# Save plot
ggsave(Bootstrap_histogram_all, 
       filename = "ASR_bootstrap_histogram_All_pops.jpg", 
       path = "figs/",
       width = 10,
       height = 4.5, units = "in",
       dpi = 300)
