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

The puppet zmbkpose module requires a Zimbra Server version 8.7.\n
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

zmbkpose class import the rest of other required classes, you just need to change the variables if needed.


### File init.pp class: **zmbkpose**

Inherited resources from class zmbkpose::params.


        class { 'zmbkpose::user': } ->
        class { 'zmbkpose::dir': } ->
        class { 'zmbkpose::conf': } ->
        class { 'zmbkpose::cron': }


### File user.pp class: **zmbkpose::user**

The User class check the Zimbra user/group existence.


## File dir.pp class: **zmbkpose::dir**

A classe dir é responsável por criar todos os diretórios utilizados pelo o script zmbkpose.

Exemplo de diretórios a serem criados:
* /etc/zmbkpose -> diretório onde estará o conf;
* /usr/local/bin/zmbkpose -> diretório de onde ficará o binário - script
* /opt/backup -> diretório de onde estará os backups
* /opt/backup/log -> diretório onde conterá os logs do backup

##  Arquivo conf.pp classe: **zmbkpose::conf**

Configura o script zmbkpose e o conf zmbkpose.conf.

No script zmbkpose é configurado apenas o caminho de onde está o arquivo zmbkpose.conf.  Portanto, o script zmbkpose é um template no puppet.

O arquivo de configuração zmbkpose.conf, é um template no puppet.  No conf todas as opções são tratadas comos variáveis e estão em params.pp
A senha do usuário zimbra, é coletada automaticamente pelo o puppet e repassada via facter para o template.


##  Arquivo cron.pp classe: **zmbkpose::cron**
A classe cron, cria os agendamentos de backup full, incremental e a remoção dos backups antigos no usuário do Zimbra.

Todo o horário na cron, são variáveis gerenciadas pela a classe params.pp.  Essas variáveis estão como array, conforme o exampleo abaixo:
$backupFull = {'min' => '3', 'hora' => '2', 'monthday' => '1', 'month' => '2', 'weekday' => '2'  }



## Limitations

O módulo foi testado no CentOS 7 com o Zimbra 8.7.


## Development

O módulo foi desenvolvido pela a empresa InterOp - www.interop.com.br, com os seguintes colaboradores:
Rafael Tomelin
Rudnei Bertol

## Release Notes/Contributors/Etc **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You may also add any additional sections you feel are
necessary or important to include here. Please use the `## ` header.
