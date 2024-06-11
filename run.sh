#!/bin/bash

eval "$(conda shell.bash hook)"
conda activate ipcc_ch6f8

# get the source png from IPCC
# wget https://www.ipcc.ch/report/ar6/wg1/downloads/figures/IPCC_AR6_WGI_Figure_6_8.png

DIR=Chapter-6_Fig8

# Apply changes to produce figure of $DIR

echo Patching $DIR
cd $DIR

patch < ../${DIR}.patch

# run the code
python Fig6.8_trend_plot_AOD_rolling_10change_volcanic_mask.py

# move the figure
mv AOD_trend.png ../IPCC_AR6_WGI_Figure_6_8_repro.png

# Remove the changes
git checkout Fig6.8_trend_plot_AOD_rolling_10change_volcanic_mask.py