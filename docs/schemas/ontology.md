# CIM = Common Information Model

## Overview

The ES-DOC eco-system is built upon emerging earth system informatics standards aimed at documenting earth system experiments, models, simulations and other artefacts.  The CIM (**Common Information Model**) is a nascent standard capturing a wide range of information relating to the earth system modelling process. The CIM is now being leveraged by a variety of international model intercomparison projects.

The canonical CIM schema consists of a set of **package scoped classes**, in which each class encapsulates a sets of properties.  Classes maybe organised heirarchically via a standard inheritance mechanism.   A subset of the CIM classes are marked as **documents** thereby becoming eligible for inclusion within the ES-DOC Archive.  

## Definitions

In practical terms the CIM schema is **defined declaratively** as a set of python modules.  Within each module are declared a set of class factory functions, each function returns a dictionary containing the metadata representing the class definition.   

In the **example below**, 2 functions, activity & numerical_experiment, represent classes within the CIM v2 schema.  It will be noted that the numerical_experiment class **inherits** from the activity class.  Furthermore the activity is **marked as a document**, thus numerical experiment documents are eligible for inclusion in the ES-DOC archive.

```
def activity():
    """Base class for activities.

    """
    return {
        'type': 'class',
        'base': None,
        'is_abstract': True,
        'is_document': True,
        'pstr': ('{}', ('canonical_name',)),
        'properties': [
            ('alternative_names', 'str', '0.N',
                "List of names by which the activity is also known."),
            ('canonical_name', 'str', '0.1',
                "Community defined identifier or name."),
            ('citations', 'linked_to(shared.citation)', '0.N',
                "Set of pertinent citations."),
            ('description', 'str', '0.1',
                "Description of what is to be done (or was done)."),
            ('duration', 'time.time_period', '0.1',
                "Time the activity was (or will be) active."),
            ('internal_name', 'str', '0.1',
                "A name used for internal purposes."),
            ('keywords', 'str', '0.1',
                "User defined keywords."),
            ('long_name', 'str', '0.1',
                "Longer version of activity name."),
            ('name', 'str', '1.1',
                "Short name or abbreviation."),
            ('responsible_parties', 'shared.responsibility', '0.N',
                "People or organisations responsible for activity."),
            ('previously_known_as', 'str', '0.N',
                "List of names by which the activity was formerly known."),
            ('rationale', 'str', '0.1',
                "Explanation of why this activity was carried out and/or what it was intended to achieve.")
        ]
    }

def numerical_experiment():
    """Defines a numerical experiment.

    """
    return {
        'type': 'class',
        'base': 'activity.activity',
        'is_abstract': False,
        'properties': [
            ('tier', 'int', '0.1',
                "Relative importance of experiment within a MIP."),
            ('related_experiments', 'linked_to(designing.numerical_experiment)', '0.N',
                "Other experiments which have defined relationships to this one."),
            ('governing_mips', 'linked_to(designing.project)', '0.N',
                "MIP(s) overseeing experimental design protocol."),
            ('related_mips', 'linked_to(designing.project)', '0.N',
                "MIP's that require this experiment."),
            ('required_period', 'linked_to(designing.temporal_constraint)', '1.1',
                "Constraint on start date and duration."),
            ('requirements', 'linked_to(designing.numerical_requirement)', '0.N',
                "Additional requirements that conformant simulations need to satisfy."),
            #FIXME: if objectives become standalone, the strings should become linked_to(designing.objective).
            ('related_objectives', 'str', '0.N',
                "Set of objective identifiers (which should appear within the related experiments)")
        ],
        'constraints': [
            ('cardinality', 'duration', '0.0'),
            ('cardinality', 'rationale', '1.1')
        ]
    }
```

## GitHub Repositories

- https://github.com/ES-DOC/esdoc-cim
- https://github.com/ES-DOC/esdoc-cim-v1-schema
- https://github.com/ES-DOC/esdoc-cim-v2-schema
