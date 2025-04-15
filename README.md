PEA toolbox was developed to easily integrate LFP recorded from sensing-capable DBS (e.g., Percept  PC, Medtronic) and other simultaneously recorded electrophysiological data.

Requirements: Matlab and eeglab (https://sccn.ucsd.edu/eeglab/)
Input files: EEG file in eeglab format (*.set) and BrainSense file (*.json) exported from the Clinician tablet. 

How to align? (See the paper below for detailed descriptions of a switch-on-related spike)
Step 1. Click _**Set Parameters**_ button and select all input files. 
Step 2. Click _**Find EEG DBS Artifacts**_ to select the switch-on related spike prior to the electrical pulse stimulation onset in the EEG data. 
Step 3. Click _**Find Percept DBS Artifacts**_ to select the switch-on related spike in the LFP data. 
Step 4. Click _**Merge Data**_ to merge the EEG and LFP data.


Demo data is available at the following OSF repository:
https://osf.io/9u6v4/

Citation: 
Soh, C., Hervault, M., Rohl, A. H., Greenlee, J. D. W., & Wessel, J. R. (2025). Precisely-timed outpatient recordings of subcortical local field potentials from wireless streaming-capable deep-brain stimulators: a method and toolbox. Journal of Neuroscience Methods, 418, 110448. https://doi.org/https://doi.org/10.1016/j.jneumeth.2025.110448 ![image](https://github.com/user-attachments/assets/829dfd40-d9ef-4d5a-86f1-c276ad22d360)



