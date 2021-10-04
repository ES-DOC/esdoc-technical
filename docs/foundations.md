## Overview

The ES-DOC eco-system of tools and services are founded upon 3 pillars:  

- A set of controlled vocabularies
- A common ontology
- A set of specialisations

Each pillar is associated with a library, tools, applications and/or web-services.  Collectively they form the foundations of the ES-DOC project.

## Controlled Vocabularies

The ES-DOC eco-system revolves around **controlled vocabularies**, i.e. scoped collections of terms mandated by vocabulary authorities.  Such authorities include ES-DOC, WCRP, ECMWF, Corpernicus ... etc.  An example term would be **piControl**, which is a member of the WCRP CMIP6 Experiments collection.

Processing vocabularies from a diverse set of sources is problematic.  To address this issue the ES-DOC team created a special purpose utility library called **pyessv** (**P**ython **E**arth **S**cience **S**tandard **V**ocabularies).  The primary task of pyessv is to **normalise** vocabularies and expose them to upstream tools & applications.  

## Ontology

Climatological scientists wishing to document their work in a **highly-structured** manner can leverage a special-purpose ontology, i.e. a **formalised** data model, called the **CIM** (Common Information Model).  

Currently at version 2.1, the CIM has evolved over time based upon community feedback for the express purpose of documenting climatology experiments, simulation & models.   The underlying schema is governed via a light-weight process that permits the ontology to evolve whilst still ensuring that associated tools & services are kept in sync.

The CIM schema is defined declaratively via a pythonic **domain specific language**.  From the schema are forward engineered a wide range of assets such as mind-maps, code, documentation ... etc.  Such assets are used by upstream tools & applications, e.g. online documentation search engine.

## Specialisations

For scientists wishing to document their work in a **loosely structured** fashion, The ES-DOC project provides support for so-called specialisations.  On a project by project basis, groups of scientists can come together to declare a **hierarchy of topics** whereby each topic is associated with a fine-grained set of **questions**.  

As with the CIM, specialisations are declared by the community using a pythonic **domain specific language**.  From the definitions are forward engineered assets that are in turn leveraged by upstream tools & applications, e.g. the specialisations web viewer.
