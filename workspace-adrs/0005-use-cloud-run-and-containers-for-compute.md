# 5. Use Cloud Run and Containers for compute

Date: 2024-09-30

## Status

Accepted

## Context

It is probable that the service will need to change cloud provider at some point in its live, possibly relatively soon. The service will also experience large fluctuations in load. 

## Decision

Build the service in containers, using Docker. This will allow us to move the service more easily to a different cloud provider when required and minimise the complexity of the service. 

Use Cloud Run to run the containers. This will allow us to build a service that scales with demand and is a simpler service to manage than Google Kubernetes Engine.

## Consequences

