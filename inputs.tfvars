##############################################################################
## IBM Cloud Variables
##############################################################################
# Set the variable export TF_VAR_ibmcloud_api_key=
#ibmcloud_api_key = ""
ibm_resource_group = "default"


##############################################################################
## Azure Variables
##############################################################################
client_id         = "28f99b91-065c-4b50-a737-24340667743e"
tenant_id         = "2535c997-5831-46fd-ab9e-74b5d71776af"
client_secret     = "sHt8Q~GLDJlOHmcWE-hnEO6bS0sa-N4sm-2SAasD"
subscription_id   = "ce32225a-7157-44a8-a8dd-e600fd3d9f85"
az_resource_group = "satellite-azure-ibm"


##############################################################################
## Satellite Variables
##############################################################################
location       = "satellite-azure"
managed_from   = "wdc"
location_zones = ["Canada Central-1", "Canada Central-2", "Canada Central-3"]


##############################################################################
## Resorce Name
##############################################################################
ctc-type = "corp"
environment = "dev"
subscriptionvalue = "007"
application =  "ocpmcp"
regionvalue = "cc"

##############################################################################
## ROKS Cluster
##############################################################################

create_cluster = false
create_cluster_worker_pool = false

# Total number of worker nodes for cluster
addl_hosts = [
    {
        instance_type = "Standard_D4as_v4"
        # instance_type = "Standard_D16ds_v4"     # 16 vCPU - 64 GB AM
        count         = 3
    }
]

cp_hosts = [
    {
        instance_type = "Standard_D4as_v4"
        # instance_type = "Standard_D16ds_v4"     # 16 vCPU - 64 GB AM
        count         = 3
    }
]

st_hosts = [
    {
        instance_type = "Standard_D4as_v4"
        # instance_type = "Standard_D16ds_v4"     # 16 vCPU - 64 GB AM
        count         = 3
    }
]

bh_hosts = [
    {
        instance_type = "Standard_D4as_v4"
        # instance_type = "Standard_D16ds_v4"     # 16 vCPU - 64 GB AM
        count         = 2
    }
]