# :cloud: Oracle Cloud k8s (Free)

This repo utilizes the [always free tier](https://blogs.oracle.com/cloud-infrastructure/post/oracle-builds-out-their-portfolio-of-oracle-cloud-infrastructure-always-free-services) of the oracle cloud to provision a kubernetes cluster.

> :warning: This project uses arm instances, no x86 architecture. This means, that you can use only ARM images in your cluster (most bakers create also ARM images) 

At oracle cloud the Kubernetes controlplane (oke) is free to use, you just pay
for the workers, *if* you surpass the always free tier (which we don't).

You get 4 oCpus and 24GB memory which are split into two worker-instances
(`VM.Standard.A1.Flex` -> arm), allowing good resource utilization.
The boot partions are 100Gb each, allowing us to use around 60GB as in cluster storage.

The initial infra setup is inspired by this great tutorial: https://arnoldgalovics.com/free-kubernetes-oracle-cloud/

and this repo (big thanks @Ulli)
https://github.com/nce/oci-free-cloud-k8s

## Preconditions
The setup is based on Terraform, so you need experiance with [Terraform](https://developer.hashicorp.com/terraform)

## Presteps
1. Create account at OCI - https://www.oracle.com/cloud/
2. Install [oci-cli](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm#Quickstart)
3. Create `oci-cli`-Config. User and tenancy IDs from the web console. I chose `eu-frankfurt-1` as region. Set a name for the
```
oci setup config 
``` 
4. Add the generated public key to your profile. Web console->My Profile->API Keys->Add API key

## :keyboard: Create the k8s-cluster (OKE)
This part is managed by [infra](infra/)

Create a `terraform.tfvars` in the `infra` folder
```
compartment_id = "ocid1.tenancy.oc1..*"
ssh_public_key = "your SSH key"
```
Than put `terraform` to work

```
cd infra
terraform init
terraform apply
```

If everything goes well, you should be the proud owner of a k8s cluster in OCI.

### kubeconfig
With the following command we get the kubeconfig for terraform/direct access:
```
# in the infra folder
oci ce cluster create-kubeconfig --cluster-id $(terraform output --raw k8s_cluster_id) --file ~/.kube/configs/oci.kubeconfig --region eu-frankfurt-1 --token-version 2.0.0 --kube-endpoint PUBLIC_ENDPOINT
```
Test: check your k8s nodes. 
1. Install [kubectl](https://kubernetes.io/docs/tasks/tools/)
2. Run
```
kubectl --kubeconfig ~/.kube/configs/oci.kubeconfig get nodes
```

## :wrench: Additional tooling (optional)

- [x] Nginx-Ingress (with the oracle Network Load Balancer, because that's free as well)
- [x] Certmanager with letsencrypt
- [x] Longhorn (Storage)

The tools are managed by terraform in [config](config/)

Create a `terraform.tfvars` in the `infra` folder
```
compartment_id   = "ocid1.tenancy.oc1..*"
k8s_config_path = "~/.kube/configs/oci.kubeconfig"
letsencrypt_email = "myemail"
```
Than put `terraform` again to work
```
cd infra
terraform init
terraform apply
```

## 

# Optimisations & Ideas

 - Put your terraform `state` file to a remote backend
(GitLab, GitHub, S3 ... ). There are many backends available.  
 - Use `eternal-dns`

