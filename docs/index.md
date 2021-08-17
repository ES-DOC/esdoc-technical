# ES-DOC Technical Documentation

Welcome to the ES-DOC technical documentation.  This site targets developers & other interested parties interested in getting upto speed with the technical side of the ES-DOC project.  All facets of the diverse ES-DOC technical landscape are documented in medium to low level detail.  If after reviewing the documentation you still have questions then please contact <technical@es-doc.org>.  

## Overview

The ES-DOC technical eco-system revolves around the standardisation of documentation & associated controlled vocabularies.  A dedicated ontology known as the CIM allows the climatological community to describe artefacts such as experiments, models, simulations, datasets, citations ... etc, in a standardised fashion.  The CIM is augmented by controlled vocabularies and so-called specialisations as & where appropriate.  Whereas vocabularies serve to constrain terms referred to by documents, specialisations allow the subject matter of documents to be captured in a narrative form by scientists outside of the constraints of the CIM.  

Both the CIM & project specific specialisations are defined in a simplifed fashion using python dictionaries.  From the definitions upstream artefacts are forward engineered to form the basis of a library known as `pyesdoc`.   The vocabularies are also defined in a simplified fashion using python dictionaries and form the basis of a libary known as `pyessv`.  Taken together, the pyessv & pyesdoc libraries form the core of the ES-DOC eco-system.
