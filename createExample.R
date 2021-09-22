
# # Install graphicalExtremes + dependencies:
# install.packages(c('igraph', 'mvtnorm', 'matrixcalc', 'Rdpack', 'corpcor', 'glasso'))
# install.packages('./graphicalExtremes_0.1.0.9000.tar.gz')


# Load packages:
library(graphicalExtremes)

# Load helper file:
source('writeMatrixToFile.R')

# Set parameters:
d <- 5
n <- 1000


# Create model:
model <- generate_random_model(d, 'tree')

# Output model:
pdf('graph.pdf')
plot(model$graph)
writeMatrixToFile(model$Gamma, 'Gamma.tex')


# Generate Data From Model:
data <- rmpareto(n, 'HR', d, model$Gamma)

# Estimate Gamma:
GammaEmp <- fmpareto_graph_HR(
  data,
  model$graph
)$Gamma


# Plot estimated vs. true Gamma:
pdf('estimate.pdf')
plot(
  as.vector(model$Gamma),
  as.vector(GammaEmp)
)

