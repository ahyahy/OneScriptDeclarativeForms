Перем Ф;
Перем Форма_0;
Перем Кнопка1;
Перем Надпись1;
Перем Надпись2;
Перем Надпись3;
Перем Надпись5;
Перем Надпись6;
Перем Надпись7;
Перем Надпись8;
Перем Надпись9;
Перем ПолеВвода3;
Перем ПолеВвода4;
Перем ПолеВвода5;
Перем ПолеВыбора1;
Перем ПолеВыбора2;

Перем КлассИмяРус;
Перем КлассИмяEn;
Перем СобытиеИмяРус;
Перем СобытиеИмяEn;
Перем Использование;
Перем ЗначениеТип;
Перем ЗначениеОписание;
Перем ВыходнойКаталог;
Перем Наследники;
Перем Надпись10;
Перем СписокЭлементов1;
Перем Кнопка2;
Перем Кнопка3;
Перем Надпись11;
Перем ПолеВыбора3;
Перем Кнопка4;
Перем Кнопка5;
Перем СтрКлассов;

Процедура Кн_Нажатие() Экспорт
	М = РазобратьСтроку(ПолеВыбора3.Текст, " ");
	КлассИмяРус = М[0];
	КлассИмяEn = М[1];
	СобытиеИмяРус = СокрЛП(ПолеВвода3.Текст);
	СобытиеИмяEn = СокрЛП(ПолеВвода4.Текст);
	Использование = СокрЛП(ПолеВыбора1.Текст);
	ЗначениеТип = СокрЛП(ПолеВыбора2.Текст);
	ЗначениеОписание = СокрЛП(ПолеВвода5.Текст);
	
	СоздатьСобытие();
КонецПроцедуры

Процедура НачальноеЗаполнениеФормы()
	ПолеВыбора3.Текст = "Элемент Element";
	ПолеВвода3.Текст = "";
	ПолеВвода4.Текст = "";
	ПолеВвода5.Текст = "";
	ПолеВыбора1.Текст = "Чтение и запись.";
	ПолеВыбора2.Текст = "";
	
	М = РазобратьСтроку(СтрКлассов, ";");
	ЭлементыПоляВыбора3 = ПолеВыбора3.Элементы;
	Для А = 0 По М.ВГраница() Цикл
		// Сообщить("" + М[А]);
		М2 = РазобратьСтроку(М[А], ",");
		ЭлементыПоляВыбора3.Добавить(М2[0] + " " + М2[1]);
		Если (М2[0] = "Элемент") или (М2[0] = "ДекларативныеФормы") Тогда
		Иначе
			СписокЭлементов_Элемент = Ф.ЭлементСпискаЭлементов();
			СписокЭлементов_Элемент_Подэлемент0 = Ф.ПодэлементСпискаЭлементов();
			СписокЭлементов_Элемент_Подэлемент0.Текст = М2[0];
			СписокЭлементов_Элемент.Подэлементы.Добавить(СписокЭлементов_Элемент_Подэлемент0);
			СписокЭлементов_Элемент_Подэлемент1 = Ф.ПодэлементСпискаЭлементов();
			СписокЭлементов_Элемент_Подэлемент1.Текст = М2[1];
			СписокЭлементов_Элемент.Подэлементы.Добавить(СписокЭлементов_Элемент_Подэлемент1);
			СписокЭлементов_Элемент.Текст = М2[2];
			СписокЭлементов1.Элементы.Добавить(СписокЭлементов_Элемент);

		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

Процедура СоздатьСобытие()
	Стр = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
	|<HTML><HEAD><TITLE>EEVVEENNTT Event</TITLE>
	|<META content=""text/html; charset=Windows-1252"" http-equiv=""Content-Type"">
	|<LINK rel=""stylesheet"" type=""text/css"" href=""mainstyle.css""></HEAD>
	|<BODY id=bodyID class=dtBODY>
	|<DIV id=nsbanner>
	|<DIV id=bannerrow1>
	|<TABLE class=bannerparthead cellSpacing=0>
	|  <TBODY>
	|  <TR id=hdr>
	|    <TD class=runninghead></TD>
	|    <TD class=product></TD></TR></TBODY></TABLE></DIV>
	|<DIV id=TitleRow>
	|<H1 class=dtH1>ККЛЛААСС.ССООББЫЫТТИИЕЕ&nbsp;(CCLLAASS.EEVVEENNTT)&nbsp;Событие</H1></DIV></DIV>
	|<DIV id=nstext>
	|<H4 class=dtH4>Использование</H4>
	|<P>" + Использование + "</P>
	|<H4 class=dtH4>Значение</H4>
	|<P>Тип: " + ЗначениеТип + "</P>
	|<P>" + ЗначениеОписание + "</P>
	|<H4 class=dtH4>Примечание</H4>
	|<P></P>
	|<H4 class=dtH4>Пример</H4>
	|<P><PRE class=code>
	|
	|</PRE>
	|<details><summary>Полный пример кода</summary>
	|<P><PRE class=code>
	|<a id=""copy1"" href=""jаvascript://"" title=""Выделяет код, копирует и снимает выделение."">Копировать</a>     <a id=""select1"" href=""jаvascript://"" title=""Выделяет код."">Выделить всё</a>
	|<hr style=""border-color: lightgray;""><DIV id=""cont1"">
	|
	|</DIV>
	|</PRE>
	|</details>
	|<P></P>
	|<H4 class=dtH4>Смотрите также</H4>
	|<P><A href=""OSDForms.html"">Библиотека&nbsp;OneScriptDeclarativeForms</A></P></DIV>
	|<script>
	|window.onload = function () {
	|    var a = document.getElementById('select1');
	|    a.onclick = function() {
	|		window.getSelection().removeAllRanges();
	|		var ta1 = document.getElementById('cont1'); 
	|		var range1 = document.createRange();
	|		range1.selectNode(ta1); 
	|		window.getSelection().addRange(range1); 
	|        return false;
	|    }
	|	
	|    var b = document.getElementById('copy1');
	|    b.onclick = function() {
	|		window.getSelection().removeAllRanges();
	|		var ta2 = document.getElementById('cont1'); 
	|		var range2 = document.createRange();
	|		range2.selectNode(ta2); 
	|		window.getSelection().addRange(range2);
	|		try { 
	|		  document.execCommand('copy'); 
	|		} catch(err) {} 
	|		window.getSelection().removeRange(range2);
	|        return false;
	|    }
	|}
	|</script>
	|</BODY></HTML>
	|";
	Если КлассИмяEn = "" Тогда
		ПодстрокаПоиска = "ККЛЛААСС.";
		ПодстрокаЗамены = КлассИмяРус;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
		
		ПодстрокаПоиска = "CCLLAASS.";
		ПодстрокаЗамены = КлассИмяEn;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	Иначе
		ПодстрокаПоиска = "ККЛЛААСС";
		ПодстрокаЗамены = КлассИмяРус;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
		
		ПодстрокаПоиска = "CCLLAASS";
		ПодстрокаЗамены = КлассИмяEn;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;

	ПодстрокаПоиска = "ССООББЫЫТТИИЕЕ";
	ПодстрокаЗамены = СобытиеИмяРус;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "EEVVEENNTT";
	ПодстрокаЗамены = СобытиеИмяEn;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	Если КлассИмяEn = "" Тогда
		ТекстДок = Новый ТекстовыйДокумент;
		ИмяФайла = ВыходнойКаталог + "\OSDForms." + СобытиеИмяEn + "Event.html";
		ТекстДок.УстановитьТекст(Стр);
		ТекстДок.Записать(ИмяФайла);
	Иначе
		ТекстДок = Новый ТекстовыйДокумент;
		ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn + СобытиеИмяEn + "Event.html";
		ТекстДок.УстановитьТекст(Стр);
		ТекстДок.Записать(ИмяФайла);
	КонецЕсли;

	// Добавим ссылку в C:\444\OSDFormsRu\contents.htm ====================================================================================
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать("C:\444\OSDFormsRu\contents.htm");
	Стр = ТекстДок.ПолучитьТекст();
	// d.add(38,0,"События","Events.html");
	Стр3 = "";
	М_Стр = РазобратьСтроку(Стр, ";");
	Для А = 0 По М_Стр.ВГраница() Цикл
		Если СтрНайти(М_Стр[А], """События"",""Events.html"")") > 0 Тогда
			Стр3 = М_Стр[А];
		КонецЕсли;
	КонецЦикла;
	М_Номер = СтрНайтиМежду(Стр, "d.add(", ",""События"",""Events.html", Ложь, );
	Номер = М_Номер[М_Номер.ВГраница()];
	М_Номер2 = СтрНайтиМежду(Номер, "(", ",", , );
	Номер = М_Номер2[0];
	М = СтрНайтиМежду(Стр, 
		"""События"",""Events.html"");", 
		"add", 
		Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		// d.add(37,36,"Нажатие (Click)","OSDForms.ClickEvent.html");
		Если КлассИмяEn = "" Тогда
			ПодстрокаЗамены = """События"",""Events.html"");
			|d.add(8000," + Номер + ",""" + СобытиеИмяРус + " (" + СобытиеИмяEn + ")"",""OSDForms." + КлассИмяEn + СобытиеИмяEn + "Event.html"");
			|d.add";
		Иначе
			ПодстрокаЗамены = """События"",""Events.html"");
			|d.add(8000," + Номер + ",""" + СобытиеИмяРус + " (" + СобытиеИмяEn + ") (" + КлассИмяРус + ")"",""OSDForms." + КлассИмяEn + СобытиеИмяEn + "Event.html"");
			|d.add";
		КонецЕсли;
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;

	ИмяФайла = ВыходнойКаталог + "\contents.htm";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);

	// Изменим C:\444\OSDFormsRu\Events.html ====================================================================================
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать("C:\444\OSDFormsRu\Events.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"    <TH width=""50%"">События (Events)</TH>
		|    <TH width=""50%"">Описание</TH></TR>",
		"<TR vAlign=top>", 
		Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><A href=""OSDForms." + КлассИмяEn + СобытиеИмяEn + "Event.html"">" + СобытиеИмяРус + "&nbsp;(" + СобытиеИмяEn + ") (" + КлассИмяРус + ")</A></TD>
		|    <TD width=""50%"">" + ЗначениеОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;
	ИмяФайла = ВыходнойКаталог + "\Events.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	
	// Изменим C:\444\OSDFormsRu\OSDForms.КЛАССEvents.html ====================================================================================
	Если Не (КлассИмяEn = "") Тогда
		ТекстДок = Новый ТекстовыйДокумент;
		ТекстДок.Прочитать("C:\444\OSDFormsRu\OSDForms." + КлассИмяEn + "Events.html");
		Стр = ТекстДок.ПолучитьТекст();
		М = СтрНайтиМежду(Стр, 
				"<H4 class=dtH4>События</H4>
				|<DIV class=tablediv>
				|<TABLE class=dtTABLE cellSpacing=0>
				|  <TBODY>", 
				"<TR vAlign=top>", 
				Ложь, );
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><A href=""OSDForms." + КлассИмяEn + СобытиеИмяEn + "Event.html"">" + СобытиеИмяРус + "&nbsp;(" + СобытиеИмяEn + ")</A></TD>
		|    <TD width=""50%"">" + ЗначениеОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

		ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn + "Events.html";
		ТекстДок.УстановитьТекст(Стр);
		ТекстДок.Записать(ИмяФайла);
	КонецЕсли;
	
	Для А = 0 По СписокЭлементов1.Элементы.Количество - 1 Цикл
		Эл = СписокЭлементов1.Элементы.Элемент(А);
		Если Не Эл.Помечен Тогда
			Продолжить;
		КонецЕсли;
		Подэлементы1 = Эл.Подэлементы;
		КлассИмяEn2 = Подэлементы1.Элемент(2).Текст;
		ТекстДок = Новый ТекстовыйДокумент;
		ТекстДок.Прочитать("C:\444\OSDFormsRu\OSDForms." + КлассИмяEn2 + "Events.html");
		Стр = ТекстДок.ПолучитьТекст();
		М = СтрНайтиМежду(Стр, 
				"<H4 class=dtH4>События</H4>
				|<DIV class=tablediv>
				|<TABLE class=dtTABLE cellSpacing=0>
				|  <TBODY>", 
				"<TR vAlign=top>", 
				Ложь, );
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><A href=""OSDForms." + КлассИмяEn + СобытиеИмяEn + "Event.html"">" + СобытиеИмяРус + "&nbsp;(" + СобытиеИмяEn + ")</A></TD>
		|    <TD width=""50%"">" + ЗначениеОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

		ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn2 + "Events.html";
		ТекстДок.УстановитьТекст(Стр);
		ТекстДок.Записать(ИмяФайла);
	КонецЦикла;
	
	ОкноСообщений1 = Ф.ОкноСообщений();
	Ф.ОкноСообщений().Показать("Завершено", "Завершено", Ф.КнопкиОкнаСообщений.ОКОтмена, Ф.ЗначокОкнаСообщений.Восклицание);
КонецПроцедуры

Процедура СнятьВсе() Экспорт
	Элементы = СписокЭлементов1.Элементы;
	Для А = 0 По Элементы.Количество - 1 Цикл
		Элементы.Элемент(А).Помечен = Ложь;
	КонецЦикла;
КонецПроцедуры

Процедура ПометитьВсе() Экспорт
	Элементы = СписокЭлементов1.Элементы;
	Для А = 0 По Элементы.Количество - 1 Цикл
		Элементы.Элемент(А).Помечен = Истина;
	КонецЦикла;
КонецПроцедуры

Процедура ПодготовкаКомпонентов()
    // ВАЖНО: Необходимая процедура для поддержки конструктора — не изменяйте содержимое этой процедуры с помощью редактора кода.
    // osdText = "WzzQmtC+0L3RgdGC0YDRg9C60YLQvtGA0YtdDQrQpNC+0YDQvNCwXzAgPSDQpC7QpNC+0YDQvNCwKCk7DQrQmtC90L7Qv9C60LAxID0g0KQu0JrQvdC+0L/QutCwKCk7DQrQndCw0LTQv9C40YHRjDEgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwyID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMNSA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQndCw0LTQv9C40YHRjDYgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMyA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J/QvtC70LXQktCy0L7QtNCwNCA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J3QsNC00L/QuNGB0Yw3ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMSA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDggPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCd0LDQtNC/0LjRgdGMOSA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LA1ID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxID0g0KQu0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyKCk7DQrQndCw0LTQv9C40YHRjDEwID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCa0L3QvtC/0LrQsDIgPSDQpC7QmtC90L7Qv9C60LAoKTsNCtCa0L3QvtC/0LrQsDMgPSDQpC7QmtC90L7Qv9C60LAoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMyA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDExID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNClvQmtC+0L3RgdGC0YDRg9C60YLQvtGA0Ys+XQ0KWzzQodCy0L7QudGB0YLQstCwXQ0KWzzQpNC+0YDQvNCwXzBdDQrQpNC+0YDQvNCwXzAu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDY0OSwgNjQ1KTsNCtCk0L7RgNC80LBfMC7Qn9GD0YLRjCA9ICJDOlw0NDRcOS3Ql9Cw0LPQvtGC0L7QstC60LjQlNC10LrQu9Cw0YDQpNC+0YDQvFzQodC+0LfQtNCw0L3QuNC10KHQvtCx0YvRgtC40Y8yLm9zIjsNCtCk0L7RgNC80LBfMC7QodGC0LjQu9GM0KHQutGA0LjQv9GC0LAgPSAi0KHRgtC40LvRjNCh0LrRgNC40L/RgtCwIjsNCtCk0L7RgNC80LBfMC7QotC10LrRgdGCID0gItCh0L7Qt9C00LDQvdC40LUg0YHQvtCx0YvRgtC40Y8iOw0K0KTQvtGA0LzQsF8wLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQpNC+0YDQvNCwXzAu0JjQvNGP0J7QsdGK0LXQutGC0LDQpNC+0YDQvNGL0JTQu9GP0J7QtNC90L7QodC60YDQuNC/0YLQsCA9ICLQpCI7DQpb0KTQvtGA0LzQsF8wPl0NCls80JrQvdC+0L/QutCwMV0NCtCa0L3QvtC/0LrQsDEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCa0L3QvtC/0LrQsDEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEyNywgMjMpOw0K0JrQvdC+0L/QutCwMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDA7DQrQmtC90L7Qv9C60LAxLtCd0LDQttCw0YLQuNC1ID0gItCa0L1f0J3QsNC20LDRgtC40LUiOw0K0JrQvdC+0L/QutCwMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDQ3MCwgNTcxKTsNCtCa0L3QvtC/0LrQsDEu0KLQtdC60YHRgiA9ICLQodC+0LfQtNCw0YLRjCDRgdC+0LHRi9GC0LjQtSI7DQrQmtC90L7Qv9C60LAxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0JrQvdC+0L/QutCwMT5dDQpbPNCd0LDQtNC/0LjRgdGMMV0NCtCd0LDQtNC/0LjRgdGMMS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0YwxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg0MjYsIDIyKTsNCtCd0LDQtNC/0LjRgdGMMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDE7DQrQndCw0LTQv9C40YHRjDEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgNTUyKTsNCtCd0LDQtNC/0LjRgdGMMS7QotC10LrRgdGCID0gItCY0YHRhdC+0LTQvdGL0LUg0LTQsNC90L3Ri9C1INC70LXQttCw0YIg0LIg0LrQsNGC0LDQu9C+0LPQtSBDOlw0NDRcT1NERm9ybXNSdSI7DQrQndCw0LTQv9C40YHRjDEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDE+XQ0KWzzQndCw0LTQv9C40YHRjDJdDQrQndCw0LTQv9C40YHRjDIu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMzUyLCAyMyk7DQrQndCw0LTQv9C40YHRjDIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyOw0K0J3QsNC00L/QuNGB0YwyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDU3NCk7DQrQndCw0LTQv9C40YHRjDIu0KLQtdC60YHRgiA9ICLQktGL0YXQvtC00L3Ri9C1INC00LDQvdC90YvQtSDQsdGD0LTRg9GCINCyINC60LDRgtCw0LvQvtCz0LUgQzpcMDAwIjsNCtCd0LDQtNC/0LjRgdGMMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMj5dDQpbPNCd0LDQtNC/0LjRgdGMNV0NCtCd0LDQtNC/0LjRgdGMNS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxNDIsIDE3KTsNCtCd0LDQtNC/0LjRgdGMNS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDc7DQrQndCw0LTQv9C40YHRjDUu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgNjkpOw0K0J3QsNC00L/QuNGB0Yw1LtCi0LXQutGB0YIgPSAi0KHQvtCx0YvRgtC40LXQmNC80Y/QoNGD0YEiOw0K0J3QsNC00L/QuNGB0Yw1LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw1Pl0NCls80J3QsNC00L/QuNGB0Yw2XQ0K0J3QsNC00L/QuNGB0Yw2LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDYu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEyNSwgMTYpOw0K0J3QsNC00L/QuNGB0Yw2LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gODsNCtCd0LDQtNC/0LjRgdGMNi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDMyMCwgNzApOw0K0J3QsNC00L/QuNGB0Yw2LtCi0LXQutGB0YIgPSAi0KHQvtCx0YvRgtC40LXQmNC80Y9FbiI7DQrQndCw0LTQv9C40YHRjDYu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDY+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LAzXQ0K0J/QvtC70LXQktCy0L7QtNCwMy7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktCy0L7QtNCwMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyMik7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gOTsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgODkpOw0K0J/QvtC70LXQktCy0L7QtNCwMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLQstC+0LTQsDM+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LA0XQ0K0J/QvtC70LXQktCy0L7QtNCwNC7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktCy0L7QtNCwNC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyMik7DQrQn9C+0LvQtdCS0LLQvtC00LA0LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTA7DQrQn9C+0LvQtdCS0LLQvtC00LA0LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzIwLCA4OSk7DQrQn9C+0LvQtdCS0LLQvtC00LA0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwND5dDQpbPNCd0LDQtNC/0LjRgdGMN10NCtCd0LDQtNC/0LjRgdGMNy7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw3LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxNTcsIDE4KTsNCtCd0LDQtNC/0LjRgdGMNy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDExOw0K0J3QsNC00L/QuNGB0Yw3LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDExMik7DQrQndCw0LTQv9C40YHRjDcu0KLQtdC60YHRgiA9ICLQmNGB0L/QvtC70YzQt9C+0LLQsNC90LjQtSI7DQrQndCw0LTQv9C40YHRjDcu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDc+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDFdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk1LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxMjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgMTMzKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QotC10LrRgdGCID0gItCi0L7Qu9GM0LrQviDQt9Cw0L/QuNGB0YwuIjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk1Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC+0LvRjNC60L4g0LfQsNC/0LjRgdGMLiIsICLQotC+0LvRjNC60L4g0LfQsNC/0LjRgdGMLiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0L7Qu9GM0LrQviDRh9GC0LXQvdC40LUuIiwgItCi0L7Qu9GM0LrQviDRh9GC0LXQvdC40LUuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KfRgtC10L3QuNC1INC4INC30LDQv9C40YHRjC4iLCAi0KfRgtC10L3QuNC1INC4INC30LDQv9C40YHRjC4iKSk7DQpb0J/QvtC70LXQktGL0LHQvtGA0LAxPl0NCls80J3QsNC00L/QuNGB0Yw4XQ0K0J3QsNC00L/QuNGB0Yw4LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDgu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEzMiwgMTcpOw0K0J3QsNC00L/QuNGB0Yw4LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTM7DQrQndCw0LTQv9C40YHRjDgu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgMTY2KTsNCtCd0LDQtNC/0LjRgdGMOC7QotC10LrRgdGCID0gItCX0L3QsNGH0LXQvdC40LXQotC40L8iOw0K0J3QsNC00L/QuNGB0Yw4LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw4Pl0NCls80J/QvtC70LXQktGL0LHQvtGA0LAyXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDU5NywgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTQ7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDE4Nik7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KLQtdC60YHRgiA9ICLQkdGD0LvQtdCy0L4uIjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gNTk3Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQkdGD0LvQtdCy0L4uIiwgItCR0YPQu9C10LLQvi4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQodGC0YDQvtC60LAuIiwgItCh0YLRgNC+0LrQsC4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQp9C40YHQu9C+LiIsICLQp9C40YHQu9C+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0J/RgNC+0LjQt9Cy0L7Qu9GM0L3Ri9C5LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDI+XQ0KWzzQndCw0LTQv9C40YHRjDldDQrQndCw0LTQv9C40YHRjDku0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMOS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTU4LCAxOCk7DQrQndCw0LTQv9C40YHRjDku0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxNTsNCtCd0LDQtNC/0LjRgdGMOS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCAyMTkpOw0K0J3QsNC00L/QuNGB0Yw5LtCi0LXQutGB0YIgPSAi0JfQvdCw0YfQtdC90LjQtdCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0Yw5LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw5Pl0NCls80J/QvtC70LXQktCy0L7QtNCwNV0NCtCf0L7Qu9C10JLQstC+0LTQsDUu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLQstC+0LTQsDUu0JzQvdC+0LPQvtGB0YLRgNC+0YfQvdGL0LnQoNC10LbQuNC8ID0g0JjRgdGC0LjQvdCwOw0K0J/QvtC70LXQktCy0L7QtNCwNS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNTk3LCA4Nyk7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTY7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDI0MCk7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwNT5dDQpbPNCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjFdDQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg1MTgsIDE4Nyk7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTc7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCk0LvQsNC20LrQuCA9INCY0YHRgtC40L3QsDsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDAgPSDQpC7QmtC+0LvQvtC90LrQsCgpOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMC7QotC10LrRgdGCID0gItCi0LXQsyI7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAwLtCo0LjRgNC40L3QsCA9IDE1MDsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0JrQvtC70L7QvdC60Lgu0JTQvtCx0LDQstC40YLRjCjQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAwKTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDEgPSDQpC7QmtC+0LvQvtC90LrQsCgpOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMS7QotC10LrRgdGCID0gItCa0LvQsNGB0YHQoNGD0YEiOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMS7QqNC40YDQuNC90LAgPSAyMDI7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCa0L7Qu9C+0L3QutC4LtCU0L7QsdCw0LLQuNGC0Ywo0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMSk7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAyID0g0KQu0JrQvtC70L7QvdC60LAoKTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDIu0KLQtdC60YHRgiA9ICLQmtC70LDRgdGB0JDQvdCz0LsiOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMi7QqNC40YDQuNC90LAgPSAxNjA7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCa0L7Qu9C+0L3QutC4LtCU0L7QsdCw0LLQuNGC0Ywo0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMik7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDM2Mik7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCg0LXQttC40LzQntGC0L7QsdGA0LDQttC10L3QuNGPID0g0KQu0KDQtdC20LjQvNCe0YLQvtCx0YDQsNC20LXQvdC40Y8u0J/QvtC00YDQvtCx0L3QvjsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxPl0NCls80J3QsNC00L/QuNGB0YwxMF0NCtCd0LDQtNC/0LjRgdGMMTAu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMTAu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDE0MiwgMjMpOw0K0J3QsNC00L/QuNGB0YwxMC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDE4Ow0K0J3QsNC00L/QuNGB0YwxMC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCAzMzYpOw0K0J3QsNC00L/QuNGB0YwxMC7QotC10LrRgdGCID0gItCf0YDQuNC80LXQvdC40LzQviDQuiI7DQrQndCw0LTQv9C40YHRjDEwLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwxMD5dDQpbPNCa0L3QvtC/0LrQsDJdDQrQmtC90L7Qv9C60LAyLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQmtC90L7Qv9C60LAyLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg3NCwgNDMpOw0K0JrQvdC+0L/QutCwMi7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDE5Ow0K0JrQvdC+0L/QutCwMi7QndCw0LbQsNGC0LjQtSA9ICLQodC90Y/RgtGM0JLRgdC1IjsNCtCa0L3QvtC/0LrQsDIu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg1NDIsIDM2Nik7DQrQmtC90L7Qv9C60LAyLtCi0LXQutGB0YIgPSAi0KHQvdGP0YLRjCDQstGB0LUiOw0K0JrQvdC+0L/QutCwMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Ca0L3QvtC/0LrQsDI+XQ0KWzzQmtC90L7Qv9C60LAzXQ0K0JrQvdC+0L/QutCwMy7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0JrQvdC+0L/QutCwMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNzQsIDQzKTsNCtCa0L3QvtC/0LrQsDMu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyMDsNCtCa0L3QvtC/0LrQsDMu0J3QsNC20LDRgtC40LUgPSAi0J/QvtC80LXRgtC40YLRjNCS0YHQtSI7DQrQmtC90L7Qv9C60LAzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNTQyLCA0MTUpOw0K0JrQvdC+0L/QutCwMy7QotC10LrRgdGCID0gItCf0L7QvNC10YLQuNGC0Ywg0LLRgdC1IjsNCtCa0L3QvtC/0LrQsDMu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQmtC90L7Qv9C60LAzPl0NCls80J/QvtC70LXQktGL0LHQvtGA0LAzXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NSwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjE7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDQyKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktGL0LHQvtGA0LAzPl0NCls80J3QsNC00L/QuNGB0YwxMV0NCtCd0LDQtNC/0LjRgdGMMTEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMTEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDE1MywgMTYpOw0K0J3QsNC00L/QuNGB0YwxMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDIyOw0K0J3QsNC00L/QuNGB0YwxMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCAyMyk7DQrQndCw0LTQv9C40YHRjDExLtCi0LXQutGB0YIgPSAi0JrQu9Cw0YHRgSI7DQrQndCw0LTQv9C40YHRjDExLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwxMT5dDQpb0KHQstC+0LnRgdGC0LLQsD5dDQo=";
    ПодключитьВнешнююКомпоненту("C:\444\111\OneScriptForms\OneScriptForms\bin\Debug\OneScriptForms.dll");
    Ф = Новый ФормыДляОдноСкрипта();

    Форма_0 = Ф.Форма();
    Форма_0.Отображать = Истина;
    Форма_0.Показать();
    Форма_0.Активизировать();

    Кнопка1 = Ф.Кнопка();
    Надпись1 = Ф.Надпись();
    Надпись2 = Ф.Надпись();
    Надпись5 = Ф.Надпись();
    Надпись6 = Ф.Надпись();
    ПолеВвода3 = Ф.ПолеВвода();
    ПолеВвода4 = Ф.ПолеВвода();
    Надпись7 = Ф.Надпись();
    ПолеВыбора1 = Ф.ПолеВыбора();
    Надпись8 = Ф.Надпись();
    ПолеВыбора2 = Ф.ПолеВыбора();
    Надпись9 = Ф.Надпись();
    ПолеВвода5 = Ф.ПолеВвода();
    СписокЭлементов1 = Ф.СписокЭлементов();
    Надпись10 = Ф.Надпись();
    Кнопка2 = Ф.Кнопка();
    Кнопка3 = Ф.Кнопка();
    ПолеВыбора3 = Ф.ПолеВыбора();
    Надпись11 = Ф.Надпись();

    Форма_0.Размер = Ф.Размер(649, 645);
    Форма_0.Текст = "Создание события";
    Форма_0.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка1.Родитель = Форма_0;
    Кнопка1.Размер = Ф.Размер(127, 23);
    Кнопка1.ПорядокОбхода = 0;
    Кнопка1.Нажатие = Ф.Действие(ЭтотОбъект, "Кн_Нажатие");
    Кнопка1.Положение = Ф.Точка(470, 571);
    Кнопка1.Текст = "Создать событие";
    Кнопка1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись1.Родитель = Форма_0;
    Надпись1.Размер = Ф.Размер(426, 22);
    Надпись1.ПорядокОбхода = 1;
    Надпись1.Положение = Ф.Точка(18, 552);
    Надпись1.Текст = "Исходные данные лежат в каталоге C:\444\OSDFormsRu";
    Надпись1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись2.Родитель = Форма_0;
    Надпись2.Размер = Ф.Размер(352, 23);
    Надпись2.ПорядокОбхода = 2;
    Надпись2.Положение = Ф.Точка(19, 574);
    Надпись2.Текст = "Выходные данные будут в каталоге C:\000";
    Надпись2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись5.Родитель = Форма_0;
    Надпись5.Размер = Ф.Размер(142, 17);
    Надпись5.ПорядокОбхода = 7;
    Надпись5.Положение = Ф.Точка(19, 69);
    Надпись5.Текст = "СобытиеИмяРус";
    Надпись5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись6.Родитель = Форма_0;
    Надпись6.Размер = Ф.Размер(125, 16);
    Надпись6.ПорядокОбхода = 8;
    Надпись6.Положение = Ф.Точка(320, 70);
    Надпись6.Текст = "СобытиеИмяEn";
    Надпись6.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода3.Родитель = Форма_0;
    ПолеВвода3.Размер = Ф.Размер(296, 22);
    ПолеВвода3.ПорядокОбхода = 9;
    ПолеВвода3.Положение = Ф.Точка(18, 89);
    ПолеВвода3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода4.Родитель = Форма_0;
    ПолеВвода4.Размер = Ф.Размер(296, 22);
    ПолеВвода4.ПорядокОбхода = 10;
    ПолеВвода4.Положение = Ф.Точка(320, 89);
    ПолеВвода4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись7.Родитель = Форма_0;
    Надпись7.Размер = Ф.Размер(157, 18);
    Надпись7.ПорядокОбхода = 11;
    Надпись7.Положение = Ф.Точка(19, 112);
    Надпись7.Текст = "Использование";
    Надпись7.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора1.Родитель = Форма_0;
    ПолеВыбора1.Размер = Ф.Размер(295, 24);
    ПолеВыбора1.ПорядокОбхода = 12;
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Только запись.", "Только запись."));
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Только чтение.", "Только чтение."));
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("Чтение и запись.", "Чтение и запись."));
    ПолеВыбора1.ВысотаЭлемента = 16;
    ПолеВыбора1.Положение = Ф.Точка(19, 133);
    ПолеВыбора1.Текст = "Только запись.";
    ПолеВыбора1.ШиринаВыпадающегоСписка = 295;
    ПолеВыбора1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись8.Родитель = Форма_0;
    Надпись8.Размер = Ф.Размер(132, 17);
    Надпись8.ПорядокОбхода = 13;
    Надпись8.Положение = Ф.Точка(18, 166);
    Надпись8.Текст = "ЗначениеТип";
    Надпись8.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора2.Родитель = Форма_0;
    ПолеВыбора2.Размер = Ф.Размер(597, 24);
    ПолеВыбора2.ПорядокОбхода = 14;
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Булево.", "Булево."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Строка.", "Строка."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Число.", "Число."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Произвольный.", "Произвольный."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора2.ВысотаЭлемента = 16;
    ПолеВыбора2.Положение = Ф.Точка(19, 186);
    ПолеВыбора2.Текст = "Булево.";
    ПолеВыбора2.ШиринаВыпадающегоСписка = 597;
    ПолеВыбора2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись9.Родитель = Форма_0;
    Надпись9.Размер = Ф.Размер(158, 18);
    Надпись9.ПорядокОбхода = 15;
    Надпись9.Положение = Ф.Точка(18, 219);
    Надпись9.Текст = "ЗначениеОписание";
    Надпись9.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода5.Родитель = Форма_0;
    ПолеВвода5.Размер = Ф.Размер(597, 87);
    ПолеВвода5.ПорядокОбхода = 16;
    ПолеВвода5.МногострочныйРежим = Истина;
    ПолеВвода5.Положение = Ф.Точка(19, 240);
    ПолеВвода5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    СписокЭлементов1.Родитель = Форма_0;
    СписокЭлементов1.Размер = Ф.Размер(518, 187);
    СписокЭлементов1.ПорядокОбхода = 17;
    СписокЭлементов1.Флажки = Истина;
    СписокЭлементов1Колонка0 = Ф.Колонка();
    СписокЭлементов1Колонка0.Текст = "Тег";
    СписокЭлементов1Колонка0.Ширина = 150;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка0);
    СписокЭлементов1Колонка1 = Ф.Колонка();
    СписокЭлементов1Колонка1.Текст = "КлассРус";
    СписокЭлементов1Колонка1.Ширина = 202;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка1);
    СписокЭлементов1Колонка2 = Ф.Колонка();
    СписокЭлементов1Колонка2.Текст = "КлассАнгл";
    СписокЭлементов1Колонка2.Ширина = 160;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка2);
    СписокЭлементов1.Положение = Ф.Точка(18, 362);
    СписокЭлементов1.РежимОтображения = Ф.РежимОтображения.Подробно;
    СписокЭлементов1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись10.Родитель = Форма_0;
    Надпись10.Размер = Ф.Размер(142, 23);
    Надпись10.ПорядокОбхода = 18;
    Надпись10.Положение = Ф.Точка(19, 336);
    Надпись10.Текст = "Применимо к";
    Надпись10.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка2.Родитель = Форма_0;
    Кнопка2.Размер = Ф.Размер(74, 43);
    Кнопка2.ПорядокОбхода = 19;
    Кнопка2.Нажатие = Ф.Действие(ЭтотОбъект, "СнятьВсе");
    Кнопка2.Положение = Ф.Точка(542, 366);
    Кнопка2.Текст = "Снять все";
    Кнопка2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка3.Родитель = Форма_0;
    Кнопка3.Размер = Ф.Размер(74, 43);
    Кнопка3.ПорядокОбхода = 20;
    Кнопка3.Нажатие = Ф.Действие(ЭтотОбъект, "ПометитьВсе");
    Кнопка3.Положение = Ф.Точка(542, 415);
    Кнопка3.Текст = "Пометить все";
    Кнопка3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора3.Родитель = Форма_0;
    ПолеВыбора3.Размер = Ф.Размер(295, 24);
    ПолеВыбора3.ПорядокОбхода = 21;
    ПолеВыбора3.ВысотаЭлемента = 16;
    ПолеВыбора3.Положение = Ф.Точка(19, 42);
    ПолеВыбора3.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись11.Родитель = Форма_0;
    Надпись11.Размер = Ф.Размер(153, 16);
    Надпись11.ПорядокОбхода = 22;
    Надпись11.Положение = Ф.Точка(19, 23);
    Надпись11.Текст = "Класс";
    Надпись11.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

КонецПроцедуры

Функция РазобратьСтроку(Строка, Разделитель)
	Стр = СтрЗаменить(Строка,Разделитель,символы.ПС);
	М = Новый Массив;
	Если ПустаяСтрока(Стр) Тогда
		Возврат М;
	КонецЕсли;
	Для Ч = 1 По СтрЧислоСтрок(Стр) Цикл
		М.Добавить(СтрПолучитьСтроку(Стр,Ч));
	КонецЦикла;
	Возврат М;
КонецФункции

Функция СтрНайтиМежду(СтрПараметр, Фрагмент1 = Неопределено, Фрагмент2 = Неопределено, ИсключитьФрагменты = Истина, БезНаложения = Истина)
	//Стр - исходная строка
	//Фрагмент1 - подстрока поиска от которой ведем поиск
	//Фрагмент2 - подстрока поиска до которой ведем поиск
	//ИсключитьФрагменты - не включать Фрагмент1 и Фрагмент2 в результат
	//БезНаложения - в результат не будут включены участки, содержащие другие найденные участки, удовлетворяющие переданным параметрам
	//функция возвращает массив строк
	Стр = СтрПараметр;
	М = Новый Массив;
	Если (Фрагмент1 <> Неопределено) и (Фрагмент2 = Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент1);
		Пока Позиция > 0 Цикл
			М.Добавить(?(ИсключитьФрагменты, Сред(Стр, Позиция + СтрДлина(Фрагмент1)), Сред(Стр, Позиция)));
			Стр = Сред(Стр, Позиция + 1);
			Позиция = Найти(Стр, Фрагмент1);
		КонецЦикла;
	ИначеЕсли (Фрагмент1 = Неопределено) и (Фрагмент2 <> Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент2);
		СуммаПозиций = Позиция;
		Пока Позиция > 0 Цикл
			М.Добавить(?(ИсключитьФрагменты, Сред(Стр, 1, СуммаПозиций - 1), Сред(Стр, 1, СуммаПозиций - 1 + СтрДлина(Фрагмент2))));
			Позиция = Найти(Сред(Стр, СуммаПозиций + 1), Фрагмент2);
			СуммаПозиций = СуммаПозиций + Позиция;
		КонецЦикла;
	ИначеЕсли (Фрагмент1 <> Неопределено) и (Фрагмент2 <> Неопределено) Тогда
		Позиция = Найти(Стр, Фрагмент1);
		Пока Позиция > 0 Цикл
			Стр2 = ?(ИсключитьФрагменты, Сред(Стр, Позиция + СтрДлина(Фрагмент1)), Сред(Стр, Позиция));
			Позиция2 = Найти(Стр2, Фрагмент2);
			СуммаПозиций2 = Позиция2;
			Пока Позиция2 > 0 Цикл
				Если БезНаложения Тогда
					Если Найти(Сред(Стр2, 1, СуммаПозиций2 - 1), Фрагмент2) = 0 Тогда
						М.Добавить("" + ?(ИсключитьФрагменты, Сред(Стр2, 1, СуммаПозиций2 - 1), Сред(Стр2, 1, СуммаПозиций2 - 1 + СтрДлина(Фрагмент2))));
					КонецЕсли;
				Иначе
					М.Добавить("" + ?(ИсключитьФрагменты, Сред(Стр2, 1, СуммаПозиций2 - 1), Сред(Стр2, 1, СуммаПозиций2 - 1 + СтрДлина(Фрагмент2))));
				КонецЕсли;
				Позиция2 = Найти(Сред(Стр2, СуммаПозиций2 + 1), Фрагмент2);
				СуммаПозиций2 = СуммаПозиций2 + Позиция2;
			КонецЦикла;
			Стр = Сред(Стр, Позиция + 1);
			Позиция = Найти(Стр, Фрагмент1);
		КонецЦикла;
	КонецЕсли;
	
	Возврат М;
КонецФункции//СтрНайтиМежду

ПодготовкаКомпонентов();

ВыходнойКаталог = "C:\000";// без слэша в конце
КлассИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
КлассИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
СобытиеИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
СобытиеИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
Использование = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
ЗначениеТип = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
ЗначениеОписание = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!

СтрКлассов = 
"Абзац,Paragraph,<p;" + 
"Аудио,Audio,<audio;" + 
"Блок,Div,<div;" + 
"Видео,Video,<video;" + 
"ВыборВремени,TimeSelection,<input time;" + 
"ВыборДаты,DateSelection,<input date;" + 
"ВыборДатыВремени,DateTimeSelection,<input datetime;" + 
"ВыборМестнойДатыВремени,DateTimeLocalSelection,<input datetime-local;" + 
"ВыборМесяца,MonthSelection,<input month;" + 
"ВыборНедели,WeekSelection,<input week;" + 
"ВыборФайла,FileSelection,<input file;" + 
"ВыборЦвета,ColorSelection,<input color;" + 
"Группа,Group,<fieldset;" + 
"ГруппаКолонок,Colgroup,<colgroup;" + 
"ГруппировкаПоляСписка,SelectGroup,<optgroup;" + 
"ДекларативныеФормы,DeclarativeForms,<;" + 
"Диалог,Dialog,<dialog;" + 
"ДополнительныйБлок,AdditionalDiv,<aside;" + 
"ЖирныйТекст,BoldText,<b;" + 
"Заголовок,Caption,<caption;" + 
"Заголовок1,H1,<h1;" + 
"Заголовок2,H2,<h2;" + 
"Заголовок3,H3,<h3;" + 
"Заголовок4,H4,<h4;" + 
"Заголовок5,H5,<h5;" + 
"Заголовок6,H6,<h6;" + 
"ЗаголовокГруппы,GroupTitle,<legend;" + 
"ЗаголовокКолонки,HeaderCell,<th;" + 
"ЗаголовокРаскрываемогоБлока,ExpandableDivHeader,<summary;" + 
"Изображение,Image,<img;" + 
"Индикатор,Progress,<progress;" + 
"Итоги,Outcome,<tfoot;" + 
"Карта,Map,<map;" + 
"Кнопка,Button,<button;" + 
"Код,Code,<code;" + 
"Колонка,Column,<col;" + 
"Колонтитул,Header,<header;" + 
"Контент,Body,<body;" + 
"КурсивТекст,ItalicsText,<cite;" + 
"Линия,Line,<hr;" + 
"МаркированныйТекст,MarkedText,<mark;" + 
"МедиаГруппа,MediaGroup,<figure;" + 
"МелкийТекст,SmallText,<small;" + 
"НадстрочныйТекст,SupText,<sup;" + 
"НаправленныйТекст,DirectedText,<bdo;" + 
"НеупорядоченныйСписок,UnorderedList,<ul;" + 
"НижнийКолонтитул,Footer,<footer;" + 
"Область,Area,<area;" + 
"ОбластьТаблицы,TableBody,<tbody;" + 
"ОбластьТекста,TextArea,<textarea;" + 
"ОписаниеМедиа,CaptionMedia,<figcaption;" + 
"Определение,Definition,<dd;" + 
"Переключатель,Radio,<input radio;" + 
"Перенос,Transfer,<br;" + 
"Подпись,Label,<input label;" + 
"ПодстрочныйТекст,SubText,<sub;" + 
"ПодчеркнутыйТекст,UnderlineText,<u;" + 
"ПолеПароля,PasswordField,<input password;" + 
"ПолеПоиска,SearchField,<input search;" + 
"ПолеСписка,Select,<select;" + 
"ПолеТекста,TextField,<input text;" + 
"ПолеЧисла,NumberField,<input number;" + 
"Ползунок,Range,<input range;" + 
"РаскрываемыйБлок,ExpandableDiv,<details;" + 
"Результат,Output,<output;" + 
"СписокДанных,Datalist,<datalist;" + 
"СписокОпределений,ListDefinition,<dl;" + 
"Ссылка,Link,<a;" + 
"СтрокаТаблицы,TableRow,<tr;" + 
"Таблица,Table,<table;" + 
"Термин,Term,<dt;" + 
"УдаленыйТекст,DeletedText,<del;" + 
"УпорядоченныйСписок,OrderedList,<ol;" + 
"Флажок,CheckBox,<input checkbox;" + 
"ФорматированныйТекст,PreformattedText,<pre;" + 
"Фрейм,Frame,<iframe;" + 
"Холст,Canvas,<canvas;" + 
"ШапкаТаблицы,TableHeader,<thead;" + 
"Шкала,Meter,<meter;" + 
"Элемент,Element,<;" + 
"ЭлементПоляСписка,SelectItem,<option;" + 
"ЭлементСписка,ListItem,<li;" + 
"Ячейка,Cell,<td";

НачальноеЗаполнениеФормы();

Ф.ЗапуститьОбработкуСобытий();
