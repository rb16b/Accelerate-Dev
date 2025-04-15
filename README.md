# Accelerate-Dev

## Contents

- [Contents](#contents)
- [Intro](#intro)
- [Getting started](#getting-started)
- [Components and Architecture](#components-and-architecture)
- [Features and Known limitations](#features-and-known-limitations)
- [Related links](#related-links)

## Intro

This is an addition to Accelerate Application Delivery Workshop.
Users will have a chance to try: 
     Vertical Auto Scaller for assessing Deplyment resurces levels
     Horizontal Auto Scaller 
     Pod Distributon Budget
     Netwrok Policy

Vertical Auto Scaller requires VPA opertor to be installed, which was done for this cluster.


## Getting Started with the vpa exercise

oc login to cluster with user id assigned to you
Use dev-userX project for this exercise
oc project dev-userX ( dev-user1 for user1 )
oc apply -f vpa.yaml 

Next using rest-heroes Route url open it in the browser like this - http://rest-fights-dev-user1.apps.cluster-lzxlf.lzxlf.sandbox1417.opentlc.com/q/swagger-ui/
Make Sure to add q/swagger-ui/ at the end.

Run some of the APIs mutiple times.

After run $oc describe vpa rest-fights-vpa

Look for the recomdation value for CPU and Memory

Also refer to the [FAQ](./docs/faq.md) for more.

## Components and Architecture

The Vertical Pod Autoscaler consists of three parts. The recommender, updater and admission-controller. Read more about them on the [components](./docs/components.md) page.

## Features and Known limitations
