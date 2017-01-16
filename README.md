# gentoo_package_masking

Masking of Gentoo packages to support GLSA for security.
Made in form of chef cookbook.

## Usage

Add following lines to your Berksfile:

```
cookbook 'gentoo', github: 'aostanin/chef-gentoo'
cookbook 'gentoo_package_masking', github: 'pr0d1r2/gentoo_package_masking'
```
