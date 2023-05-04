# README

## Data generation

For all challenges during the Ideathon you are permitted to generate your own datasets for the purposes of developing, testing, and demonstrating your prototype. 
Simulated data should be generated as simple heuristics, for example draws from probability distributions.
For all simulated data you must include a data dictionary that defines all your variables and clearly justifies any choices in data generation.
Finally, your data generation process must be simple enough that datasets can be clearly and easily reproduced.

## Uploading and sharing simulated data

*Any* data generation scripts you create for use in your project must be shared with all other teams at the point of creation.
This should be done by uploading your data generation *script* (not the data directly) to this repository in the appropriate folder which will be in the format `health_challenge/ideathon_challenge` (e.g. `mental_health/retention`).
All scripts in this repository are licensed under [MIT](https://github.com/WellcomeIdeathon2023/simulated_data/blob/main/LICENSE) without exception.

You should name your script `teamName_datasetID` where `teamName` is the name of your team in CamelCase, `datasetID` is a suitable identifier for your dataset in CamelCase.
If you make changes to your script you are free to overwrite this directly using GitHub's version control, or you could add a new version with a suffix to clearly differentiate versions, e.g. `TeamName_datasetID_v2.5`

## Using other team's data

You may use data generated from another team's script providing this is cited as: "data used with thanks from `teamName_datasetID` (accessed YYYY-MM-DD)" (where `teamName` and `datasetID` are replaced as appropriate and YYYY-MM-DD is the date you accessed the script for generation).

## Using other team's data generation scripts

You cannot make changes to other team scripts directly but are free to make a new script based on another team's providing you have cited this as: "data generation process based on `teamName_datasetID` (accessed YYYY-MM-DD)" (where `teamName` and `datasetID` are replaced as appropriate and YYYY-MM-DD is the date you accessed the script for adaptation).

## Example

See `test_challenge/test_challenge/teamWellcome_BearsLikeSandwiches_v1.R` for an example of how we expect data generation scripts to look.

