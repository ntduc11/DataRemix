\name{DataRemix}
\alias{DataRemix}
\title{DataRemix Main function}
\usage{
DataRemix(svdres, matrix=NULL, fn, k_limits = c(1, ceiling(length(svdres$d)/2)), p_limits = c(-1,1), 
          mu_limits = c(1e-12,1), num_of_initialization = 5, num_of_thompson = 600, 
          basis = "omega", basis_size =2500, xi = 0.1, full = T, verbose = T,...)
}                      
\arguments{
\item{svdres}{The full SVD decomposition of input gene expression profile X, which is equal to svd(X)}

\item{matrix}{The input gene expression profile X}

\item{fn}{The custom function which takes svdres and some additional custom parameters as input and output the biological metric to be maximized. It can have multiple output in the vector format, but the optimized metric should be put at the last position}

\item{k_limits}{The lower and upper bound of k. By default the lower bound is set to be 1 and the upper bound is set to be the half of the rank}

\item{p_limits}{The lower and upper bound of p. By default the lower bound is set to be -1 and the upper bound is set to be 1}

\item{mu_limits}{The lower and upper bound of \eqn{\mu}. By defult the lower bound is set to be 1e-12 and the upper bound is set to be 1}

\item{num_of_initialization}{By default it uses 5 steps of Random Search to initialize the Thompson Sampling. We also provide a coarsed grid option for initialization with num_of_initialization set to be 0}

\item{num_of_thompson}{The number of steps of Thompson Sampling, which is 600 by default}

\item{basis}{The default is to use "omega" corresponding to exponential kernel. There are two other options available: "omega_Gaussian" (Gaussian kernel) and "omega_Laplacian" (Laplacian kernel)}

\item{basis_size}{The default mt is set to be 2,500. You can specify a smaller mt by setting it to be 2,000.}

\item{xi}{A pre-defined probability which ensures the search doesn't stuck in the local optimum, which is 0.1 by default}

\item{full}{If full is set to be True, the output will be the complete search history. Otherwise the output will only be the optimal combination of k, p and \eqn{\mu} and the corresponding biological metric}

\item{verbose}{If verbose is set to be True, then after each Thompson Sampling iteration, the function will print out the intermediate result.}

\item{...}{Additional arguments used as inputs to fn()}
}

\value{
\item{para}{If verbose is set to be True, the dimension of para is (num_of_initialization+num_of_thompson)-by-4(k, p, \eqn{\mu}, biological metric). Otherwise, para is only a single vector with length 4}
}
\description{
Main DataRemix function
}
