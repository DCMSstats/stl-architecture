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

## Options

Options to be evaluated on how easy it is to:
1. use the data to de-duplicate registrations?
2. use the data to find a short-term let?
3. use the data to determine if a registration matches a particular short-term let at an address?
4. for the operator to provide?
5. for the operator to provide without JavaScript?
6. for the operator to provide offline?
7. for the operator to provide for multiple properties?


### Text description

Operators provide a text description of whatever section of an address is part of the short-term let.

### GPS coordinates

Operators coordinates of the location of the short-term let. Could be Ordnance Survey Eastings and Northings.

### Drawn Sections

Operators draw the boundaries of the short-term let on a map.

### 

## Recommendation

