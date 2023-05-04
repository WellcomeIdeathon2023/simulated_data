# README

## Data generation

For all challenges during the Ideathon you are permitted to generate your own datasets for the purposes of developing, testing, and demonstrating your prototype.
Simulated data should be generated as simple heuristics, for example draws from probability distributions.
For all simulated data you must include a data dictionary that defines all your variables and clearly justifies any choices in data generation.
Finally, your data generation process must be simple enough that datasets can be clearly and easily reproduced.

## Uploading and sharing simulated data

*Any* data generation scripts you create for use in your project must be shared with all other teams at the point of creation.
This should be done by uploading your data generation *script* (not the data directly) to this repository in the appropriate folder which will be in the format `health_challenge` (e.g. `mental_health`).
All scripts in this repository are licensed under [MIT](https://github.com/WellcomeIdeathon2023/simulated_data/blob/main/LICENSE) without exception.

You should name your script `challenge_TeamName_DatasetID` where:

* `challenge` is a one-word ID for your chosen challenge that can be found in the README of each challenge area folder, as well as in the respective challenge repositories
* `TeamName` is the name of your team in CamelCase
* `DatasetID` is a readable identifier for your dataset in CamelCase (e.g., if you were generating a dataset to predict if bears like sandwiches then you might call this "BearSandwichData")

If you make changes to your script you are free to overwrite this directly using GitHub's version control, or you could add a new version with a suffix to clearly differentiate versions, e.g. `TeamName_DatasetID_v2.5`

## Using other team's data

You may use data generated from another team's script providing this is cited as: "data used with thanks from `TeamName_DatasetID` (accessed YYYY-MM-DD)" (where `TeamName` and `DatasetID` are as above and YYYY-MM-DD is the date you accessed the script for generation).

## Using other team's data generation scripts

You cannot make changes to other team scripts directly but are free to either:

1. Make [Pull Requests](https://github.com/WellcomeIdeathon2023/simulated_data/pulls) that the team can merge or close; or
2. Create a new script based on another team's providing you have cited this as: "data generation process based on `TeamName_DatasetID` (accessed YYYY-MM-DD)" (where YYYY-MM-DD is the date you accessed the script for adaptation).

Please make use of [Issues](https://github.com/WellcomeIdeathon2023/simulated_data/issues) and [Discussions](https://github.com/WellcomeIdeathon2023/simulated_data/discussions) if you have questions about another team's dataset.


## Example

See [example_challenge_area/bears_TeamWellcome_BearSandwichData_v1.R](example_challenge_area/bears_TeamWellcome_BearSandwichData_v1.R) for an example of how we expect data generation scripts to look.
Note the mapping in the link above:

* `health_challenge_area` -> `example_challenge_area`
* `challenge` -> `bears`
* `TeamName` -> `TeamWellcome`
* `DatasetID` -> `BearSandwichData`
* Version -> `v1`
