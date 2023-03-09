# Filter Last X Days
MoveApps

Github repository: *github.com/movestore/Filter-last-x-days*

## Description
Takes an end timestamp (default NOW) and filters to all locations in the past X time units.

## Documentation
This App filters locations from a Movement data set to a time range that is defined by an end timestamp and time duration (number and unit) given by the user. Locations of all animals are considered.

### Input data
moveStack in Movebank format

### Output data
moveStack in Movebank format

### Artefacts
none

### Settings 
**Reference timestamp (`time_now`):** reference/end timestamp towards which the data selection is performed. Generally (and by default) this is NOW, especially if in the field and looking for one or the other animal. When analysing older data sets, this parameter can be set to other timestamps so that the to be plotted data fall into a selected back-time window. 

**Duration of data to select (`dur`):** Duration number of the data to be selected. Unit below. Default 14.

**Time duration unit (`dur_unit`):** Duration unit for variable `dur`. Can be `hours`, `days` or `weeks`. Default `days`.


### Null or error handling:
**Setting `time_now`:** If this parameter is left empty (NULL) the reference time is set to NOW. The present timestamp is extracted in UTC from the MoveApps server system.

**Setting `dur`:** Duration NULL defaults to 14 (days).

**Setting `dur_unit`:** Duration defaults to `days`. Only regular time units can be used (see above).

**Data:** If none of the locations in the input data set lie in the requested time range, a warning is given and a NULL data set is returned. The NULL return value likely produces an error.
