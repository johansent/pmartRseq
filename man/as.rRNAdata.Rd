% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/as.rRNAdata.R
\name{as.rRNAdata}
\alias{as.rRNAdata}
\title{Convert Data to Appropriate pmartRseq Class}
\usage{
as.rRNAdata(e_data, f_data, e_meta = NULL, edata_cname, fdata_cname,
  emeta_cname = NULL, ...)
}
\arguments{
\item{e_data}{a \eqn{p \times n + 1} data.frame of expression data, where
\eqn{p} is the number of accession numbers observed and \eqn{n} is the
number of samples (an additional feature identifier/name column should also
be present anywhere in the data.frame). Each row corresponds to data for
each accession number.}

\item{f_data}{a data.frame with \eqn{n} rows. Each row corresponds to a
sample with one column giving the unique sample identifiers found in e_data
column names and other columns providing qualitative and/or quantitative
traits of each sample.}

\item{e_meta}{an optional data.frame with \eqn{p} rows. Each row corresponds
to an OTU with one column giving OTU identifiers (must be named the same as
the column in \code{e_data}) and other columns giving meta information
(e.g. mappings of OTU identification to taxonomy).}

\item{edata_cname}{character string specifying the name of the column
containing the identifiers in \code{e_data} and \code{e_meta} (if
applicable).}

\item{fdata_cname}{character string specifying the name of the column
containing the sample identifiers in \code{f_data}.}

\item{emeta_cname}{character string specifying the name of the column
containing the mapped identifiers in \code{e_meta} (if applicable).
Defaults to NULL. If \code{e_meta} is NULL, then specify \code{emeta_cname}
as NULL.}

\item{...}{further arguments}

\item{e_tree}{an optional NEXUS or Newick formatted phylogenetic tree file,
imported using ape::read.tree(tree_path). The OTU labels in the tree file
should match the OTU identifiers in the preceeding data fields.}

\item{e_seq}{an optional fasta formatted representation of biological
sequences imported using Biostrings::readDNAStringSet(fasta_path, ...).
Each OTU in the fasta maps to at least one sequence in the preceeding data
fields.}
}
\description{
Converts a list object or several data.frames of rRNA-level data (16s) to an
object of the class 'rRNAdata'. Objects of the class 'rRNAdata' are lists
with two obligatory components \code{e_data} and \code{f_data}. An optional
list component \code{e_meta} is used if analysis or visualization at other
levels (e.g. taxonomy) is also desired.
}
\details{
Objects of class 'rRNAdata' contain some attributes that are
  referenced by downstream functions. These attributes can be changed from
  their default value by manual specification. A list of these attributes as
  well as their default values are as follows: \tabular{ll}{ data_scale \tab
  Scale of the data provided in \code{e_data}. Acceptable values are 'log2',
  'log10', 'log', 'count', and 'abundance', which indicate data is log base
  2, base 10, natural log transformed, raw count data, and raw abundance,
  respectively. Default values is 'count'. \cr \tab \cr data_norm \tab A
  logical argument, specifying whether the data has been normalized or not.
  Default value is 'FALSE'. \cr \tab \cr norm_method \tab Null if data_norm
  is FALSE. If data_norm is TRUE, character string defining which
  normalization method was used. Default value is 'NULL'. \cr \tab \cr
  location_param \tab NULL if there are no location parameters from
  normalization, otherwise a vector detailing the normalization location
  parameters for each sample. \cr \tab \cr scale_param \tab NULL if there are
  no scale parameters from normalization, otherwise a vector detailing the
  normalization scale parameters for each sample. \cr \tab \cr data_types
  \tab Character string describing the type of data (e.g. 'HiSeq' or
  'Positive ion'). Default value is 'NULL'. \cr \tab \cr db \tab Character
  string describing which database was used to process the data (e.g.
  "TIGR"). Default value is 'NULL'. \cr \tab \cr db_version \tab Character
  string describing which version of the database was used. Default value is
  'NULL'. If db is NULL, then db_version will default to a NULL value. }

  Computed values included in the \code{data_info} attribute are as follows:
  \tabular{ll}{ num_edata \tab The number of unique \code{edata_cname}
  entries.\cr \tab \cr num_na \tab The number of NA observations in the
  dataset.\cr \tab \cr frac_na \tab The prportion of \code{e_data} values
  that are NA. \cr \tab \cr num_zero \tab The number of observations that
  equal 0 in the dataset. \cr \tab \cr frac_zero \tab The proportion of
  \code{e_data} values that are 0. \cr \tab \cr num_emeta \tab The number of
  unique \code{emeta_cname} entries. \cr \tab \cr num_samps \tab The number
  of samples that make up the columns of \code{e_data}.\cr \tab \cr meta_info
  \tab A logical argument, specifying whether \code{e_meta} is provided.\cr
  \tab \cr }
}
\seealso{
\code{\link{as.gDNAdata}}

\code{\link{as.cDNAdata}}
}
\author{
Allison Thompson, Lisa Bramer
}
