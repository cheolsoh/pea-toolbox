# **Powercycling method is NOT available following the necessary update for adaptive DBS (May/2025)**

After the update was pushed to the clinician tablet in May, 2025, toggling between DBS ON/OFF introduces a 7-second pause in recording. As Soh et al. (2025) was based on the DBS ON artifact that is included in that time window, this method cannot be used with the up-to-date clinician tablet. It might be still doable with the old tablet that hasn't been updated, which we haven't had a chance to test. However, we developed an alternative method that is as precise as the DBS ON/OFF method. If you are interested in aligning EEG/LFP data, please reach out to Cheol Soh (cheol-soh@uiowa.edu).

# **PEA (Percept-EEG-Alignment) toolbox**

Requirements: Matlab and eeglab (https://sccn.ucsd.edu/eeglab/) <br>

## How to run the PEA toolbox?

Step 1. Extract the PEA toolbox to a preferred location. <br>
Step 2. Run Matlab. <br>
Step 3. Load eeglab. <br>
Step 4. Set the Current Folder to where you extracted the PEA toolbox. <br>
Step 5. Type <i>PEA</i> on the MATLAB Command Window. <br>

## What does PEA tolbox do?
The PEA toolbox is a GUI-based tool that allows precise alignment of LFP data recorded using a sensing-capable DBS (e.g., Percept  PC, Medtronic) and concurrently recorded electrophysiological data, including scalp EEG.
This tool will automatically identify and present windows near a signal triggered by switching on the DBS (switch-on signal) the user then simply needs to point and click on the peak of the switch-on signal. Repeat this procedure in both EEG and LFP recordings. The PEA toolbox will then align both recordings based on the switch-on signal. When merging LFP with EEG data, event markers that are typically a part of the EEG dataset will be automatically transferred to the LFP data, allowing any type of event-related analyses with it.   

**The Switch-on Signal** (EEG signal: black line; LFP signal: magenta line)

![Screen Shot 2025-04-15 at 16 56 54 PM](https://github.com/user-attachments/assets/b2096a18-12e5-4835-bd0d-5ce86b282271)

The switch-on signal is defined as a transient spike triggered by the activation of DBS that is prior to the high-amplitude pulse stimulation artifact that persists until the DBS is deactivated. In scalp EEG data, it is typically found from frontocentral electrodes (e.g., Cz, FCz; default). 



## How to align? <br>
(See the paper below for detailed descriptions of a switch-on-related spike)<br>
Input files: EEG file in eeglab format (*.set) and BrainSense file (*.json) exported from the Clinician tablet. <br>

Step 1. Click _**Set Parameters**_ button and select all input files. 

Step 2. Click _**Find EEG DBS Artifacts**_ to select the switch-on related spike prior to the electrical pulse stimulation onset in the EEG data. 

Step 3. Click _**Find Percept DBS Artifacts**_ to select the switch-on related spike in the LFP data. 

Step 4. Click _**Merge Data**_ to merge the EEG and LFP data.



Demo data is available here: https://osf.io/9u6v4/


Please direct any questions to: cheol-soh@uiowa.edu


## Citation: 

Soh, C., Hervault, M., Rohl, A. H., Greenlee, J. D. W., & Wessel, J. R. (2025). Precisely-timed outpatient recordings of subcortical local field potentials from wireless streaming-capable deep-brain stimulators: a method and toolbox. Journal of Neuroscience Methods, 418, 110448. https://doi.org/https://doi.org/10.1016/j.jneumeth.2025.110448



