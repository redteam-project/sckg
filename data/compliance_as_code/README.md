# Notes on this data source

This directory was taken from the [ComplianceasCode](https://github.com/ComplianceAsCode/content) project.

To recreate the [build](build) and [linux_os](linux_os) directories seen here, use this procedure.

```
export PROJECT_ID=my-project
gcloud compute --project=${PROJECT_ID} \
  instances create rhel7-cac-1 \
  --machine-type=n1-standard-4 \
  --image=rhel-7-drawfork-v20191004 \
  --image-project=eip-images \
  --boot-disk-size=100GB \

gcloud compute ssh rhel7-cac-1

sudo su -
yum install -y cmake make openscap-utils PyYAML python-jinja2 git ShellCheck yamllint ansible-lint ninja-build wget
wget https://github.com/ComplianceAsCode/content/archive/v0.1.47.tar.gz
tar xvzf v0.1.47.tar.gz
cd content-0.1.47/build
cmake ../
make -j4
cd ..
tar --exclude='build/jinja2_cache/*' -cvzf /var/tmp/cac.tar.gz build linux_os LICENSE
```