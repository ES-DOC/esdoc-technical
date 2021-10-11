# CDF2CIM Archive

## Overview

The [cdf2cim-archive](https://github.com/ES-DOC/esdoc-cdf2cim-archive) hosts a collection of JSON files extracted from NetCDF files.  The file extraction process is an extension of the esgf-publisher.  By running the publisher with the appropriate flag a directory scan is performed and for each NetCDF file a cdf2cim JSON file is created.  The JSON file is given a unique identifier based upon a hash of it's contents. 

## Directory Layout

Each JSON file is associated with a project, model & experiment.  Thus the archive's directory structure reflects the following organisational principle:

```
ROOT
  |--> data
         |--> project
                |--> institute
                       |--> experiment
```

## Extracted JSON files

### Filename

The name of each file is derived from a hash of it's contents.  Only a subset of file fields are included in the hash derivation.  For example:

```
{hash_of_content_subset}.json
```

### Content

Here is an example file for CMIP6, it's hash identifier is stored as the `_hash_id` field:

```
{
    "_hash_id": "0a67f9cf0b7e2f5f4fe89d8401197975", 
    "activity_id": [
        "HighResMIP"
    ], 
    "branch_time_in_child": "2021-01-01T00:00:00Z", 
    "branch_time_in_parent": "1950-01-01T00:00:00Z", 
    "calendar": "standard", 
    "dataset_versions": [
        "v20170825"
    ], 
    "end_time": "2031-01-01T00:00:00Z", 
    "experiment_id": "control-1950", 
    "filenames": [
        "/mnt/lustre02/work/ik1017/CMIP6/data/CMIP6/HighResMIP/AWI/AWI-CM-1-1-LR/control-1950/r1i1p1f2/Omon/sos/gn/v20170825/sos_Omon_AWI-CM-1-1-LR_control-1950_r1i1p1f2_gn_202101-203012.nc"
    ], 
    "forcing_index": 2, 
    "further_info_url": "https://furtherinfo.es-doc.org/CMIP6.AWI.AWI-CM-1-1-LR.control-1950.none.r1i1p1f2", 
    "initialization_index": 1, 
    "institution_id": "AWI", 
    "mip_era": "CMIP6", 
    "parent_forcing_index": 2, 
    "parent_initialization_index": 1, 
    "parent_physics_index": 1, 
    "parent_realization_index": 1, 
    "physics_index": 1, 
    "realization_index": 1, 
    "source_id": "AWI-CM-1-1-LR", 
    "start_time": "2021-01-01T00:00:00Z", 
    "sub_experiment_id": "none"
}
```

### Compression

The actual archived documents hosted upon GitHub are stored in a compressed format.  CLI commands (see below) can be used to compress/uncompress.

## Environment Variable

Once installed via a simple `git clone` command, the following environment variable should be assigned:

```
cd INSTALL_DIR
export CDF2CIM_ARCHIVE_HOME=$(pwd)
```

**TIP**: assign this environment variable in the user's `~.bashrc` file.

## Command Line Interface

The archive supports a command line interface to streamline operations.

### Activation

Place the following in one's `~/.bashrc` file:

```
source INSTALL_DIR/sh/activate
```

### Commands

**cdf2cim-archive-compress**

Compresses set of documents within `INSTALL_DIR/data` folder.  The compressed documents are written in 50MB chunks and named as follows:  `INSTALL_DIR/blobs_xx`.

**cdf2cim-archive-uncompress**

Uncompresses set of previously compressed documents named `INSTALL_DIR/blobs_xx`.  The uncompressed documents are written to:  `INSTALL_DIR/data`.
