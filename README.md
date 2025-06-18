# Data analysis for Yang et al. 2025
Description of folders and contents related to bioinformatics and data analysis associated with Yang et al. 2025 

# parameter_tests folder
Test of parameters for de novo assembly with Stacks.

* BAWR_paramtest_names.txt: individuals selected for parameter tests
* scripts/BAWR_parametertest.sh: shell script to run denovo_map.pl at each set of parameters
* scripts/popsR80.sh: shell script to run populations on each set of output
* scripts/summarize_stacks_paramtests.py: Python script to summarize output of parameter tests for later visualization.
* BAWR_logs_across_pops: folder of population.log.distribs for each set of parameters
* Summarize BAWR Parameter Tests.html: Python notebook with code used to run summarize_stacks_paramtests.py script
* VisualizeBAWR_paramtest.html: Markdown Notebook with code for visualization of parameter tests.

# filtering folder
* BAWR_filtering.nb.html: R/Bash notebook with code to visualize and filter RADseq dataset. 
* subset_final_vcf.sh: Command lines to subset final dataset.

# vcffiles folder
* n71_mac3L80_maxhet50.snps.vcf: Full filtered dataset
* bawr_northern.recode.vcf: Filtered dataset for Northern Region individuals
* bawr_pdxcolr.recode.vcf: Filtered dataset for Portland and Columbia River individuals
  
# file_conversion folder
* convert_to_beagle.sh: Convert VCF to beagle. Example with Northern Regions.

# data_analyses folder
#### **subset\_data Folder**
* subset_final_vcf.sh: Command lines to subset final dataset.
* subset_Northern_.txt: individuals to include for Northern Region
* subset_pdx_colr.txt: individuals to include for Portland and Columbia River Regions
#### **popmaps Folder**
* BAWR_popmap_n71.txt: populations map for all data
* BAWR_popmap_north.txt: populations map for Northern region
* BAWR_popmap_pdxcolr.txt: populations map for Portland and Columbia River Regions
* BAWR_popmap_n71_regions.tsv: populations map for individuals to the four regions
#### **maxent Folder**
* gbif_miller_known_sites.csv: presence sites
* chelseacur_asc folder: clipped BIOCLIM and elevation layer
* Allvar_Batrachoseps_wrighti.html: MaxENT output for all variables
* 9var_Batrachoseps_wrighti.html: MaxENT output for top 9 variables
* 7var_Batrachoseps_wrighti.html: MaxENT output for top 7 variables
#### **popgen_summaries Folder**
* BAWR_popmap_n71.txt and BAWR_popmap_n71_regions.tsv: Population maps
* calc_sum_stats.sh: Command lines to calc sum stats in populations.
#### **fst_and_mantel Folder**
* bawr_n71_fstcalcs.r: R code to calculate Fst and bootstrap
* BAWR_popmap_n71_nested.tsv: population map
* bawr_n71_pwFst.csv: output Fst
* bawr_n71_pwPval.csv: output pvalues
* **mantel folder**
	* "in" text files: input for GenePop
    * "out" text files: output from GenePop
* **plotting_pw_values folder**
	* \*.xlsx files: input files with pairwise distances
    * ibd_code.R: R function to make pairwise plots
#### **pcangsd Folder**
* pcangsd_all_vis.nb.html: RMarkdown notebook file with code to run and visualize
* \*.cov: output from pcangsd for three subsets of data
* \*.pdf: output pdf files
#### **ngsadmix Folder**
* ngsadmix_n71north.sh: Shell script to run replicates of NGSadmix
* prep_for_deltaK.sh: Shell script to work with NGS output.
* Delta.R: R script to plot delta K
* plot_ngsadmix_BAWR.R: R function to plot NGSadmix output
#### **eems Folder**
* bawr_eems.nb.html: RMarkdown notebook for eems infile prep
* BAWR_67_pop_coords.csv: coordinates for northern region sites
* data: folder of files for eems. Created with markdown.
* param1.ini: example parameter file
* plot_eems.R: R code to plot eems output