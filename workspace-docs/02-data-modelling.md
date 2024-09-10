## Data modelling of let ownership and management

The ownership and management of Short Term Lets can be a little complicated. It feels like there are three separate roles:
- The owner of the property (which may be some number of individuals or a company)
- The manager of the property (which may be some number of individuals or a company)
- The person registering the short term let (which may be a private individual or a staff member)

In the simplest case of an individual owner-operator, all three of these groups would be the same one person. This is likely where a beta would start, however:
- A person or company may own multiple properties (possibly up to hundreds)
- A person or company may manage multiple properties (possibly up to hundreds)
- Multiple people or staff members in a company may want to do administration of the same property

It feels likely that a "finished" service would need to handle the following use cases:
- Adding and removing accounts from a property/group of properties
- Adding and removing accounts from a company
- Transferring a property from one account/company to another account/company
