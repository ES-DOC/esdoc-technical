# CMIP6 Shell Application

The CMIP6 shell is a command line interface for interacting specifically with the ES-DOC CMIP6 documentation eco-system.  Once installed one can manage the full set of CMIP6 documentation. 

## Installation

```
cd YOUR_WORKING_DIRECTORY
git clone https://github.com/ES-DOC/cmip6.git
source cmip6/activate
cmip6-setup
```

Once installed it is recommended to add the following to your ~/.bashrc file:

```
source YOUR_WORKING_DIRECTORY/cmip6/activate
```

## Commands

Activiating the cmip6 shell exposes a wide set of commands to streamline various operations.  Each command is documented below.

## Citations

**cmip6-citations-init-xls**

Initialises set of citation spreadsheets from a template.  One spreadsheet per institute is created.

**cmip6-citations-generate-json**

Generates citation JSON documents from populated spreadsheets.

## Experiments

**cmip6-experiments-archive-cim-documents**

Moves generated experiment CIM documents into ES-DOC archive for upstream processing.

**cmip6-experiments-write-cim-documents**

Parses spreadsheet & generates CIM documents.  Documents are moved into `repos/libs/esdoc-docs`.

**cmip6-experiments-write-config**

Parses CIM documents & generates a condensed JSON file suitable for configuration purposes.  Generated file is moved into `repos/libs/esdoc-docs`.

**cmip6-experiments-write-d3**

Parses CIM documents & generates a condensed JSON file suitable for use within a D3.js application.  Generated file is moved into `repos/libs/esdoc-docs`.

**cmip6-experiments-reset**

Composite command that regenerates CIM documents & associated files.

## Institutes

**cmip6-institutes-list**

Emits to command line name of all institutes participating in CMIP6.

**cmip6-institutes-repos-clean**

Ensures that all institutional repos have been correctly setup for CMIP6.

**cmip6-institutes-repos-pull**

Iterates set of institutional repos & pulls latest changes.

**cmip6-institutes-repos-push**

Iterates set of institutional repos & pushes local changes where applicable.

**cmip6-institutes-repos-status**

Iterates set of institutional repos & emits to command line each repo's git status.

**cmip6-institutes-repos-sync**

Iterates set of institutions & if necessary clones remote repository.

**cmip6-institutes-repos-verify**

Iterates set of institutional repos & verifies that expected CMIP6 assets are in place.

**cmip6-institutes-teams-sync**

Iterates set of institutional repos & emits to command line each repo's git status.

## Models

**cmip6-models-archive-cim-documents**

Moves generated model CIM documents into ES-DOC archive for upstream processing.

**cmip6-models-archive-cim-documents-of-mohc**

Moves generated model MOHC CIM documents into ES-DOC archive for upstream processing.

**cmip6-models-generate-cim**

Parses set of JSON files generated from spreadsheets & generates a set of CIM files.

**cmip6-models-generate-comparator-json**

Parses set of JSON files generated from spreadsheets & generates a JSON file for use by upstream model comparator.

**cmip6-models-generate-json**

Parses set of model spreadsheets & generates a set of JSON files.

**cmip6-models-generate-pdf**

Parses set of model CIM files & generates a set of PDF files.

**cmip6-models-generate-xls**

Parses CMIP6 model specialisations, plus generated model JSON files, and regenerates the relevant model spreadsheets.  Executed when specialisations have changed.

**cmip6-models-init-cmip5-docs**

Initialises set of CMIP5 model documents to be used as seeds for CMIP6 documentation.

**cmip6-models-init-json-from-cmip5**

Initialises set of JSON configuration documents from CMIP5 documentation.

**cmip6-models-init-settings**

Initialises `model_publication.json` & `initialization_from_CMIP5.json` file used by an institution to control seeding & publication.

**cmip6-models-init-coupling-xls**

Generates a set of XLS files to capture coupling information.

**cmip6-models-reset-cim**

Deletes previously generated CIM files in readiness for regeneration.

**cmip6-models-reset-json**

Deletes previously generated JSON files in readiness for regeneration.

## Parties

**cmip6-parties-init-xls**

Initialises set of responsible party spreadsheets from a template.  One spreadsheet per institute is created.

**cmip6-parties-generate-json**

Generates responsible party JSON documents from populated spreadsheets.

## Specializations

**cmip6-specializations-generate**

Iterates set of specialisation repos and generates derived assets such as mindmaps & configuration files.

**cmip6-specializations-repos-pull**

Iterates set of specialisation repos & pulls latest changes.

**cmip6-specializations-repos-push**

Iterates set of specialisation repos & pushes local changes where applicable.

**cmip6-specializations-repos-status**

Iterates set of specialisation repos & emits to command line each repo's git status.

**cmip6-specializations-sync-cim-profile**

Iterates set of specialisation repos & synchronizes so-called associated CIM profile.

**cmip6-specializations-sync-definitions**

Iterates set of specialisation repos & synchronizes definitions with those in the pyesdoc library.

**cmip6-specializations-sync-mappings**

Moves CMIP5 document mappings into position ready for seeding.

**cmip6-specializations-sync-templates**

Iterates set of specialisation repos & synchronizes repo templates.

**cmip6-specializations-sync-tooling**

Iterates set of specialisation repos & synchronizes repo tooling.

**cmip6-specializations-sync-viewer**

Iterates set of specialisation repos & synchronizes assets used by specialisations viewer.

**cmip6-specializations-validate**

Iterates set of specialisations & emits a validation report for each one.

## Vocabularies

**cmip6-vocabs-write-bash-vars**

Emits a bash file containing CMIP6 controlled vocabularis pulled from pyessv.

## Machines & Performances

**cmip6-machines-init-xls**

Initialises set of machine & performs spreadsheets from a template.  
