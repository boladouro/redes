#### EXERCICIO 17 - Redes Aleatórias ####
library(igraph)

rn1 <- graph(edge=c(1,2,1,3,2,3,3,4,3,5,4,5,5,6,5,7,6,7,7,8,7,9,8,9,2,4,4,6,6,8),n=9,directed=F);
x = 9;
y = 15;
for (i in 1:191) {
  rn1 <- add_vertices(rn1,1)
  new<-floor(runif(1,min=1,max=x));
  nn<-neighbors(rn1,new);
  x=x+1;
  y=y+1;
  rn1<-add_edges(rn1,c(new,x));
  newr<-runif(1);
  y=y+1;
  if (newr<0.5) {
    deg <- degree(rn1,new,mode="all");
    new1 <- floor(runif(1,min=1,max=deg));
    rn1 <- add_edges(rn1,c(x,nn[new1])) }
  else {
    new2<-new;
    while (new==new2) new2<-floor(runif(1,min=1,max=x-1));
    rn1<-add_edges(rn1,c(new2,x))};
}

vcount(rn1)

ecount(rn1) # L = 397 = 15 + 2 * 191

transitivity(rn1)

mean_distance(rn1)

diameter(rn1)

deg1 <- degree(rn1, mode = "all")
mean(deg1)

table(deg1)

(ht <- mean(deg1^2)/mean(deg1)^2)
