# zmbkpose

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with zmbkpose](#setup)
    * [How to use](#como-utilizar)
    * [Class zmbkpose](#arquivo-init.pp-classe)
    * [Class zmbkpose::user](#Arquivo-user.pp-classe)
    * [Class zmbkpose::dir](#Arquivo-dir.pp-classe)
    * [Class zmbkpose::conf](#Arquivo-conf.pp-classe)
    * [Class zmbkpose::cron](#Arquivo-cron.pp-classe)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The puppet intertop-zmbkpose module,  aim to deliver automatic backups to Zimbra via zmbkpose.

## Module Description and Requirements

The puppet zmbkpose module requires a Zimbra Server version 8.7.

The following puppet resources are used by this module: 
* templates
* manifests
* files
* lib - facter do modulo

All the config of zmbkpose is made through these modules, some configs made are:
* Config the way of binary zmbkpose;
* Config the way of conf zmbkpose.conf;
* Config a crontab of Zimbra.

The module has the following classes:
* zmbkpose;
* zmbkpose::dir;
* zmbkpose::params;
* zmbkpose::user;
* zmbkpose::conf;
* zmbkpose::cron;

## Setup

### How to use

zmbkpose class import all other required classes, you just need to change the variables if needed.

### File init.pp class: **zmbkpose**

Inherited resources from class zmbkpose::params.

        class { 'zmbkpose::user': } ->
        class { 'zmbkpose::dir': } ->
        class { 'zmbkpose::conf': } ->
        class { 'zmbkpose::cron': }


### File user.pp class: **zmbkpose::user**

The User class check the Zimbra user/group existence.


## File dir.pp class: **zmbkpose::dir**

The dir class is responsible for create all directories used by zmbkpose script.

Example of directories to be created:
* /etc/zmbkpose -> directory of conf;
* /usr/local/bin/zmbkpose -> directory of binary - script
* /opt/backup -> directory of backups
* /opt/backup/log -> directory of backup logs

##  File conf.pp classe: **zmbkpose::conf**

Config script zmbkpose and conf zmbkpose.conf.

In the zmbkpose script you just configure the way to zmbkpose.conf.  By this way zmbkpose script is a puppet template.

In the conf all options are treated like variables, they are in the params.pp

The zimbra user password is collected automatically by puppet and transmitted via facter to template.


##  File cron.pp class: **zmbkpose::cron**

The cron class create full and incremental backup schedules as well as removal of old backups of Zimbra users.

All the cron schedules are managed through the class params.pp.  These variables are stored like array, as follow:

$backupFull = {'min' => '3', 'hora' => '2', 'monthday' => '1', 'month' => '2', 'weekday' => '2'  }


## Limitations

The module has been tested in CentOS 7 running Zimbra 8.7.

## Development

The module has been created by InterOp - www.interop.com.br, by the following contributors:

Rafael Tomelin, Team Leader at Interop, Linux Specialist, RHCE Certified, LPIC-3-Core
Rudnei Bertol, Linux Analyst at Interop, Linux Specialist, RHCE and Expertise in Configuration Management Certified
Cleverson Santos, Sr.IT Consultant at Interop, ITSM delivering value to Interop customers.

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
