Deploys a Check Point Cloud Security Blueprint using Terraform with VMSS in both North (inbound) and South (Outbound) hubs.
Public accessible Jumphost in West spoke and public load balanced web site (2 x Web servers) in East spoke.

Needs:
- terraform installed or run from Azure CLI
    https://azurecitadel.com/prereqs/wsl/
- an existing R80.20 Check Point Management prepared with autoprovision and policy for the VMSS's
    https://sc1.checkpoint.com/documents/IaaS/WebAdminGuides/EN/CP_VMSS_for_Azure/html_frameset.htm
- Azure credentials in variable file or better as Environment Variables on the host
    Example added to the end of .bashrc on your host
        export ARM_CLIENT_ID="xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxx"
        export ARM_CLIENT_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        export ARM_SUBSCRIPTION_ID="xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
        export ARM_TENANT_ID="xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

Notes:
- Management server communicate with gateways over public IPs

Run:
put the files in a directory on your host (download or git clone) and fron that directory run:
'terraform init'
'terraform plan' (optional)
'terrafrom apply'

Known issues:
- You probably need to ask Microsoft to increase your Dv2 quota
- sometimes the vNet peerings fail to deploy.
  Rerunning 'terraform apply' might deploy them correctly, but sometimes destroys the route table association.
  Another rerun typically fixes it
