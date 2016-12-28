# zmbkpose

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with zmbkpose](#setup)
    * [Como utilizar](#como-utilizar)
    * [Classe zmbkpose](#arquivo-init.pp-classe)
    * [Classe zmbkpose::user](#Arquivo-user.pp-classe)
    * [Classe zmbkpose::dir](#Arquivo-dir.pp-classe)
    * [Classe zmbkpose::conf](#Arquivo-conf.pp-classe)
    * [Classe zmbkpose::cron](#Arquivo-cron.pp-classe)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

O modulo do puppet intertop-zmbkpose, tem como objetivo configurar de forma automatica os backups do Zimbra via zmbkpose.

## Module Description

O modulo zmbkpose do puppet, tem como pré-requisito o servidor zimbra.\n
Os seguintes recursos do puppet são utilizados pelo o módulo (templates, manifests, files, lib - facter do modulo).

Toda a configuração do zmbkpose é realizada através do modulos, segue algumas configurações realizadas:
* Configura o caminho do binario zmbkpose;
* Configura o caminho do conf zmbkpose.conf;
* Configura a crontab do Zimbra.

O modulo possui as seguintes classes, que serão descritas abaixo:
* zmbkpose;
* zmbkpose::dir;
* zmbkpose::params;
* zmbkpose::user;
* zmbkpose::conf;
* zmbkpose::cron;

## Setup

### Como utilizar

A classe zmbkpose importa todas as demais classes necessárias, sendo necessário apenas alterar as variaveis caso necessário.


### Arquivo init.pp classe: **zmbkpose**

Herda os recursos da classe zmbkpose::params.


        class { 'zmbkpose::user': } ->
        class { 'zmbkpose::dir': } ->
        class { 'zmbkpose::conf': } ->
        class { 'zmbkpose::cron': }


### Arquivo user.pp classe: **zmbkpose::user**

A classe user faz a verificação da existência do usuário/grupo do Zimbra.


## Arquivo dir.pp classe: **zmbkpose::dir**

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
