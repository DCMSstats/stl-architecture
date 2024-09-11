# Geographically identifying units
Date: 2024-09-11

## Status

In Progress

## Context

One of our riskiest assumptions in this alpha is "We assume that we will be able to technically capture all types of STL (e.g. using unique geographic location)". It is important for us to capture geographic location of short-term lets:
1. To be able to determine the number of short-term lets in an area
2. To help us ensure that short term lets are not double counted and improve data quality (although a registration fee would likely discourage double registration)
3. To determine if a registration number matches a particular short-term let

Unlike other types of rental property in England, short-term lets do not match uniquely to UPRNs or addresses:
- Parts of a property let separately (e.g. individual rooms or a basement and an outhouse)
- Yurts let separately in a single field at one address

It is also important that whatever method we choose can be used with an offline journey.

## Options

### Text description

Operators provide a text description of whatever section of an address is part of the short-term let.

### GPS coordinates

Operators coordinates of the location of the short-term let.

## Recommendation

