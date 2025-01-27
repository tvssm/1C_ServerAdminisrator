﻿
&НаСервере
Процедура НайтиУстановленныеПлатформы1СНаСервере()            
    
    РезультатПоиска = Справочники.УстановленныеПлатформы1С.УстановленныеВерсииПлатформы1С();             
    УстановленнныеПлатформы1С = РезультатПоиска.ОписаниеТекстом;
    
    Элементы.УстановленнныеПлатформы1С.Высота = СтрЧислоСтрок(УстановленнныеПлатформы1С);
    Если Элементы.УстановленнныеПлатформы1С.Высота > 15 Тогда
        Элементы.УстановленнныеПлатформы1С.Высота = 10;
    КонецЕсли;
    
    ТЗ = РезультатПоиска.ОписаниеТЗ;
    Для каждого СтрокаТЗ Из ТЗ Цикл
        спр = Справочники.УстановленныеПлатформы1С.НайтиПоРеквизиту("ПолныйПуть",СтрокаТЗ.ПолныйПуть);
        Если спр.Пустая() Тогда
            спр = Справочники.УстановленныеПлатформы1С.СоздатьЭлемент();
        Иначе
            спр = спр.ПолучитьОбъект();
        КонецЕсли;
        
        ЗаполнитьЗначенияСвойств(спр,СтрокаТЗ);
        спр.Записать();
    КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура НайтиУстановленныеПлатформы1С(Команда)
    НайтиУстановленныеПлатформы1СНаСервере();
КонецПроцедуры
