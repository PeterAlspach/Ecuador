---
title: Best practice for data
date: 02 February 2016
---

Each section in this document is divided into three.  The first references the over-riding PFR __policy__, the next outlines some __General principles__, and the final one gives some __specifics__ relating to particular instances. It should not be necessary to read the document in its entirety, but rather just go to the section (and link) of interest (e.g., managing data using Excel).

#Metadata collection and accessibility
##Policy
Relevant [policy](https://iplant.plantandfood.co.nz/project/datamgmt/Documents/PFR%20Data%20Management%20Policy%20based%20on%20Lincoln%20Hub%20Template.docx)

- __Management of research data__ Research data created by or held in trust by Plant & Food Research will be managed in accordance with relevant legislation, and the New Zealand Data and Information Management Principles.
- __Statement of ownership__ Unless otherwise agreed in a relevant contract with the employee and/or third-party, all research data created by Plant & Food Research employees in the course of their work is the property of Plant & Food Research, and remains the property of Plant & Food Research following cessation of employment.
- __Metadata will describe the research data__ An international, national or industry standard metadata schema will be used to describe the research data.
- __Confidentiality and ethical considerations of research data__ Plant & Food Research will endeavour to ensure that research data is used and made available according to the highest ethical and moral standards. Some data may need to be anonymised or aggregated, and some sensitive data may not be able to be released.
- __Public access to research data - Publicly funded research__ Where possible, publicly funded research will be made open for public access and re-use. However Plant & Food Research reserves the right to charge for data and its manipulation, or to recover costs relating to provision of access to data or its interpretation.
- __Exclusivity__ Unless required by contract, exclusive rights to re-use or publish research data should not be granted to commercial publishers or agents - rights to make the data openly available for re-use should be retained.
- __Public access to research data - Non-publicly funded research__ Where appropriate, and subject to contractual agreements with the funder, Plant & Food Research's preferred option is that non-publicly funded research will be made open for public access and re-use.
- __Licensing of data__ Plant & Food Research will endeavour to make its data publicly available in accordance with the New Zealand Government Open Access Licensing framework (NZGOAL).

##General principles
_This section is copied directly from Gareth's notes on [BAF and ACDM collaboration](https://github.com/PlantandFoodResearch/CollaborativeDataManagement/blob/master/doc/ACDM_BAF_Collaboration.md)_

- Suggestions on what metadata to collect and why
- Best and worst locations for storing metadata
- Consistency of metadata collection

##Specifics
- Excel spreadsheets
    - See the [Narrative Sheet](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md#narrative-sheet) and [Terms Sheet](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md#terms-sheet) sections of [Best practice use of spreadsheets for data storage](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md)
    
_The remainder of this section is copied directly from Gareth's notes on [BAF and ACDM collaboration](https://github.com/PlantandFoodResearch/CollaborativeDataManagement/blob/master/doc/ACDM_BAF_Collaboration.md)_

- Structuring metadata for analysis purposes
- Standardising variable names
    - e.g. cultivar naming conventions

#Software selection and data structure
##Policy
Relevant [policy](https://iplant.plantandfood.co.nz/project/datamgmt/Documents/PFR%20Data%20Management%20Policy%20based%20on%20Lincoln%20Hub%20Template.docx)

- __Requirement for data management plans__ All new research proposals will have an associated data management plan prepared that addresses (as a minimum) data capture, integrity, confidentiality, storage/retention, access, publishing and metadata. The data management plan will be actively maintained and reviewed during the research project.

##[General principles](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_data_storage.md)

##Specifics
- Trials primarily concerned with phenotypic data and different genotypes: Use [E-Brida](https://iplant.plantandfood.co.nz/project/010009) (contact [Ann Blackburne](mailto:ann.blackburne@plantandfood.co.nz)) and, perhaps, [kakapo](https://github.com/PlantandFoodResearch/kakapo) (contact [Lee O'Grady](mailto:lee.ogrady@plantandfood.co.nz))
- Tracking samples, particularly for sequencing, use Kea () (contact [mailto:Zane Gilmore](zane.gilmore@plantandfood.co.nz))
- Excel spreadsheets
    - See the [Data Sheet](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md#data-sheet), [Data checking](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md#data-checking) and [Notes for Excel Users](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md#ncbi-geo-submission-notes-for-excel-users) sections of [Best practice use of spreadsheets for data storage](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md)
- Guide for using Access
    - Access has merits in that it allows easy creation of forms for data input
    - It is not generally recommended as a place for long-term storage of data
    - In general, if a database is needed, it is better to use better software (see next section)
- [Guide for using relational databases](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_databases.md)

#File storage and sharing
##Policy
Relevant [policy](https://iplant.plantandfood.co.nz/project/datamgmt/Documents/PFR%20Data%20Management%20Policy%20based%20on%20Lincoln%20Hub%20Template.docx)

- __Acknowledgement of data sources__ Plant & Food Research staff reusing data collected by other scientists will discuss the appropriateness of reuse with, obtain approval from, and appropriately cite or acknowledge the source of the data in any related publication.
- __Storage of research data__ Research data of interest to future research, including data that substantiate research findings, will be documented and stored in a secure, and backed-up storage facility. Data used in publications will be stored such that it meets reasonable expectations for access and citation from publishers.
- __Transfer, retention and disposal of research data__ Transfer and disposal of research data must be in accordance with the Public Records Act 2005, and according to funder/contractual requirements and the Plant & Food Research's Retention & Disposal Schedule.
- __Collaboration Partners__ PFR will endeavour to share data, and data management infrastructure, tools, and expertise with collaborators where it is possible and of mutual benefit.

##General principles
_This section is copied directly from Gareth's notes on [BAF and ACDM collaboration](https://github.com/PlantandFoodResearch/CollaborativeDataManagement/blob/master/doc/ACDM_BAF_Collaboration.md)_

- Best and worst ways to store data
    - Experiment-vital document or disposable?
- Best and worst ways to share data
    - Collaborating or just sharing document?

##Specifics
- Excel spreadsheets
    - See the [Storage](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md#storage) and [Filename Conventions](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md#file-name-conventions) sections of    [Best practice use of spreadsheets for data storage](https://github.com/PlantandFoodResearch/BestPractices/blob/master/general/best_practices_excel_data_file.md)

_The remainder of this section is copied directly from Gareth's notes on [BAF and ACDM collaboration](https://github.com/PlantandFoodResearch/CollaborativeDataManagement/blob/master/doc/ACDM_BAF_Collaboration.md)_

- Usage guides for iPlant, GitHub etc.
    - Dependent on requirements (i.e. not all features required)
    - Ties into software selection
- Collaboration etiquette

#Biometrician involvement
_Does this really belong in this document?_

##Policy
- Define stage at which biometrician must be consulted 

##General
- Ways in which a biometrician can benefit a project
- Best time to consult biometrician
- Best way to share data with a biometrician

##Targetted
- Structuring data for sharing with biometrician
    - Ties into data structure and collaboration etiquette
- Possibly suggestions for, or suggested limitations of, self-analysis 

