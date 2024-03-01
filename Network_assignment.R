library('termg')
library('statnet')
library('ergm')
library('network')
library('sna')

setwd("C:/Users/mellia/PycharmProjects/Design_in_Network_group_8") 

#yooooooooooooo waddup
network_data <- data.matrix(read.csv("randstad_city_graph1.csv", sep=";", header=T))
network_data_sociomatrix <- network(network_data, directed=F)
network_data_sociomatrix
network.size(network_data_sociomatrix)


attributes <- read.csv("Graph_randstad.csv", sep=";", header =TRUE)
set.vertex.attribute(network_data_sociomatrix,names(attributes), 
                     attributes)
list.vertex.attributes(network_data_sociomatrix)
get.vertex.attribute(network_data_sociomatrix,"vertex.names")
head(attributes)



gplot(network_data_sociomatrix,displaylabels=T,
      label.cex=0.5,
      vertex.cex=1/log10(attributes$Employees)*5,
      usearrows=FALSE)

edge <- as.matrix(read.csv("company_edge_closeness.csv", header=F))
network_data_sociomatrix<-
  as.network(edge,directed=FALSE,ignore.eval=FALSE,names.eval="closeness")

summary(network_data_sociomatrix %e% "closeness")
get.edge.attribute(network_data_sociomatrix,"closeness")

gden(network_data_sociomatrix)
centralization(network_data_sociomatrix,degree)
components(network_data_sociomatrix)
degree_of_separation<-geodist(network_data_sociomatrix)
mean(degree_of_separation$gdist)
max(degree_of_separation$gdist)

network_largest_component<-
  component.largest(network_data_sociomatrix,result="graph")
degree_of_separation_component<-geodist(network_largest_component)
max(degree_of_separation_component$gdist)

mean(degree_of_separation_component$gdist)

degree(network_data_sociomatrix,gmode="graph")
closeness(network_data_sociomatrix,gmode="graph")
betweenness(network_data_sociomatrix,gmode="graph")
cutpoints(network_data_sociomatrix, mode="graph")
