# 2. Hosting Alpha Prototype

Date: 2024-07-16

## Status

Accepted

## Context

Over the course of this project, we will require a prototype for user research. Participants will need to access the prototype over the internet. The prototype requires some backend compute so cannot be hosted as a static site. 

In an ideal world, we would host this on existing DCMS infrastructure, such as using Cloud Run in GCP. This is not an option.

## Options

### Supplier Prototyping AWS Account

The supplier uses one of their existing AWS accounts to host the prototype. This muddies the water on ownership of the prototype after the end of the project, but does have the benefit of existing controls on the account. 

### New Heroku Account

We create a new Heroku account and team for the prototype, that exists for the duration of the project. The main drawback is that we create an IT asset owned by DCMS without many controls.

## Decision

We're going to use Heroku as this leaves the most control in the hands of DCMS and the risk level of this asset is very low. 

## Consequences

At the end of the alpha stage, DCMS will need to find a new hosting solution if they still want the prototype to be hosted.
