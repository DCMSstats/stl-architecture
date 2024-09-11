# Register Adapter
Date: 2024-09-10

## Status

Proposed

## Context

It feels very likely at some point that this component will be required, when more applications are trying to access the register. This ADR is only about whether this component is required immediately, when there is only a single monolithic application accessing it.

## Options

### Register Adapter Component (separate deployable)

Pros:
- Future proofing for when multiple deployables want to access the register
- Able to deploy register adapter in private network, provides another layer of safety for attacks to navigate
- Provides an extra level of control around the register
Cons:
- Leads to lockstep development/deployments which can lead to substantial increases in development time
- Adds an extra network hop which can increase the complexity of running the service

### Register Adapter Module (module as part of monlith)
Effectively just a lightweight version of the separate deployable, offering less of the benefits and less of the disadvantages. It requires a fair amount of discipline to complete this perfectly.

## Recommendation

It is an established pattern to take a module and extract it into a separate deployable. In this case, in order to get the service live as quickly as possible, the register adapter should probably start as a module (maybe following the [ports and adapters pattern](https://8thlight.com/insights/a-color-coded-guide-to-ports-and-adapters)) to benefit from the speed and simplicity while the service is new, and extract the component when it is necessary.
