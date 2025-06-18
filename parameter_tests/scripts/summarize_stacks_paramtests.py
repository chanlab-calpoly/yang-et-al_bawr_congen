#!/usr/bin/env python
# coding: utf-8

# ## Clean Version
# 
# This is a clean version of a Python3 script to get data from log.distrib files after the parameter testing in Stacks. 

# In[56]:


import os
import re


# ### Functions
# 
# • The `ref_section_in_file` function takes the file and looks for the appropriate section as indicated by BEGIN and END and returns the start and end line numbers.
# 
# • The `getparams` function pulls the parameter variables from m, M, and N from the filename. If the naming convention of the outfiles changes, this function needs to be altered.
# 
# • `param_and_lines`: files and lines of interested are passed to this function. It pulls the parameters from the header by calling `getparams` and then pulls the data from the file. Need to have readpath and filename passed separately because of the way that getparams parses the filename. This could be changed in the future.
# 
# • `summarize_runs`: This is the function to be called. Takes the path to the folder with files of interest, the section to parse out, and the output filename. There are defaults on **section** and **outfile**.

# In[57]:


def ref_section_in_file(filename, section):
    linenumber=0
    with open(filename, 'r') as read_file:
        for line in read_file:
            linenumber += 1
            if line.startswith("BEGIN " + section):
                beginline = linenumber
            if line.startswith("END " + section):
                endline = linenumber
    return[beginline,endline]


# In[58]:


def getparams(filename):
    filenameListSplit = filename.split("_")
    reSplit = re.split("m|M|N", filenameListSplit[0])
    m=reSplit[1]
    M=reSplit[2]
    N=reSplit[3]
    return[m,M,N]


# In[59]:


def param_and_lines(readpath, filename, lines):  #need to send path and filename because of getparams
    params = getparams(filename)
    params = '\t'.join(params)
    x = range(lines[0]+3, lines[1]) #lines we need
    linenumber=0
    mylines=[]
    thefile = readpath + '/' + filename
    with open(thefile, 'r') as read_file:
        for line in read_file:
            linenumber += 1
            if linenumber in x:
                linetowrite='\t'.join([params,line])
                mylines.append(linetowrite)
    return[mylines]


# In[60]:


def summarize_runs(readpath, section = 'snps_per_loc_postfilters', outfile = 'output.txt'):
    filenameList = os.listdir(readpath)
    newFile = open(outfile, "w")
    newFile.write("m\tM\tN\tn_snps\tn_loci\n")
    for filename in filenameList:
        if filename.startswith('.'):
            continue
        else:
            pass
        filepath = readpath + "/" + filename
        refs = ref_section_in_file(filepath, section)
        datout = param_and_lines(readpath, filename ,refs)
        newFile.writelines(datout[0])
    newFile.close()


# ## Example runs

# In[61]:


#summarize_runs("Test")


# In[62]:


#summarize_runs("PTWR_logs", 'snps_per_loc_postfilters', 'ptwr_outfile.txt')


# In[66]:


#summarize_runs("BAWR_paramtest_logs/", outfile="bawr_outfile.txt")

