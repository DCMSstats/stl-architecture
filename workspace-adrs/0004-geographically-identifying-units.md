# Geographically identifying units
Date: 2024-09-11

## Status

In Progress

## Context

One of our riskiest assumptions in this alpha is "We assume that we will be able to technically capture all types of STL (e.g. using unique geographic location)". It is important for us to capture geographic location of short-term lets:
1. To be able to determine the number of short-term lets in an area (all of these options will be combined with an address, so we won't consider this too heavily in this ADR)
2. To help us ensure that short term lets are not double counted and improve data quality (although the registration fee would likely discourage double registration)
3. To determine if a registration number matches a particular short-term let

Unlike other types of rental property in England, short-term lets do not match uniquely to UPRNs or addresses:
- Parts of a property let separately (e.g. individual rooms or a basement and an outhouse)
- Yurts let separately in a single field at one address

It is also important that whatever method we choose can be used with an offline journey, and without JavaScript in the online journey.

Short-term lets that occupy all of an address would not be required to supply more detail. Short-term lets that do not occupy all of an address but are the only short-term let on site would probably not be required to supply more detail. 

## Options

Options to be evaluated on:
1. How easy it is to use the data to de-duplicate registrations?
2. How easy it is to use the data to find a short-term let?
3. How easy it is to use the data to determine if a registration matches a particular short-term let at an address?
4. How easy it is to for the operator to provide?
5. How easy it is to for the operator to provide without JavaScript?
6. How easy it is to for the operator to provide offline?
7. How easy it is to for the operator to provide for multiple properties?


### Text description

Operators provide a text description of whatever section of an address is part of the short-term let.

1. How easy it is to use the data to de-duplicate registrations?
   - Difficult. Depending on the guidance, the description provided might be vague, or change over time (the marketing name of a yurt) 
2. How easy it is to use the data to find a short-term let?
   - Difficult. Depending on the guidance, the description provided might be vague, or change over time (the marketing name of a yurt) 
3. How easy it is to use the data to determine if a registration matches a particular short-term let at an address?
   - Difficult. Depending on the guidance, the description provided might be vague, or change over time (the marketing name of a yurt) 
4. How easy it is to for the operator to provide?
   - Easy. 
5. How easy it is to for the operator to provide without JavaScript?
   - Easy. 
6. How easy it is to for the operator to provide offline?
   - Easy. 
7. How easy it is to for the operator to provide for multiple properties?
   - Easy. 


### GPS coordinates

Operators coordinates of the location of the short-term let. Could be Ordnance Survey Eastings and Northings.

1. How easy it is to use the data to de-duplicate registrations?
   - Not easy, it would be hard to balance what GPS coordinates are the close enough to be called the same without also de-deduplicating legitimately different lets. 
2. How easy it is to use the data to find a short-term let?
   - Easy for working across large areas like a field, but difficult/impossible across smaller areas like rooms in a house, particularly where one short-term let is directly above another.
3. How easy it is to use the data to determine if a registration matches a particular short-term let at an address?
   - Easy for working across large areas like a field, but difficult/impossible across smaller areas like rooms in a house, particularly where one short-term let is directly above another.
4. How easy it is to for the operator to provide?
   - Easy. An operator can pick a location on a map.
5. How easy it is to for the operator to provide without JavaScript?
   - Difficult, operator needs to find coordinates to input directly.
6. How easy it is to for the operator to provide offline?
   - Difficult, operator needs to find coordinates to input directly.
7. How easy it is to for the operator to provide for multiple properties?
   - Not too difficult, but does require knowledge of the individual let.

### Drawn Sections

Operators draw the boundaries of the short-term let on a map.

### 

## Recommendation

