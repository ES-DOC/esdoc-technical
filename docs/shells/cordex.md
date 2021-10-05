# CORDEX Shell Application

The CORDEX shell is a command line interface for interacting specifically with the ES-DOC CORDEX documentation eco-system.  Once installed one can manage the full set of CORDEX documentation. 

## Installation

```
cd YOUR_WORKING_DIRECTORY
git clone https://github.com/ES-DOC/cordex.git
source cordex/activate
cordex-setup
```

Once installed it is recommended to add the following to your ~/.bashrc file:

```
source YOUR_WORKING_DIRECTORY/cordex/activate
```

## Commands

Activiating the cordex shell exposes a wide set of commands to streamline various operations.  Each command is documented below.

## Citations

**cordex-citations-init-xls**

Initialises set of citation spreadsheets from a template.  One spreadsheet per institute is created.

**cordex-citations-generate-json**

Generates citation JSON documents from populated spreadsheets.

## Institutes

**cordex-institutes-list**

Emits to command line name of all institutes participating in CORDEX.

**cordex-institutes-repos-add**

Iterates set of institutional repos & executes `git add*` so as to commit any new files.

**cordex-institutes-repos-clean**

Ensures that all institutional repos have been correctly setup for CORDEX.

**cordex-institutes-repos-create**

Clones any new CORDEX institutional repos.

**cordex-institutes-repos-init-gitignore**

Iterates set of institutional repos & initialises associated `.gitignore` file.

**cordex-institutes-repos-pull**

Iterates set of institutional repos & pulls latest changes.

**cordex-institutes-repos-push**

Iterates set of institutional repos & pushes local changes where applicable.

**cordex-institutes-repos-reclone**

Navigates to an institutional repo & reclones it.

**cordex-institutes-repos-status**

Iterates set of institutional repos & emits to command line each repo's git status.

**cordex-institutes-repos-verify**

Iterates set of institutional repos & verifies that expected CORDEX assets are in place.

## Models

**cordex-models-archive-cim-documents**

Moves generated model CIM documents into ES-DOC archive for upstream processing.

**cordex-models-generate-cim**

Parses set of JSON files generated from spreadsheets & generates a set of CIM files.

**cordex-models-generate-json**

Parses set of model spreadsheets & generates a set of JSON files.

**cordex-models-generate-xls**

Parses CORDEX model specialisations, plus generated model JSON files, and regenerates the relevant model spreadsheets.  Executed when specialisations have changed.

## Parties

**cordex-parties-init-xls**

Initialises set of responsible party spreadsheets from a template.  One spreadsheet per institute is created.

**cordex-parties-generate-json**

Generates responsible party JSON documents from populated spreadsheets.

## Specializations

**cordex-specializations-generate**

Iterates set of specialisation repos and generates derived assets such as mindmaps & configuration files.

**cordex-specializations-repos-pull**

Iterates set of specialisation repos & pulls latest changes.

**cordex-specializations-repos-push**

Iterates set of specialisation repos & pushes local changes where applicable.

**cordex-specializations-repos-status**

Iterates set of specialisation repos & emits to command line each repo's git status.

**cordex-specializations-sync-cim-profile**

Iterates set of specialisation repos & synchronizes so-called associated CIM profile.

**cordex-specializations-sync-definitions**

Iterates set of specialisation repos & synchronizes definitions with those in the pyesdoc library.

**cordex-specializations-sync-tooling**

Iterates set of specialisation repos & synchronizes repo tooling.

**cordex-specializations-validate**

Iterates set of specialisations & emits a validation report for each one.
