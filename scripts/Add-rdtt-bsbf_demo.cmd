﻿@echo off
chcp 65001
SET  MainRepName=bsbf
SET  IbName=bsbf_demo

SET Rep-rdttUnbind=" /ConfigurationRepositoryUnbindCfg -Extension "ИнструментыРазработчикаTormozit""

"c:\Program Files\1cv8\8.3.22.1709\bin\1cv8.exe" DESIGNER /S "app01\%IbName%" /AppAutoCheckVersion  /AppAutoCheckMode "/ConfigurationRepositoryF "tcp://app01/%MainRepName%" /ConfigurationRepositoryF "tcp://app01/цм_bsbf_ОтладчикЗащиты_cfe" -Extension "ОтладчикЗащиты" /LoadCfg "c:\Development\cf_cfe\ИнструментыРазработчикаTormozit.cfe" -Extension "ИнструментыРазработчикаTormozit" /ConfigurationRepositoryF "tcp://app01/цм_ИнструментыРазработчика_cfe" -Extension "ИнструментыРазработчикаTormozit" /ConfigurationRepositoryN "%IbName%" /Out"Add-rdtt-%IbName%.log"