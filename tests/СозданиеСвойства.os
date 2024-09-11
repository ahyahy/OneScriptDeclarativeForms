Перем Ф;
Перем Форма_0;
Перем Кнопка1;
Перем Надпись1;
Перем Надпись3;
Перем Надпись4;
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
Перем СвойствоИмяРус;
Перем СвойствоИмяEn;
Перем Использование;
Перем ЗначениеТип;
Перем ЗначениеОписание;
Перем ВыходнойКаталог;
Перем ПолеВыбора3;
Перем СтрКлассов;
Перем Надпись10;
Перем СписокЭлементов1;
Перем Надпись2;
Перем Кнопка2;
Перем Кнопка3;
Перем СтрЗаполненияСвойства;

Процедура Кн_Нажатие() Экспорт
	М = РазобратьСтроку(ПолеВыбора3.Текст, " ");
	КлассИмяРус = М[0];
	КлассИмяEn = М[1];
	СвойствоИмяРус = СокрЛП(ПолеВвода3.Текст);
	СвойствоИмяEn = СокрЛП(ПолеВвода4.Текст);
	Использование = СокрЛП(ПолеВыбора1.Текст);
	ЗначениеТип = СокрЛП(ПолеВыбора2.Текст);
	ЗначениеОписание = СокрЛП(ПолеВвода5.Текст);
	
	СоздатьСвойство();
КонецПроцедуры

Процедура НачальноеЗаполнениеФормы()
	ПолеВыбора3.Текст = "Элемент Element";
	ПолеВвода3.Текст = "";
	ПолеВвода4.Текст = "";
	ПолеВвода5.Текст = "";
	ПолеВыбора1.Текст = "";
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
	
	М3 = РазобратьСтроку(СтрЗаполненияСвойства, Символы.ПС);
	Для А3 = 0 По М3.ВГраница() Цикл
		Если СтрНайти(М3[А3], "ЭтоКласс") > 0 Тогда
			ПолеВыбора3.Текст = СокрЛП(СтрЗаменить(М3[А3], "ЭтоКласс", ""));
		ИначеЕсли СтрНайти(М3[А3], "СвойствоИмяРус") > 0 Тогда
			ПолеВвода3.Текст = СокрЛП(СтрЗаменить(М3[А3], "СвойствоИмяРус", ""));
		ИначеЕсли СтрНайти(М3[А3], "СвойствоИмяEn") > 0 Тогда
			ПолеВвода4.Текст = СокрЛП(СтрЗаменить(М3[А3], "СвойствоИмяEn", ""));
		ИначеЕсли СтрНайти(М3[А3], "ЭтоИспользование") > 0 Тогда
			ПолеВыбора1.Текст = СокрЛП(СтрЗаменить(М3[А3], "ЭтоИспользование", ""));
		ИначеЕсли СтрНайти(М3[А3], "ЗначениеТип") > 0 Тогда
			ПолеВыбора2.Текст = СокрЛП(СтрЗаменить(М3[А3], "ЗначениеТип", ""));
		ИначеЕсли СтрНайти(М3[А3], "ЗначениеОписание") > 0 Тогда
			ПолеВвода5.Текст = СокрЛП(СтрЗаменить(М3[А3], "ЗначениеОписание", ""));
		КонецЕсли;
	КонецЦикла;
	
	// ПометитьВсе();
КонецПроцедуры

Процедура СоздатьСвойство()
	Стр = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
	|<HTML><HEAD><TITLE>SVOJSTVO Property</TITLE>
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
	|<H1 class=dtH1>ККЛЛААСС.ССВВООЙЙССТТВВОО&nbsp;(CCLLAASS.SVOJSTVO)&nbsp;Свойство</H1></DIV></DIV>
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

	ПодстрокаПоиска = "ССВВООЙЙССТТВВОО";
	ПодстрокаЗамены = СвойствоИмяРус;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "SVOJSTVO";
	ПодстрокаЗамены = СвойствоИмяEn;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn + СвойствоИмяEn + "Property.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);

	// Добавим ссылку в C:\444\OSDFormsRu\contents.htm ====================================================================================
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать("C:\444\OSDFormsRu\contents.htm");
	Стр = ТекстДок.ПолучитьТекст();
	// d.add(38,0,"Свойства","Properties.html");
	Стр3 = "";
	М_Стр = РазобратьСтроку(Стр, ";");
	Для А = 0 По М_Стр.ВГраница() Цикл
		Если СтрНайти(М_Стр[А], """Свойства"",""Properties.html"")") > 0 Тогда
			Стр3 = М_Стр[А];
		КонецЕсли;
	КонецЦикла;
	М_Номер = СтрНайтиМежду(Стр, "d.add(", ",""Свойства"",""Properties.html", Ложь, );
	Номер = М_Номер[М_Номер.ВГраница()];
	М_Номер2 = СтрНайтиМежду(Номер, "(", ",", , );
	Номер = М_Номер2[0];
	М = СтрНайтиМежду(Стр, 
		"""Свойства"",""Properties.html"");", 
		"add", 
		Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		// d.add(42,38,"Высота (Height) (Form)","OSDForms.FormHeightProperty.html");
		ПодстрокаЗамены = """Свойства"",""Properties.html"");
		|d.add(8000," + Номер + ",""" + СвойствоИмяРус + " (" + СвойствоИмяEn + ") (" + КлассИмяРус + ")"",""OSDForms." + КлассИмяEn + СвойствоИмяEn + "Property.html"");
		|d.add";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;

	ИмяФайла = ВыходнойКаталог + "\contents.htm";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);

	// Изменим C:\444\OSDFormsRu\Properties.html ====================================================================================
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать("C:\444\OSDFormsRu\Properties.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"    <TH width=""50%"">Свойства (Properties)</TH>
		|    <TH width=""50%"">Описание</TH></TR>",
		"<TR vAlign=top>", 
		Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><A href=""OSDForms." + КлассИмяEn + СвойствоИмяEn + "Property.html"">" + СвойствоИмяРус + "&nbsp;(" + СвойствоИмяEn + ") (" + КлассИмяРус + ")</A></TD>
		|    <TD width=""50%"">" + ЗначениеОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;
	ИмяФайла = ВыходнойКаталог + "\Properties.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	
	// Изменим C:\444\OSDFormsRu\OSDForms.КЛАССProperties.html ====================================================================================
	Если Не (КлассИмяEn = "") Тогда
		ТекстДок = Новый ТекстовыйДокумент;
		ТекстДок.Прочитать("C:\444\OSDFormsRu\OSDForms." + КлассИмяEn + "Properties.html");
		Стр = ТекстДок.ПолучитьТекст();
		М = СтрНайтиМежду(Стр, 
				"<H4 class=dtH4>Свойства</H4>
				|<DIV class=tablediv>
				|<TABLE class=dtTABLE cellSpacing=0>
				|  <TBODY>", 
				"<TR vAlign=top>", 
				Ложь, );
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><IMG src=""pubproperty.gif""></IMG><A href=""OSDForms." + КлассИмяEn + СвойствоИмяEn + "Property.html"">" + СвойствоИмяРус + "&nbsp;(" + СвойствоИмяEn + ")</A></TD>
		|    <TD width=""50%"">" + ЗначениеОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

		ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn + "Properties.html";
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
		ТекстДок.Прочитать("C:\444\OSDFormsRu\OSDForms." + КлассИмяEn2 + "Properties.html");
		Стр = ТекстДок.ПолучитьТекст();
		М = СтрНайтиМежду(Стр, 
				"<H4 class=dtH4>Свойства</H4>
				|<DIV class=tablediv>
				|<TABLE class=dtTABLE cellSpacing=0>
				|  <TBODY>", 
				"<TR vAlign=top>", 
				Ложь, );
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><IMG src=""pubproperty.gif""></IMG><A href=""OSDForms." + КлассИмяEn + СвойствоИмяEn + "Property.html"">" + СвойствоИмяРус + "&nbsp;(" + СвойствоИмяEn + ")</A></TD>
		|    <TD width=""50%"">" + ЗначениеОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

		ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn2 + "Properties.html";
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
    // osdText = "WzzQmtC+0L3RgdGC0YDRg9C60YLQvtGA0YtdDQrQpNC+0YDQvNCwXzAgPSDQpC7QpNC+0YDQvNCwKCk7DQrQmtC90L7Qv9C60LAxID0g0KQu0JrQvdC+0L/QutCwKCk7DQrQndCw0LTQv9C40YHRjDEgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwyID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMMyA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQndCw0LTQv9C40YHRjDUgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0Yw2ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDMgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDQgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMNyA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEgPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J3QsNC00L/QuNGB0Yw4ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMiA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDkgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwNSA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCd0LDQtNC/0LjRgdGMMTAgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMSA9INCkLtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsigpOw0K0JrQvdC+0L/QutCwMiA9INCkLtCa0L3QvtC/0LrQsCgpOw0K0JrQvdC+0L/QutCwMyA9INCkLtCa0L3QvtC/0LrQsCgpOw0KW9Ca0L7QvdGB0YLRgNGD0LrRgtC+0YDRiz5dDQpbPNCh0LLQvtC50YHRgtCy0LBdDQpbPNCk0L7RgNC80LBfMF0NCtCk0L7RgNC80LBfMC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNjQ5LCA2NDIpOw0K0KTQvtGA0LzQsF8wLtCf0YPRgtGMID0gIkM6XDQ0NFw5LdCX0LDQs9C+0YLQvtCy0LrQuNCU0LXQutC70LDRgNCk0L7RgNC8XNCh0L7Qt9C00LDQvdC40LXQodCy0L7QudGB0YLQstCwMi5vcyI7DQrQpNC+0YDQvNCwXzAu0KHRgtC40LvRjNCh0LrRgNC40L/RgtCwID0gItCh0YLQuNC70YzQodC60YDQuNC/0YLQsCI7DQrQpNC+0YDQvNCwXzAu0KLQtdC60YHRgiA9ICLQodC+0LfQtNCw0L3QuNC1INGB0LLQvtC50YHRgtCy0LAiOw0K0KTQvtGA0LzQsF8wLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQpNC+0YDQvNCwXzAu0JjQvNGP0J7QsdGK0LXQutGC0LDQpNC+0YDQvNGL0JTQu9GP0J7QtNC90L7QodC60YDQuNC/0YLQsCA9ICLQpCI7DQpb0KTQvtGA0LzQsF8wPl0NCls80JrQvdC+0L/QutCwMV0NCtCa0L3QvtC/0LrQsDEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCa0L3QvtC/0LrQsDEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEyOSwgMjMpOw0K0JrQvdC+0L/QutCwMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDA7DQrQmtC90L7Qv9C60LAxLtCd0LDQttCw0YLQuNC1ID0gItCa0L1f0J3QsNC20LDRgtC40LUiOw0K0JrQvdC+0L/QutCwMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDQ5MiwgNTcxKTsNCtCa0L3QvtC/0LrQsDEu0KLQtdC60YHRgiA9ICLQodC+0LfQtNCw0YLRjCDRgdCy0L7QudGB0YLQstC+IjsNCtCa0L3QvtC/0LrQsDEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQmtC90L7Qv9C60LAxPl0NCls80J3QsNC00L/QuNGB0YwxXQ0K0J3QsNC00L/QuNGB0YwxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDQzNywgMjIpOw0K0J3QsNC00L/QuNGB0YwxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTsNCtCd0LDQtNC/0LjRgdGMMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCA1NDkpOw0K0J3QsNC00L/QuNGB0YwxLtCi0LXQutGB0YIgPSAi0JjRgdGF0L7QtNC90YvQtSDQtNCw0L3QvdGL0LUg0LvQtdC20LDRgiDQsiDQutCw0YLQsNC70L7Qs9C1IEM6XDQ0NFxPU0RGb3Jtc1J1IjsNCtCd0LDQtNC/0LjRgdGMMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMT5dDQpbPNCd0LDQtNC/0LjRgdGMMl0NCtCd0LDQtNC/0LjRgdGMMi7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0YwyLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgzNTIsIDIzKTsNCtCd0LDQtNC/0LjRgdGMMi7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDI7DQrQndCw0LTQv9C40YHRjDIu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgNTcxKTsNCtCd0LDQtNC/0LjRgdGMMi7QotC10LrRgdGCID0gItCS0YvRhdC+0LTQvdGL0LUg0LTQsNC90L3Ri9C1INCx0YPQtNGD0YIg0LIg0LrQsNGC0LDQu9C+0LPQtSBDOlwwMDAiOw0K0J3QsNC00L/QuNGB0YwyLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwyPl0NCls80J3QsNC00L/QuNGB0YwzXQ0K0J3QsNC00L/QuNGB0YwzLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEwMCwgMTUpOw0K0J3QsNC00L/QuNGB0YwzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzsNCtCd0LDQtNC/0LjRgdGMMy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCAxNik7DQrQndCw0LTQv9C40YHRjDMu0KLQtdC60YHRgiA9ICLQmtC70LDRgdGBIjsNCtCd0LDQtNC/0LjRgdGMMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMz5dDQpbPNCd0LDQtNC/0LjRgdGMNV0NCtCd0LDQtNC/0LjRgdGMNS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxNDUsIDE3KTsNCtCd0LDQtNC/0LjRgdGMNS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDc7DQrQndCw0LTQv9C40YHRjDUu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgNjkpOw0K0J3QsNC00L/QuNGB0Yw1LtCi0LXQutGB0YIgPSAi0KHQstC+0LnRgdGC0LLQvtCY0LzRj9Cg0YPRgSI7DQrQndCw0LTQv9C40YHRjDUu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDU+XQ0KWzzQndCw0LTQv9C40YHRjDZdDQrQndCw0LTQv9C40YHRjDYu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMNi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTM2LCAxNik7DQrQndCw0LTQv9C40YHRjDYu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA4Ow0K0J3QsNC00L/QuNGB0Yw2LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzIwLCA3MCk7DQrQndCw0LTQv9C40YHRjDYu0KLQtdC60YHRgiA9ICLQodCy0L7QudGB0YLQstC+0JjQvNGPRW4iOw0K0J3QsNC00L/QuNGB0Yw2LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw2Pl0NCls80J/QvtC70LXQktCy0L7QtNCwM10NCtCf0L7Qu9C10JLQstC+0LTQsDMu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDk7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDg5KTsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAzPl0NCls80J/QvtC70LXQktCy0L7QtNCwNF0NCtCf0L7Qu9C10JLQstC+0LTQsDQu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLQstC+0LTQsDQu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwNC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDEwOw0K0J/QvtC70LXQktCy0L7QtNCwNC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDMyMCwgODkpOw0K0J/QvtC70LXQktCy0L7QtNCwNC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLQstC+0LTQsDQ+XQ0KWzzQndCw0LTQv9C40YHRjDddDQrQndCw0LTQv9C40YHRjDcu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMNy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTQ1LCAxOCk7DQrQndCw0LTQv9C40YHRjDcu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxMTsNCtCd0LDQtNC/0LjRgdGMNy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCAxMTIpOw0K0J3QsNC00L/QuNGB0Yw3LtCi0LXQutGB0YIgPSAi0JjRgdC/0L7Qu9GM0LfQvtCy0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0Yw3LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw3Pl0NCls80J/QvtC70LXQktGL0LHQvtGA0LAxXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NSwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDEzMyk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KLQtdC60YHRgiA9ICLQotC+0LvRjNC60L4g0LfQsNC/0LjRgdGMLiI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDI5NTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQvtC70YzQutC+INC30LDQv9C40YHRjC4iLCAi0KLQvtC70YzQutC+INC30LDQv9C40YHRjC4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC+0LvRjNC60L4g0YfRgtC10L3QuNC1LiIsICLQotC+0LvRjNC60L4g0YfRgtC10L3QuNC1LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCn0YLQtdC90LjQtSDQuCDQt9Cw0L/QuNGB0YwuIiwgItCn0YLQtdC90LjQtSDQuCDQt9Cw0L/QuNGB0YwuIikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMT5dDQpbPNCd0LDQtNC/0LjRgdGMOF0NCtCd0LDQtNC/0LjRgdGMOC7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw4LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE3KTsNCtCd0LDQtNC/0LjRgdGMOC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDEzOw0K0J3QsNC00L/QuNGB0Yw4LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDE2Nik7DQrQndCw0LTQv9C40YHRjDgu0KLQtdC60YHRgiA9ICLQl9C90LDRh9C10L3QuNC10KLQuNC/IjsNCtCd0LDQtNC/0LjRgdGMOC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMOD5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMl0NCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg1OTcsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDE0Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCAxODYpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCi0LXQutGB0YIgPSAi0JHRg9C70LXQstC+LiI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDU5NzsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0JHRg9C70LXQstC+LiIsICLQkdGD0LvQtdCy0L4uIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KHRgtGA0L7QutCwLiIsICLQodGC0YDQvtC60LAuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KfQuNGB0LvQvi4iLCAi0KfQuNGB0LvQvi4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIiwgItCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQudC50LnQudC50LnQudC50LnQuSAgINC50LnQudC50LnQudC50LnQudC5IiwgItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiKSk7DQpb0J/QvtC70LXQktGL0LHQvtGA0LAyPl0NCls80J3QsNC00L/QuNGB0Yw5XQ0K0J3QsNC00L/QuNGB0Yw5LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDku0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDE2NCwgMTgpOw0K0J3QsNC00L/QuNGB0Yw5LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTU7DQrQndCw0LTQv9C40YHRjDku0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgMjE5KTsNCtCd0LDQtNC/0LjRgdGMOS7QotC10LrRgdGCID0gItCX0L3QsNGH0LXQvdC40LXQntC/0LjRgdCw0L3QuNC1IjsNCtCd0LDQtNC/0LjRgdGMOS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMOT5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDVdDQrQn9C+0LvQtdCS0LLQvtC00LA1LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDUu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDU5NywgODcpOw0K0J/QvtC70LXQktCy0L7QtNCwNS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDE2Ow0K0J/QvtC70LXQktCy0L7QtNCwNS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCAyNDApOw0K0J/QvtC70LXQktCy0L7QtNCwNS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLQstC+0LTQsDU+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDNdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk1LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxNzsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgMzkpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSAyOTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDM+XQ0KWzzQndCw0LTQv9C40YHRjDEwXQ0K0J3QsNC00L/QuNGB0YwxMC7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0YwxMC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTI4LCAyMyk7DQrQndCw0LTQv9C40YHRjDEwLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTg7DQrQndCw0LTQv9C40YHRjDEwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDMzOSk7DQrQndCw0LTQv9C40YHRjDEwLtCi0LXQutGB0YIgPSAi0J/RgNC40LzQtdC90LjQvNC+INC6IjsNCtCd0LDQtNC/0LjRgdGMMTAu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDEwPl0NCls80KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMV0NCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDUyMCwgMTgxKTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxOTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0KTQu9Cw0LbQutC4ID0g0JjRgdGC0LjQvdCwOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMCA9INCkLtCa0L7Qu9C+0L3QutCwKCk7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAwLtCi0LXQutGB0YIgPSAi0KLQtdCzIjsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDAu0KjQuNGA0LjQvdCwID0gMTYyOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7QmtC+0LvQvtC90LrQuC7QlNC+0LHQsNCy0LjRgtGMKNCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDApOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMSA9INCkLtCa0L7Qu9C+0L3QutCwKCk7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAxLtCi0LXQutGB0YIgPSAi0JrQu9Cw0YHRgdCg0YPRgSI7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAxLtCo0LjRgNC40L3QsCA9IDIwNzsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0JrQvtC70L7QvdC60Lgu0JTQvtCx0LDQstC40YLRjCjQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAxKTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDIgPSDQpC7QmtC+0LvQvtC90LrQsCgpOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMi7QotC10LrRgdGCID0gItCa0LvQsNGB0YHQkNC90LPQuyI7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAyLtCo0LjRgNC40L3QsCA9IDIxODsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0JrQvtC70L7QvdC60Lgu0JTQvtCx0LDQstC40YLRjCjQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAyKTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgMzY1KTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEu0KDQtdC20LjQvNCe0YLQvtCx0YDQsNC20LXQvdC40Y8gPSDQpC7QoNC10LbQuNC80J7RgtC+0LHRgNCw0LbQtdC90LjRjy7Qn9C+0LTRgNC+0LHQvdC+Ow0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Ch0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjE+XQ0KWzzQmtC90L7Qv9C60LAyXQ0K0JrQvdC+0L/QutCwMi7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0JrQvdC+0L/QutCwMi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNzYsIDQyKTsNCtCa0L3QvtC/0LrQsDIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyMDsNCtCa0L3QvtC/0LrQsDIu0J3QsNC20LDRgtC40LUgPSAi0KHQvdGP0YLRjNCS0YHQtSI7DQrQmtC90L7Qv9C60LAyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNTQ1LCAzNzQpOw0K0JrQvdC+0L/QutCwMi7QotC10LrRgdGCID0gItCh0L3Rj9GC0Ywg0LLRgdC1IjsNCtCa0L3QvtC/0LrQsDIu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQmtC90L7Qv9C60LAyPl0NCls80JrQvdC+0L/QutCwM10NCtCa0L3QvtC/0LrQsDMu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCa0L3QvtC/0LrQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDc2LCA0Mik7DQrQmtC90L7Qv9C60LAzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjE7DQrQmtC90L7Qv9C60LAzLtCd0LDQttCw0YLQuNC1ID0gItCf0L7QvNC10YLQuNGC0YzQktGB0LUiOw0K0JrQvdC+0L/QutCwMy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDU0NSwgNDIyKTsNCtCa0L3QvtC/0LrQsDMu0KLQtdC60YHRgiA9ICLQn9C+0LzQtdGC0LjRgtGMINCy0YHQtSI7DQrQmtC90L7Qv9C60LAzLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0JrQvdC+0L/QutCwMz5dDQpb0KHQstC+0LnRgdGC0LLQsD5dDQo=";
    ПодключитьВнешнююКомпоненту("C:\444\111\OneScriptForms\OneScriptForms\bin\Debug\OneScriptForms.dll");
    Ф = Новый ФормыДляОдноСкрипта();

    Форма_0 = Ф.Форма();
    Форма_0.Отображать = Истина;
    Форма_0.Показать();
    Форма_0.Активизировать();

    Кнопка1 = Ф.Кнопка();
    Надпись1 = Ф.Надпись();
    Надпись2 = Ф.Надпись();
    Надпись3 = Ф.Надпись();
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
    ПолеВыбора3 = Ф.ПолеВыбора();
    Надпись10 = Ф.Надпись();
    СписокЭлементов1 = Ф.СписокЭлементов();
    Кнопка2 = Ф.Кнопка();
    Кнопка3 = Ф.Кнопка();

    Форма_0.Размер = Ф.Размер(649, 642);
    Форма_0.Текст = "Создание свойства";
    Форма_0.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка1.Родитель = Форма_0;
    Кнопка1.Размер = Ф.Размер(129, 23);
    Кнопка1.ПорядокОбхода = 0;
    Кнопка1.Нажатие = Ф.Действие(ЭтотОбъект, "Кн_Нажатие");
    Кнопка1.Положение = Ф.Точка(492, 571);
    Кнопка1.Текст = "Создать свойство";
    Кнопка1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись1.Родитель = Форма_0;
    Надпись1.Размер = Ф.Размер(437, 22);
    Надпись1.ПорядокОбхода = 1;
    Надпись1.Положение = Ф.Точка(18, 549);
    Надпись1.Текст = "Исходные данные лежат в каталоге C:\444\OSDFormsRu";
    Надпись1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись2.Родитель = Форма_0;
    Надпись2.Размер = Ф.Размер(352, 23);
    Надпись2.ПорядокОбхода = 2;
    Надпись2.Положение = Ф.Точка(19, 571);
    Надпись2.Текст = "Выходные данные будут в каталоге C:\000";
    Надпись2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись3.Родитель = Форма_0;
    Надпись3.Размер = Ф.Размер(100, 15);
    Надпись3.ПорядокОбхода = 3;
    Надпись3.Положение = Ф.Точка(19, 16);
    Надпись3.Текст = "Класс";
    Надпись3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись5.Родитель = Форма_0;
    Надпись5.Размер = Ф.Размер(145, 17);
    Надпись5.ПорядокОбхода = 7;
    Надпись5.Положение = Ф.Точка(19, 69);
    Надпись5.Текст = "СвойствоИмяРус";
    Надпись5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись6.Родитель = Форма_0;
    Надпись6.Размер = Ф.Размер(136, 16);
    Надпись6.ПорядокОбхода = 8;
    Надпись6.Положение = Ф.Точка(320, 70);
    Надпись6.Текст = "СвойствоИмяEn";
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
    Надпись7.Размер = Ф.Размер(145, 18);
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
    Надпись8.Размер = Ф.Размер(100, 17);
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
    Надпись9.Размер = Ф.Размер(164, 18);
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

    ПолеВыбора3.Родитель = Форма_0;
    ПолеВыбора3.Размер = Ф.Размер(295, 24);
    ПолеВыбора3.ПорядокОбхода = 17;
    ПолеВыбора3.ВысотаЭлемента = 16;
    ПолеВыбора3.Положение = Ф.Точка(19, 39);
    ПолеВыбора3.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись10.Родитель = Форма_0;
    Надпись10.Размер = Ф.Размер(128, 23);
    Надпись10.ПорядокОбхода = 18;
    Надпись10.Положение = Ф.Точка(26, 339);
    Надпись10.Текст = "Применимо к";
    Надпись10.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    СписокЭлементов1.Родитель = Форма_0;
    СписокЭлементов1.Размер = Ф.Размер(520, 181);
    СписокЭлементов1.ПорядокОбхода = 19;
    СписокЭлементов1.Флажки = Истина;
    СписокЭлементов1Колонка0 = Ф.Колонка();
    СписокЭлементов1Колонка0.Текст = "Тег";
    СписокЭлементов1Колонка0.Ширина = 162;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка0);
    СписокЭлементов1Колонка1 = Ф.Колонка();
    СписокЭлементов1Колонка1.Текст = "КлассРус";
    СписокЭлементов1Колонка1.Ширина = 207;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка1);
    СписокЭлементов1Колонка2 = Ф.Колонка();
    СписокЭлементов1Колонка2.Текст = "КлассАнгл";
    СписокЭлементов1Колонка2.Ширина = 218;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка2);
    СписокЭлементов1.Положение = Ф.Точка(19, 365);
    СписокЭлементов1.РежимОтображения = Ф.РежимОтображения.Подробно;
    СписокЭлементов1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка2.Родитель = Форма_0;
    Кнопка2.Размер = Ф.Размер(76, 42);
    Кнопка2.ПорядокОбхода = 20;
    Кнопка2.Нажатие = Ф.Действие(ЭтотОбъект, "СнятьВсе");
    Кнопка2.Положение = Ф.Точка(545, 374);
    Кнопка2.Текст = "Снять все";
    Кнопка2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка3.Родитель = Форма_0;
    Кнопка3.Размер = Ф.Размер(76, 42);
    Кнопка3.ПорядокОбхода = 21;
    Кнопка3.Нажатие = Ф.Действие(ЭтотОбъект, "ПометитьВсе");
    Кнопка3.Положение = Ф.Точка(545, 422);
    Кнопка3.Текст = "Пометить все";
    Кнопка3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

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
СвойствоИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
СвойствоИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
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

// СтрЗаполненияСвойства = "";
СтрЗаполненияСвойства = "
|	ЭтоКласс	Стиль Style
|	СвойствоИмяРус	Границы
|	СвойствоИмяEn	Borders
|	ЭтоИспользование	Чтение и запись.
|	ЗначениеТип	<A href=""OSDForms.Borders.html"">Границы&nbsp;(Borders)</A>.
|	ЗначениеОписание	Возвращает или задает свойства границ в одном объявлении.
|";

НачальноеЗаполнениеФормы();

Ф.ЗапуститьОбработкуСобытий();
