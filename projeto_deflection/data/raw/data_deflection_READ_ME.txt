------------------ data_deflection_variables --------------------

>>> ID:
Bird identity

>>> first_attack:
Region where the first attack on the robocrab was deferred. 1 = claw, 0 = carapace.

>>> attack_position:
Position of the attack in relation to the robocrab. Example: frontal attack, back attack, lateral attack.

>>> species:
Name of the species that attacked.

>>> age:
Categorical age of the attacking species.

>>> treatment:
Robocrab's color treatment.
Treatment A = orange claw, black carapace.
Treatment B = black claw, black carapace.
Treatment C = orange claw, carapace with white and blue marks.
Treatment D = orange claw, black carapace, but without claws movement 

(Note: The treatment letter will be changed in the R script `02_C_raw-data`)

>>> place:
Location of the experiment.

>>> background:
Robocrab's background. Example: beige_cloth, mud_cloth.

>>> illuminant:
If the robocrab position was under direct sunlight or shade.

>>> Coord:
Coordinate of the location where the interaction event with the robocrab occurred.
The coordinate is obtained from a photo with location taken from the site.

>>> experiment:
Tells us if it's a pilot or definitive experiment.
This variable is used to filter using R.

>>> date:
Date of the event.
-------------------------------------------------------------
