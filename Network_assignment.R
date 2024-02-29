library('statnet')
library('sna')

#yooooooooooooo waddup
network_data <- read.csv("FILENAME.csv", header=F)
network_data_sociomatrix <- network(network_data, directed=FALSE)
network_data_sociomatrix

attributes <- read.csv("company_attribute_data.csv")
set.vertex.attribute(network_data_sociomatrix,names(attributes), 
                     attributes)
list.vertex.attributes(network_data_sociomatrix)
edge <- as.matrix(read.csv("company_edge_closeness.csv", header=F))
network_data_sociomatrix<-
  as.network(edge,directed=FALSE,ignore.eval=FALSE,names.eval="closeness")

summary(network_data_sociomatrix %e% "closeness")
get.edge.attribute(network_data_sociomatrix,"closeness")

