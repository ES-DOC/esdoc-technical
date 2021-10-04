# Specialisations by Project

## Overview

For scientists wishing to document their work in a **loosely structured** fashion, The ES-DOC project provides support for so-called specialisations.  On a project by project basis, groups of scientists can come together to declare a **hierarchy of topics** whereby each topic is associated with a fine-grained set of **questions**.  Each root topic is known as a specialisation.

## Definitions

As with the CIM, specialisations are declared by the community using a pythonic **domain specific language**.  From the definitions are forward engineered assets that are in turn leveraged by upstream tools & applications, e.g. the specialisations web viewer.

Each specialisation set consists of a so-called top-level topic plus a set of high-level topics.  The topics are declared within python modules as **structured dictionaries**.  

### Example

```
# --------------------------------------------------------------------
# SUB-PROCESS: sub_grid_scale_ice_distribution
# --------------------------------------------------------------------
DETAILS['sub_grid_scale_ice_distribution'] = {
    'description': 'Sub-grid scale ice distribution',
    'properties': [
        ('type', 'ENUM:sub_grid_scale_h2o_distribution_type', '1.1',
            'Sub-grid scale ice distribution type'),
        ('function_name', 'str', '1.1',
            'Sub-grid scale ice distribution function name'),
        ('function_order', 'int', '1.1',
            'Sub-grid scale ice distribution function type'),
        ('convection_coupling', 'ENUM:sub_grid_scale_h2o_distribution_convection', '1.N',
            'Sub-grid scale ice distribution coupling with convection'),
        ]
    }

ENUMERATIONS['sub_grid_scale_h2o_distribution_convection'] = {
    'description': 'Type(s) of convection that the formation of clouds is coupled with',
    'is_open': False,
    'members': [
        ('coupled with deep', None),
        ('coupled with shallow', None),
        ('not coupled with convection', None),
        ]
    }
```

### Example Notes

Above is defined a CMIP6 atmosphere specialisation: `sub_grid_scale_ice_distribution`.  The specialisation consists of a description plus a set of associated properties.  Each property is declared as a **4 member tuple**:

- **name**
    - lower case underscore property name
    - must be unique within the proeprty set
- **type**
    - property data type
    - valid values = bool | float | int | str | l-str | ENUM:enum_name
- **cardinality**
    - type of relationship to associated specialisation
    - valid values = 0.1 | 1.1 | 0.N | 1.N
- **description**
    - scientifically relevant description 

It will be noted that one of the properties, namely `convection_coupling`, is declared as an **enumeration** type.  This mechanism constrains a property to a pre-defined set of values.

## Identifiers

The ES-DOC tool chain parses specialisation defintiions.  Each specialisation is validated, once validated they are assigned a **unique identifier** thereby becoming eligible for use within the wider eco-system.  

The identifer is constructed as follows:

- {project}.{parent-topics}.{property}

For example:

- cmip6.atmos.cloud_scheme.sub_grid_scale_ice_distribution
