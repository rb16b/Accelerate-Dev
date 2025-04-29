# Accelerate-Dev

## Contents

- [Intro](#intro)
- [Getting started](#getting-started)
- [Pod Budget Distribution Excercisce](#components-and-architecture)
- [Horizontal Pod Scaler Exercise](#features-and-known-limitations)
- [Network Policy](#related-links)

## Intro

This is an addition to Accelerate Application Delivery Workshop.
Users will have a chance to try: 
    - Vertical Pod AutoScaler for assessing Deplyment resources levels
    - Horizontal Pod AutoScaler 
    - Pod Distributon Budget
    - Netwrok Policy to restrict access

NOTE: Vertical Auto Scaler requires VPA opertor to be installed, which was done for this cluster.


## Getting Started with the Vertical Pod AutoScaler exercise

Clone this repo: https://github.com/rb16b/Accelerate-Dev

1. You can clone it onto your laptop - howver there may be proxy issues runing oc cmds with the cluster on cloud
2. Clone it into Dev-Spaces instance provided with the workshop

From them meanu select -> Source Control button

![](images/clone-repor.png)

Enter Repo url:

![](images/repo-url-enter.png)

Enter project home: /home/user/

![](images/project-home-for-extra.png)

press OK button

Press Add to the workspace

Press Trust Provider

Repo Added

![](images/rep-ready.png)

You can use exitsing terminal or open a new one 

Make sure you are logged to the cluster 
$oc login to cluster with user id assigned to you

Use dev-userX project for this exercise
$oc project dev-userX ( dev-user1 for user1 )

$ cd /home/user/Accelerate-Dev/dev-user-objects

View vpa.yaml file first, then apply it to the project.

$ oc apply -f vpa.yaml 

Next using rest-heroes Route url open it in the browser like this - http://rest-fights-dev-user1.apps.cluster-lzxlf.lzxlf.sandbox1417.opentlc.com/q/swagger-ui/
Make Sure to add q/swagger-ui/ at the end.

![](images/rest-fightsAPI.png)

Run mutiple calls to create load. 
You can use run-load.sh, but first change the URL with a generated URL for this API
"http://RELPLACEME/api/fights/hello" - replace RELPLACEME with an actual API URL
Run $ ./run-load.sh 
Use cntrl-c to stop it

After $oc describe vpa rest-fights-vpa

Look for the recomdenation values captured by vpa for CPU and Memory as shown in the below image


![](images/vpa-image.png)



## Pod Budget Distribution Exercise

A Pod Disruption Budget is a Kubernetes resource that specifies the minimum number of pods that must remain available during a disruption caused by voluntary actions (like scaling down) or involuntary actions (like node failures or cluster upgrade)

Make sure you are dev-UserX project
View pdb.yaml file

Run $ oc apply -f pdb.yaml

You have set up Pod Distriubrtion Budget for rest-fights application 

Check if pdb is ready
$ oc get pdb

You should see the bellow output -->

NAME         MIN AVAILABLE   MAX UNAVAILABLE   ALLOWED DISRUPTIONS   AGE

fights-pdb   1                  N/A               0                  12m


NOTE: oc delete pod and pdb 
PDB does not consider explicitly deleting a deployment as a voluntary disruptions. !!!
The only way to test it out would be use of a node drain command. But for that an admin role is needed.



## Horizontal Pod Scaler Exercise

The Horizontal Pod Autoscaler (HPA) in Kubernetes automatically adjusts the number of pods in a deployment, replication controller, or replica set based on observed metrics, such as CPU utilization or custom metrics.

Apply HPA to dev-userX (where userX is your workshop userID !!! )project to manage rest-fights pod scalabilty

First look at Developer Console Topology project dev-userX 

Click on rest-figts pod and Details 

![](images/hpa-org.png)

You see a pod count to be 1 and arrows for manual pod scalabilty.

HPA definitions for Min pod count is 2, Max pod count 4.

Run $ oc apply -f hpa.yaml 

Take a look back a the same console

![](images/hpa-1-2.png)

You should notice changes happing, pod is scaling up

Then finaly rest-figts is runing 2 pods and manual scalabity arrows are gone

![](images/hpa-2.png)

# Network Policy Exercise


In OpenShift, Network Policies are used to control ingress (incoming) and egress (outgoing) traffic to and from pods. You can create Network Policies to define rules that specify which pods, namespaces, or IP blocks are allowed to connect to your application's pods

View ingress-policy.yaml

Apply Ingress Policy to rest-figts Pod.
 
Run $ oc apply -f ingress-policy.yaml

Run API call from http://rest-fights-dev-user1.apps.cluster-lzxlf.lzxlf.sandbox1417.opentlc.com/q/swagger-ui/ and check the return values
Insure that you apdate the url to reflect your enviroment.
 
![](images/rest-fightsAPI.png)
