# opg

 OPG System as presented in "Retainer-Free Optopalatographic Device Design and Evaluation as a Feedback Tool in Post-Stroke Speech and Swallowing Therapy" (accessible via: https://core.ac.uk/works/150354677)
The system consists of three parts:

- the intraoral sensor
- the receiver, which is integrated into the cable between sensor and control unit
- the core control unit

The firmware for the control unit can be found under:
https://github.com/Chris-J-Wagner/opg_receiver

The design was done with Altium, so it is not directly open source (unfortunately), but the gerber files are 
included. It relies on several custom part pcb/sch libraries (``CustomPartLibrary`` folder), which is included in this repository.
When opening the design. the paths in the project structure have to be updated to where ``CustomPartLibrary`` is located.

