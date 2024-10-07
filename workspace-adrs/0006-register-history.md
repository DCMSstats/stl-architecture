# 6. Register history

Date: 2024-10-07

## Status

Draft

## Context

We have identified some use cases for being able to know historic values of data. 
- Protection from tampering
- Able to review historical data (e.g. previous names)
- Assurance
- Reducing fraud

## Options 

### Don't do anything

We're not currently looking for this data to be used as evidence, so we could accept the risk. If the remit of the service changed, we would miss out on any historical data from the beginning of the scheme.

### Store all changes as an audit log

This would quickly lead to a very large amount of data, with millions of datapoints after a year. Data changed at renewal would contain many different updates to store. This would create an unwieldy dataset. 

#### Store audit log changes on a separate platform

By storing the audit log on a separate platform, we can "lock down" access to the audit log, making easier to prevent deletions and tampering, and use a platform that's more appropriate for searching the volume of data. 

- PII
- Can't make single transaction

### Store historical logs for particular fields

There are probably a limited number of fields in which we are interested in historical data (e.g. name), as such we should minimise the data we store by only storing history on required fields. This would mean we store less data and make that data more usable (e.g. making it easier to serve a previous names component). 

### Use an append only database

Briefly summarising [_Building on the steel thread_ from the Digital Service Platforms team in 2015](https://gds.blog.gov.uk/2015/07/24/building-on-the-steel-thread/#a-system-of-record:~:text=the%20bridge%20itself.-,A%20system%20of%20record,-Licence%3A%20Creative), don't just keep a database, store a system of record, storing the data as it changes and updates. A single record will have multiple entries, recording the new value as time passes. Any view shows the most recent entry, but can also show a history.

![Two post-it notes. The first one is labeled "A register" and shows a list of enteies with ID numbers. Two of the entries have the same ID number and are marked V1 and V2. This post-it is labeled "Tamper proof sequence of immutable entries". The second post-it is labelled "A record" and shows the information for the entries with ID number 1234, and the history containing V1 and V2. The second post-it is labeled "Sequence of entries sharing an identifier"](https://gds.blog.gov.uk/wp-content/uploads/sites/60/2015/10/22052011555_a491f29854_z.jpg)

The entries in the database are completely immutable with updates to the data being made through adding additional entries with new version numbers. The integrity of the database is preserved with cryptographic hashes. One example of this would be using [Merkle Trees](https://en.wikipedia.org/wiki/Merkle_tree) as used by the GDS registers project. The aim of this is to increase confidence in the register from the public, that data has not been tampered with. It does not ensure that the data itself is entered correctly. 

This would be a substantial time investment, but would provide a strong level of confidence in the register. 

## Decision

## Consequences

If we store history, we will need to define a sensible retention policy.
