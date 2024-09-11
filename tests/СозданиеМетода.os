Перем Ф;
Перем Вкладка1;
Перем Вкладка2;
Перем Вкладка3;
Перем Вкладка4;
Перем Вкладка5;
Перем Вкладка6;
Перем Вкладка7;
Перем Вкладка8;
Перем Вкладка9;
Перем Вкладка10;
Перем Кнопка1;
Перем Надпись1;
Перем Надпись2;
Перем Надпись3;
Перем Надпись4;
Перем Надпись5;
Перем Надпись6;
Перем Надпись7;
Перем Надпись8;
Перем Надпись9;
Перем Надпись10;
Перем Надпись11;
Перем Надпись12;
Перем Надпись13;
Перем Надпись14;
Перем Надпись15;
Перем Надпись16;
Перем Надпись17;
Перем Надпись18;
Перем Надпись19;
Перем Надпись20;
Перем Надпись21;
Перем Надпись22;
Перем Надпись23;
Перем Надпись24;
Перем Надпись25;
Перем Надпись26;
Перем Надпись27;
Перем Надпись28;
Перем Надпись29;
Перем Надпись30;
Перем Надпись31;
Перем Надпись32;
Перем Надпись33;
Перем Надпись34;
Перем Надпись35;
Перем Надпись36;
Перем Надпись37;
Перем Надпись38;
Перем Надпись39;
Перем Надпись40;
Перем Надпись41;
Перем Надпись42;
Перем Надпись43;
Перем Надпись44;
Перем Надпись45;
Перем Надпись46;
Перем Надпись47;
Перем Надпись48;
Перем Надпись49;
Перем Надпись50;
Перем ПанельВкладок1;
Перем ПолеВвода1;
Перем ПолеВвода2;
Перем ПолеВвода3;
Перем ПолеВвода4;
Перем ПолеВвода5;
Перем ПолеВвода8;
Перем ПолеВвода9;
Перем ПолеВвода10;
Перем ПолеВвода11;
Перем ПолеВвода12;
Перем ПолеВвода13;
Перем ПолеВвода14;
Перем ПолеВвода15;
Перем ПолеВвода16;
Перем ПолеВвода17;
Перем ПолеВвода18;
Перем ПолеВвода19;
Перем ПолеВвода20;
Перем ПолеВвода21;
Перем ПолеВвода22;
Перем ПолеВвода23;
Перем ПолеВвода24;
Перем ПолеВвода25;
Перем ПолеВвода26;
Перем ПолеВвода27;
Перем ПолеВвода28;
Перем ПолеВыбора1;
Перем ПолеВыбора2;
Перем ПолеВыбора3;
Перем ПолеВыбора4;
Перем ПолеВыбора5;
Перем ПолеВыбора6;
Перем ПолеВыбора7;
Перем ПолеВыбора8;
Перем ПолеВыбора9;
Перем ПолеВыбора10;
Перем ПолеВыбора11;
Перем ПолеВыбора12;
Перем ПолеВыбора13;
Перем ПолеВыбора14;
Перем ПолеВыбора15;
Перем ПолеВыбора16;
Перем ПолеВыбора17;
Перем ПолеВыбора18;
Перем ПолеВыбора19;
Перем ПолеВыбора20;
Перем ПолеВыбора21;
Перем Форма_0;

Перем КлассИмяРус;
Перем КлассИмяEn;
Перем МетодИмяРус;
Перем МетодИмяEn;
Перем МетодОписание;
Перем ВозвращаемоеЗначениеТип;
Перем ВозвращаемоеЗначениеОписание;
Перем М_Параметров;
Перем ВыходнойКаталог;
Перем Наследники;
Перем ПолеВыбора22;
Перем СтрКлассов;
Перем Кнопка2;
Перем Кнопка3;
Перем Надпись51;
Перем ПолеСписка1;
Перем СписокЭлементов1;

Процедура Кн1_Нажатие() Экспорт
	М = РазобратьСтроку(ПолеВыбора22.Текст, " ");
	КлассИмяРус = М[0];
	КлассИмяEn = М[1];
	МетодИмяРус = СокрЛП(ПолеВвода4.Текст);
	МетодИмяEn = СокрЛП(ПолеВвода5.Текст);
	МетодОписание = СокрЛП(ПолеВвода3.Текст);
	ВозвращаемоеЗначениеТип = СокрЛП(ПолеВыбора2.Текст);
	ВозвращаемоеЗначениеОписание = СокрЛП(ПолеВвода8.Текст);
	
	М_Параметров.Очистить();
	
	Если Не (СокрЛП(ПолеВвода9.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода9.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора1.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора3.Текст);
		Парам1Описание = СокрЛП(ПолеВвода10.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода12.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода12.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора5.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора4.Текст);
		Парам1Описание = СокрЛП(ПолеВвода11.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода14.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода14.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора7.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора6.Текст);
		Парам1Описание = СокрЛП(ПолеВвода13.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода16.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода16.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора9.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора8.Текст);
		Парам1Описание = СокрЛП(ПолеВвода15.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода18.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода18.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора11.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора10.Текст);
		Парам1Описание = СокрЛП(ПолеВвода17.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода20.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода20.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора13.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора12.Текст);
		Парам1Описание = СокрЛП(ПолеВвода19.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода22.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода22.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора15.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора14.Текст);
		Парам1Описание = СокрЛП(ПолеВвода21.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода24.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода24.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора17.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора16.Текст);
		Парам1Описание = СокрЛП(ПолеВвода23.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода26.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода26.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора19.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора18.Текст);
		Парам1Описание = СокрЛП(ПолеВвода25.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	Если Не (СокрЛП(ПолеВвода28.Текст) = "") Тогда
		Парам1Имя = СокрЛП(ПолеВвода28.Текст);
		Парам1Обязательный = СокрЛП(ПолеВыбора21.Текст);
		Парам1Тип = СокрЛП(ПолеВыбора20.Текст);
		Парам1Описание = СокрЛП(ПолеВвода27.Текст);
		М_Параметров.Добавить(Парам1Имя + ";;;" + Парам1Обязательный + ";;;" + Парам1Тип + ";;;" + Парам1Описание);
	КонецЕсли;
	
	СоздатьМетод();
КонецПроцедуры

Процедура СоздатьМетод()
	Стр = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
	|<HTML><HEAD><TITLE>CCLLAASS.MMEETTOODD Method</TITLE>
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
	|<H1 class=dtH1>ККЛЛААСС.ММЕЕТТООДД (CCLLAASS.MMEETTOODD)&nbsp;Метод</H1></DIV></DIV>
	|<DIV id=nstext>
	|<H4 class=dtH4>Синтаксис</H4>
	|<P>" + МетодИмяРус + "(";
	Для А = 0 По М_Параметров.ВГраница() Цикл
		Для А = 0 По М_Параметров.ВГраница() Цикл
			М = РазобратьСтроку(М_Параметров.Получить(А), ";;;");
			Стр = Стр + "&lt;" + М[0] + "&gt;";
			Если Не (А = М_Параметров.ВГраница()) Тогда
				Стр = Стр + ", ";
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
	Стр = Стр + ")</P>";

	Если М_Параметров.Количество() > 0 Тогда
		Стр = Стр + "
		|<H4 class=dtH4>Параметры</H4>
		|<DL>";
		Для А = 0 По М_Параметров.ВГраница() Цикл
			М = РазобратьСтроку(М_Параметров.Получить(А), ";;;");
			Стр = Стр + "
			|<DT><I>" + М[0] + "</I> (" + М[1] + ")</DT>
			|<DD>" + М[2] + "</DD>
			|<DD>" + М[3] + "</DD>";
		КонецЦикла;
		Стр = Стр + "
		|</DL>";
	КонецЕсли;
	Стр = Стр + "
	|<H4 class=dtH4>Возвращаемое значение</H4>
	|<P>" + ВозвращаемоеЗначениеТип + "</P>
	|<P>" + ВозвращаемоеЗначениеОписание + "</P>
	|<H4 class=dtH4>Описание</H4>
	|<P>МетодОписание_йййййййййй</P>
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
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = КлассИмяРус;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = КлассИмяEn;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "ММЕЕТТООДД";
	ПодстрокаЗамены = МетодИмяРус;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "MMEETTOODD";
	ПодстрокаЗамены = МетодИмяEn;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "МетодОписание_йййййййййй";
	ПодстрокаЗамены = МетодОписание;
	Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn + МетодИмяEn + "Method.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);

	// Добавим ссылку в C:\444\OSDFormsRu\contents.htm ====================================================================================
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать("C:\444\OSDFormsRu\contents.htm");
	Стр = ТекстДок.ПолучитьТекст();
	// d.add(79,0,"Методы","Methods.html");
	Стр3 = "";
	М_Стр = РазобратьСтроку(Стр, ";");
	Для А = 0 По М_Стр.ВГраница() Цикл
		Если СтрНайти(М_Стр[А], """Методы"",""Methods.html"");") > 0 Тогда
			Стр3 = М_Стр[А];
		КонецЕсли;
	КонецЦикла;
	М_Номер = СтрНайтиМежду(Стр, "d.add(", ",""Методы"",""Methods.html"");", Ложь, );
	Номер = М_Номер[М_Номер.ВГраница()];
	М_Номер2 = СтрНайтиМежду(Номер, "(", ",", , );
	Номер = М_Номер2[0];
	М = СтрНайтиМежду(Стр, 
		"""Методы"",""Methods.html"");", 
		"add", 
		Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		// d.add(81,79,"Вставить (Insert) (Menu)","OSDForms.MenuInsertMethod.html");
		ПодстрокаЗамены = """Методы"",""Methods.html"");
		|d.add(8000," + Номер + ",""" + МетодИмяРус + " (" + МетодИмяEn + ") (" + КлассИмяРус + ")"",""OSDForms." + КлассИмяEn + МетодИмяEn + "Method.html"");
		|d.add";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;

	ИмяФайла = ВыходнойКаталог + "\contents.htm";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	
	// Изменим C:\444\OSDFormsRu\Methods.html ====================================================================================
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать("C:\444\OSDFormsRu\Methods.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
		"    <TH width=""50%"">Методы (Methods)</TH>
		|    <TH width=""50%"">Описание</TH></TR>",
		"<TR vAlign=top>", 
		Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><A href=""OSDForms." + КлассИмяEn + МетодИмяEn + "Method.html"">" + МетодИмяРус + "&nbsp;(" + МетодИмяEn + ") (" + КлассИмяРус + ")</A></TD>
		|    <TD width=""50%"">" + МетодОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;
	ИмяФайла = ВыходнойКаталог + "\Methods.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);

	// Изменим C:\444\OSDFormsRu\OSDForms.КЛАССMethods.html ====================================================================================
	Если Не (КлассИмяEn = "") Тогда
		ТекстДок = Новый ТекстовыйДокумент;
		ТекстДок.Прочитать("C:\444\OSDFormsRu\OSDForms." + КлассИмяEn + "Methods.html");
		Стр = ТекстДок.ПолучитьТекст();
		М = СтрНайтиМежду(Стр, 
				"<H4 class=dtH4>Методы</H4>
				|<DIV class=tablediv>
				|<TABLE class=dtTABLE cellSpacing=0>
				|  <TBODY>", 
				"<TR vAlign=top>", 
				Ложь, );
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><IMG src=""pubmethod.gif""></IMG><A href=""OSDForms." + КлассИмяEn + МетодИмяEn + "Method.html"">" + МетодИмяРус + "&nbsp;(" + МетодИмяEn + ")</A></TD>
		|    <TD width=""50%"">" + МетодОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

		ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn + "Methods.html";
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
		ТекстДок.Прочитать("C:\444\OSDFormsRu\OSDForms." + КлассИмяEn2 + "Methods.html");
		Стр = ТекстДок.ПолучитьТекст();
		М = СтрНайтиМежду(Стр, 
				"<H4 class=dtH4>Методы</H4>
				|<DIV class=tablediv>
				|<TABLE class=dtTABLE cellSpacing=0>
				|  <TBODY>", 
				"<TR vAlign=top>", 
				Ложь, );
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><IMG src=""pubmethod.gif""></IMG><A href=""OSDForms." + КлассИмяEn + МетодИмяEn + "Method.html"">" + МетодИмяРус + "&nbsp;(" + МетодИмяEn + ")</A></TD>
		|    <TD width=""50%"">" + МетодОписание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);

		ИмяФайла = ВыходнойКаталог + "\OSDForms." + КлассИмяEn2 + "Methods.html";
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
    // osdText = "WzzQmtC+0L3RgdGC0YDRg9C60YLQvtGA0YtdDQrQpNC+0YDQvNCwXzAgPSDQpC7QpNC+0YDQvNCwKCk7DQrQndCw0LTQv9C40YHRjDEgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwzID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDMgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCa0L3QvtC/0LrQsDEgPSDQpC7QmtC90L7Qv9C60LAoKTsNCtCd0LDQtNC/0LjRgdGMNCA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQndCw0LTQv9C40YHRjDUgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0Yw2ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDQgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMNyA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LA1ID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQndCw0LTQv9C40YHRjDggPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0Yw5ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDggPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MSA9INCkLtCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6KCk7DQrQktC60LvQsNC00LrQsDEgPSDQpC7QktC60LvQsNC00LrQsCgpOw0K0JLQutC70LDQtNC60LAyID0g0KQu0JLQutC70LDQtNC60LAoKTsNCtCd0LDQtNC/0LjRgdGMMTAgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0JLQutC70LDQtNC60LAzID0g0KQu0JLQutC70LDQtNC60LAoKTsNCtCS0LrQu9Cw0LTQutCwNCA9INCkLtCS0LrQu9Cw0LTQutCwKCk7DQrQktC60LvQsNC00LrQsDUgPSDQpC7QktC60LvQsNC00LrQsCgpOw0K0JLQutC70LDQtNC60LA2ID0g0KQu0JLQutC70LDQtNC60LAoKTsNCtCS0LrQu9Cw0LTQutCwNyA9INCkLtCS0LrQu9Cw0LTQutCwKCk7DQrQktC60LvQsNC00LrQsDggPSDQpC7QktC60LvQsNC00LrQsCgpOw0K0JLQutC70LDQtNC60LA5ID0g0KQu0JLQutC70LDQtNC60LAoKTsNCtCS0LrQu9Cw0LTQutCwMTAgPSDQpC7QktC60LvQsNC00LrQsCgpOw0K0J3QsNC00L/QuNGB0YwxMSA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LA5ID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQndCw0LTQv9C40YHRjDEyID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMMTMgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMiA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMgPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J3QsNC00L/QuNGB0YwxNCA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LAxMCA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMTEgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMTUgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA0ID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNSA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDE2ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMMTcgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMTIgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMTggPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMTMgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMTkgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA2ID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNyA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDIwID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMMjEgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMTQgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMjIgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMTUgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMjMgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwyNCA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDggPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMTYgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOSA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDI1ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMMjYgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMTcgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMjcgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwyOCA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEwID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDE4ID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDExID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCd0LDQtNC/0LjRgdGMMjkgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwzMCA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LAxOSA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J3QsNC00L/QuNGB0YwzMSA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQndCw0LTQv9C40YHRjDMyID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTIgPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMjAgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTMgPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J3QsNC00L/QuNGB0YwzMyA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQndCw0LTQv9C40YHRjDM0ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDIxID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQndCw0LTQv9C40YHRjDM1ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMMzYgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNCA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQn9C+0LvQtdCS0LLQvtC00LAyMiA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNSA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDM3ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMMzggPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMjMgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMzkgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0Yw0MCA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE2ID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDI0ID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE3ID0g0KQu0J/QvtC70LXQktGL0LHQvtGA0LAoKTsNCtCd0LDQtNC/0LjRgdGMNDEgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0Yw0MiA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LAyNSA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J3QsNC00L/QuNGB0Yw0MyA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQndCw0LTQv9C40YHRjDQ0ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTggPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J/QvtC70LXQktCy0L7QtNCwMjYgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTkgPSDQpC7Qn9C+0LvQtdCS0YvQsdC+0YDQsCgpOw0K0J3QsNC00L/QuNGB0Yw0NSA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQndCw0LTQv9C40YHRjDQ2ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDI3ID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQndCw0LTQv9C40YHRjDQ3ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMNDggPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMCA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQn9C+0LvQtdCS0LLQvtC00LAyOCA9INCkLtCf0L7Qu9C10JLQstC+0LTQsCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMSA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDQ5ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCd0LDQtNC/0LjRgdGMNTAgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMiA9INCkLtCf0L7Qu9C10JLRi9Cx0L7RgNCwKCk7DQrQndCw0LTQv9C40YHRjDUxID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCa0L3QvtC/0LrQsDIgPSDQpC7QmtC90L7Qv9C60LAoKTsNCtCa0L3QvtC/0LrQsDMgPSDQpC7QmtC90L7Qv9C60LAoKTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjEgPSDQpC7QodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIoKTsNClvQmtC+0L3RgdGC0YDRg9C60YLQvtGA0Ys+XQ0KWzzQodCy0L7QudGB0YLQstCwXQ0KWzzQpNC+0YDQvNCwXzBdDQrQpNC+0YDQvNCwXzAu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDcyMywgNzc1KTsNCtCk0L7RgNC80LBfMC7Qn9GD0YLRjCA9ICJDOlw0NDRcOS3Ql9Cw0LPQvtGC0L7QstC60LjQlNC10LrQu9Cw0YDQpNC+0YDQvFzQodC+0LfQtNCw0L3QuNC10JzQtdGC0L7QtNCwMi5vcyI7DQrQpNC+0YDQvNCwXzAu0KHRgtC40LvRjNCh0LrRgNC40L/RgtCwID0gItCh0YLQuNC70YzQodC60YDQuNC/0YLQsCI7DQrQpNC+0YDQvNCwXzAu0KLQtdC60YHRgiA9ICLQodC+0LfQtNCw0L3QuNC1INC80LXRgtC+0LTQsCI7DQrQpNC+0YDQvNCwXzAu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCk0L7RgNC80LBfMC7QmNC80Y/QntCx0YrQtdC60YLQsNCk0L7RgNC80YvQlNC70Y/QntC00L3QvtCh0LrRgNC40L/RgtCwID0gItCkIjsNClvQpNC+0YDQvNCwXzA+XQ0KWzzQndCw0LTQv9C40YHRjDFdDQrQndCw0LTQv9C40YHRjDEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxOCk7DQrQndCw0LTQv9C40YHRjDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAwOw0K0J3QsNC00L/QuNGB0YwxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDkpOw0K0J3QsNC00L/QuNGB0YwxLtCi0LXQutGB0YIgPSAi0JrQu9Cw0YHRgSI7DQrQndCw0LTQv9C40YHRjDEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDE+XQ0KWzzQndCw0LTQv9C40YHRjDNdDQrQndCw0LTQv9C40YHRjDMu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTIzLCAxOSk7DQrQndCw0LTQv9C40YHRjDMu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzOw0K0J3QsNC00L/QuNGB0YwzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDk4KTsNCtCd0LDQtNC/0LjRgdGMMy7QotC10LrRgdGCID0gItCc0LXRgtC+0LTQntC/0LjRgdCw0L3QuNC1IjsNCtCd0LDQtNC/0LjRgdGMMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMz5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDNdDQrQn9C+0LvQtdCS0LLQvtC00LAzLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDY1NiwgNTEpOw0K0J/QvtC70LXQktCy0L7QtNCwMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDI7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDEyMCk7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMz5dDQpbPNCa0L3QvtC/0LrQsDFdDQrQmtC90L7Qv9C60LAxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQmtC90L7Qv9C60LAxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg5MSwgMzkpOw0K0JrQvdC+0L/QutCwMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDQ7DQrQmtC90L7Qv9C60LAxLtCd0LDQttCw0YLQuNC1ID0gItCa0L0xX9Cd0LDQttCw0YLQuNC1IjsNCtCa0L3QvtC/0LrQsDEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg2MDQsIDY4NSk7DQrQmtC90L7Qv9C60LAxLtCi0LXQutGB0YIgPSAi0KHQvtC30LTQsNGC0Ywg0LzQtdGC0L7QtCI7DQrQmtC90L7Qv9C60LAxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0JrQvdC+0L/QutCwMT5dDQpbPNCd0LDQtNC/0LjRgdGMNF0NCtCd0LDQtNC/0LjRgdGMNC7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw0LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgzNDQsIDE3KTsNCtCd0LDQtNC/0LjRgdGMNC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDU7DQrQndCw0LTQv9C40YHRjDQu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzNTEsIDI5KTsNCtCd0LDQtNC/0LjRgdGMNC7QotC10LrRgdGCID0gItCS0YvRhdC+0LTQvdGL0LUg0LTQsNC90L3Ri9C1INCx0YPQtNGD0YIg0LIg0LrQsNGC0LDQu9C+0LPQtSBDOlwwMDAiOw0K0J3QsNC00L/QuNGB0Yw0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw0Pl0NCls80J3QsNC00L/QuNGB0Yw1XQ0K0J3QsNC00L/QuNGB0Yw1LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDUu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDM2MSwgMjMpOw0K0J3QsNC00L/QuNGB0Yw1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNjsNCtCd0LDQtNC/0LjRgdGMNS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDM1MSwgNCk7DQrQndCw0LTQv9C40YHRjDUu0KLQtdC60YHRgiA9ICLQmNGB0YXQvtC00L3Ri9C1INC00LDQvdC90YvQtSDQu9C10LbQsNGCINCyINC60LDRgtCw0LvQvtCz0LUgQzpcNDQ0XE9TREZvcm1zUnUiOw0K0J3QsNC00L/QuNGB0Yw1LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw1Pl0NCls80J3QsNC00L/QuNGB0Yw2XQ0K0J3QsNC00L/QuNGB0Yw2LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQndCw0LTQv9C40YHRjDYu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEwMCwgMTkpOw0K0J3QsNC00L/QuNGB0Yw2LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNzsNCtCd0LDQtNC/0LjRgdGMNi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDI2LCA1Myk7DQrQndCw0LTQv9C40YHRjDYu0KLQtdC60YHRgiA9ICLQnNC10YLQvtC00JjQvNGP0KDRg9GBIjsNCtCd0LDQtNC/0LjRgdGMNi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNj5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDRdDQrQn9C+0LvQtdCS0LLQvtC00LA0LtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LA0LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgzMjUsIDIyKTsNCtCf0L7Qu9C10JLQstC+0LTQsDQu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA4Ow0K0J/QvtC70LXQktCy0L7QtNCwNC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDIyLCA3NSk7DQrQn9C+0LvQtdCS0LLQvtC00LA0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwND5dDQpbPNCd0LDQtNC/0LjRgdGMN10NCtCd0LDQtNC/0LjRgdGMNy7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw3LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE4KTsNCtCd0LDQtNC/0LjRgdGMNy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDk7DQrQndCw0LTQv9C40YHRjDcu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzNTcsIDU0KTsNCtCd0LDQtNC/0LjRgdGMNy7QotC10LrRgdGCID0gItCc0LXRgtC+0LTQmNC80Y9FbiI7DQrQndCw0LTQv9C40YHRjDcu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDc+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LA1XQ0K0J/QvtC70LXQktCy0L7QtNCwNS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktCy0L7QtNCwNS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMzI1LCAyMik7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTA7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzUzLCA3NSk7DQrQn9C+0LvQtdCS0LLQvtC00LA1LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwNT5dDQpbPNCd0LDQtNC/0LjRgdGMOF0NCtCd0LDQtNC/0LjRgdGMOC7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw4LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyMjIsIDE4KTsNCtCd0LDQtNC/0LjRgdGMOC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDExOw0K0J3QsNC00L/QuNGB0Yw4LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDE3NCk7DQrQndCw0LTQv9C40YHRjDgu0KLQtdC60YHRgiA9ICLQktC+0LfQstGA0LDRidCw0LXQvNC+0LXQl9C90LDRh9C10L3QuNC10KLQuNC/IjsNCtCd0LDQtNC/0LjRgdGMOC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMOD5dDQpbPNCd0LDQtNC/0LjRgdGMOV0NCtCd0LDQtNC/0LjRgdGMOS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw5LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyNTcsIDE3KTsNCtCd0LDQtNC/0LjRgdGMOS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDEyOw0K0J3QsNC00L/QuNGB0Yw5LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDIxOCk7DQrQndCw0LTQv9C40YHRjDku0KLQtdC60YHRgiA9ICLQktC+0LfQstGA0LDRidCw0LXQvNC+0LXQl9C90LDRh9C10L3QuNC10J7Qv9C40YHQsNC90LjQtSI7DQrQndCw0LTQv9C40YHRjDku0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDk+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LA4XQ0K0J/QvtC70LXQktCy0L7QtNCwOC7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktCy0L7QtNCwOC7QnNC90L7Qs9C+0YHRgtGA0L7Rh9C90YvQudCg0LXQttC40LwgPSDQmNGB0YLQuNC90LA7DQrQn9C+0LvQtdCS0LLQvtC00LA4LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2NTYsIDU0KTsNCtCf0L7Qu9C10JLQstC+0LTQsDgu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxNTsNCtCf0L7Qu9C10JLQstC+0LTQsDgu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgyNiwgMjM4KTsNCtCf0L7Qu9C10JLQstC+0LTQsDgu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LA4Pl0NCls80J/QsNC90LXQu9GM0JLQutC70LDQtNC+0LoxXQ0K0J/QsNC90LXQu9GM0JLQutC70LDQtNC+0LoxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9Cw0L3QtdC70YzQktC60LvQsNC00L7QujEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDY1NiwgMjEyKTsNCtCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDE2Ow0K0J/QsNC90LXQu9GM0JLQutC70LDQtNC+0LoxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDMxNCk7DQrQn9Cw0L3QtdC70YzQktC60LvQsNC00L7QujEu0KDQsNC30LzQtdGA0K3Qu9C10LzQtdC90YLQsCA9INCkLtCg0LDQt9C80LXRgCg0MiwgMTgpOw0K0J/QsNC90LXQu9GM0JLQutC70LDQtNC+0LoxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QsNC90LXQu9GM0JLQutC70LDQtNC+0LoxPl0NCls80JLQutC70LDQtNC60LAxXQ0K0JLQutC70LDQtNC60LAxLtCg0L7QtNC40YLQtdC70YwgPSDQn9Cw0L3QtdC70YzQktC60LvQsNC00L7QujE7DQrQktC60LvQsNC00LrQsDEu0KLQtdC60YHRgiA9ICIwIjsNClvQktC60LvQsNC00LrQsDE+XQ0KWzzQndCw0LTQv9C40YHRjDExXQ0K0J3QsNC00L/QuNGB0YwxMS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAxOw0K0J3QsNC00L/QuNGB0YwxMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDExLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMDsNCtCd0LDQtNC/0LjRgdGMMTEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg2LCAzKTsNCtCd0LDQtNC/0LjRgdGMMTEu0KLQtdC60YHRgiA9ICLQmNC80Y8iOw0K0J3QsNC00L/QuNGB0YwxMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMTE+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LA5XQ0K0J/QvtC70LXQktCy0L7QtNCwOS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAxOw0K0J/QvtC70LXQktCy0L7QtNCwOS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyMik7DQrQn9C+0LvQtdCS0LLQvtC00LA5LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTsNCtCf0L7Qu9C10JLQstC+0LTQsDku0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg2LCAyMCk7DQrQn9C+0LvQtdCS0LLQvtC00LA5LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwOT5dDQpbPNCd0LDQtNC/0LjRgdGMMTJdDQrQndCw0LTQv9C40YHRjDEyLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDE7DQrQndCw0LTQv9C40YHRjDEyLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE0KTsNCtCd0LDQtNC/0LjRgdGMMTIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyOw0K0J3QsNC00L/QuNGB0YwxMi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDMyNSwgMyk7DQrQndCw0LTQv9C40YHRjDEyLtCi0LXQutGB0YIgPSAi0J7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IjsNCtCd0LDQtNC/0LjRgdGMMTIu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDEyPl0NCls80J3QsNC00L/QuNGB0YwxM10NCtCd0LDQtNC/0LjRgdGMMTMu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMTsNCtCd0LDQtNC/0LjRgdGMMTMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEwMCwgMTYpOw0K0J3QsNC00L/QuNGB0YwxMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDM7DQrQndCw0LTQv9C40YHRjDEzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNiwgNDMpOw0K0J3QsNC00L/QuNGB0YwxMy7QotC10LrRgdGCID0gItCi0LjQvyI7DQrQndCw0LTQv9C40YHRjDEzLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwxMz5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMV0NCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAxOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyOTYsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzI1LCAyMCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KLQtdC60YHRgiA9ICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSAyOTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQvdC10L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IiwgItC90LXQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiKSk7DQpb0J/QvtC70LXQktGL0LHQvtGA0LAxPl0NCls80J/QvtC70LXQktGL0LHQvtGA0LAzXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDE7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDYxNSwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg2LCA2Mik7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0KLQtdC60YHRgiA9ICLQotC40L86INCR0YPQu9C10LLQvi4iOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA2MTU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0JHRg9C70LXQstC+LiIsICLQotC40L86INCR0YPQu9C10LLQvi4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDMu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCh0YLRgNC+0LrQsC4iLCAi0KLQuNC/OiDQodGC0YDQvtC60LAuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQp9C40YHQu9C+LiIsICLQotC40L86INCn0LjRgdC70L4uIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAzLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIiwgItCi0LjQvzog0J/RgNC+0LjQt9Cy0L7Qu9GM0L3Ri9C5LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMy7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDM+XQ0KWzzQndCw0LTQv9C40YHRjDE0XQ0K0J3QsNC00L/QuNGB0YwxNC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAxOw0K0J3QsNC00L/QuNGB0YwxNC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNSk7DQrQndCw0LTQv9C40YHRjDE0LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNzsNCtCd0LDQtNC/0LjRgdGMMTQu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg2LCA4Nik7DQrQndCw0LTQv9C40YHRjDE0LtCi0LXQutGB0YIgPSAi0J7Qv9C40YHQsNC90LjQtSI7DQrQndCw0LTQv9C40YHRjDE0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwxND5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDEwXQ0K0J/QvtC70LXQktCy0L7QtNCwMTAu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMTsNCtCf0L7Qu9C10JLQstC+0LTQsDEwLtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDEwLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDEwLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gODsNCtCf0L7Qu9C10JLQstC+0LTQsDEwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNiwgMTA0KTsNCtCf0L7Qu9C10JLQstC+0LTQsDEwLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMTA+XQ0KWzzQktC60LvQsNC00LrQsDJdDQrQktC60LvQsNC00LrQsDIu0KDQvtC00LjRgtC10LvRjCA9INCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MTsNCtCS0LrQu9Cw0LTQutCwMi7QotC10LrRgdGCID0gIjEiOw0KW9CS0LrQu9Cw0LTQutCwMj5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDExXQ0K0J/QvtC70LXQktCy0L7QtNCwMTEu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMjsNCtCf0L7Qu9C10JLQstC+0LTQsDExLtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDExLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDExLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjY7DQrQn9C+0LvQtdCS0LLQvtC00LAxMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDYsIDEwNyk7DQrQn9C+0LvQtdCS0LLQvtC00LAxMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLQstC+0LTQsDExPl0NCls80J3QsNC00L/QuNGB0YwxNV0NCtCd0LDQtNC/0LjRgdGMMTUu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMjsNCtCd0LDQtNC/0LjRgdGMMTUu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEwMCwgMTUpOw0K0J3QsNC00L/QuNGB0YwxNS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDI1Ow0K0J3QsNC00L/QuNGB0YwxNS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDYsIDg5KTsNCtCd0LDQtNC/0LjRgdGMMTUu0KLQtdC60YHRgiA9ICLQntC/0LjRgdCw0L3QuNC1IjsNCtCd0LDQtNC/0LjRgdGMMTUu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDE1Pl0NCls80J/QvtC70LXQktGL0LHQvtGA0LA0XQ0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDQu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDYxNSwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjQ7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDQu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNiwgNjUpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCi0LXQutGB0YIgPSAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDQu0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDYxNTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIiwgItCi0LjQvzog0JHRg9C70LXQstC+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KHRgtGA0L7QutCwLiIsICLQotC40L86INCh0YLRgNC+0LrQsC4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDQu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCn0LjRgdC70L4uIiwgItCi0LjQvzog0KfQuNGB0LvQvi4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDQu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA0LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIsICLQudC50LnQudC50LnQudC50LnQuSAgINC50LnQudC50LnQudC50LnQudC5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwND5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwNV0NCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAyOw0K0J/QvtC70LXQktGL0LHQvtGA0LA1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyOTYsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDIzOw0K0J/QvtC70LXQktGL0LHQvtGA0LA1LtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDMyNSwgMjMpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA1LtCi0LXQutGB0YIgPSAi0L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNS7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LA1LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDUu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiLCAi0L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA1LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvdC10L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwNT5dDQpbPNCd0LDQtNC/0LjRgdGMMTZdDQrQndCw0LTQv9C40YHRjDE2LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDI7DQrQndCw0LTQv9C40YHRjDE2LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE2KTsNCtCd0LDQtNC/0LjRgdGMMTYu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyMjsNCtCd0LDQtNC/0LjRgdGMMTYu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg2LCA0Nik7DQrQndCw0LTQv9C40YHRjDE2LtCi0LXQutGB0YIgPSAi0KLQuNC/IjsNCtCd0LDQtNC/0LjRgdGMMTYu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDE2Pl0NCls80J3QsNC00L/QuNGB0YwxN10NCtCd0LDQtNC/0LjRgdGMMTcu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMjsNCtCd0LDQtNC/0LjRgdGMMTcu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEwMCwgMTQpOw0K0J3QsNC00L/QuNGB0YwxNy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDIxOw0K0J3QsNC00L/QuNGB0YwxNy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDMyNSwgNik7DQrQndCw0LTQv9C40YHRjDE3LtCi0LXQutGB0YIgPSAi0J7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IjsNCtCd0LDQtNC/0LjRgdGMMTcu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDE3Pl0NCls80J/QvtC70LXQktCy0L7QtNCwMTJdDQrQn9C+0LvQtdCS0LLQvtC00LAxMi7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAyOw0K0J/QvtC70LXQktCy0L7QtNCwMTIu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMTIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyMDsNCtCf0L7Qu9C10JLQstC+0LTQsDEyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNiwgMjMpOw0K0J/QvtC70LXQktCy0L7QtNCwMTIu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAxMj5dDQpbPNCd0LDQtNC/0LjRgdGMMThdDQrQndCw0LTQv9C40YHRjDE4LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDI7DQrQndCw0LTQv9C40YHRjDE4LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE0KTsNCtCd0LDQtNC/0LjRgdGMMTgu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxOTsNCtCd0LDQtNC/0LjRgdGMMTgu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg2LCA2KTsNCtCd0LDQtNC/0LjRgdGMMTgu0KLQtdC60YHRgiA9ICLQmNC80Y8iOw0K0J3QsNC00L/QuNGB0YwxOC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMTg+XQ0KWzzQktC60LvQsNC00LrQsDNdDQrQktC60LvQsNC00LrQsDMu0KDQvtC00LjRgtC10LvRjCA9INCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MTsNCtCS0LrQu9Cw0LTQutCwMy7QotC10LrRgdGCID0gIjIiOw0KW9CS0LrQu9Cw0LTQutCwMz5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDEzXQ0K0J/QvtC70LXQktCy0L7QtNCwMTMu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMzsNCtCf0L7Qu9C10JLQstC+0LTQsDEzLtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDEzLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDEzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzQ7DQrQn9C+0LvQtdCS0LLQvtC00LAxMy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE1LCAxMTApOw0K0J/QvtC70LXQktCy0L7QtNCwMTMu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAxMz5dDQpbPNCd0LDQtNC/0LjRgdGMMTldDQrQndCw0LTQv9C40YHRjDE5LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDM7DQrQndCw0LTQv9C40YHRjDE5LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMMTku0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzMzsNCtCd0LDQtNC/0LjRgdGMMTku0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNSwgOTIpOw0K0J3QsNC00L/QuNGB0YwxOS7QotC10LrRgdGCID0gItCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0YwxOS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMTk+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDZdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDYu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMzsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNjE1LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDYu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzMjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNi7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDYu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNSwgNjgpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA2LtCi0LXQutGB0YIgPSAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDYu0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDYxNTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LA2LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIiwgItCi0LjQvzog0JHRg9C70LXQstC+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KHRgtGA0L7QutCwLiIsICLQotC40L86INCh0YLRgNC+0LrQsC4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDYu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCn0LjRgdC70L4uIiwgItCi0LjQvzog0KfQuNGB0LvQvi4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDYu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA2LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIsICLQudC50LnQudC50LnQudC50LnQuSAgINC50LnQudC50LnQudC50LnQudC5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwNj5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwN10NCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNy7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAzOw0K0J/QvtC70LXQktGL0LHQvtGA0LA3LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyOTYsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDMxOw0K0J/QvtC70LXQktGL0LHQvtGA0LA3LtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDMzNCwgMjYpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA3LtCi0LXQutGB0YIgPSAi0L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwNy7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LA3LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDcu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiLCAi0L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA3LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvdC10L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwNz5dDQpbPNCd0LDQtNC/0LjRgdGMMjBdDQrQndCw0LTQv9C40YHRjDIwLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDM7DQrQndCw0LTQv9C40YHRjDIwLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE2KTsNCtCd0LDQtNC/0LjRgdGMMjAu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzMDsNCtCd0LDQtNC/0LjRgdGMMjAu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNSwgNDkpOw0K0J3QsNC00L/QuNGB0YwyMC7QotC10LrRgdGCID0gItCi0LjQvyI7DQrQndCw0LTQv9C40YHRjDIwLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwyMD5dDQpbPNCd0LDQtNC/0LjRgdGMMjFdDQrQndCw0LTQv9C40YHRjDIxLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDM7DQrQndCw0LTQv9C40YHRjDIxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE0KTsNCtCd0LDQtNC/0LjRgdGMMjEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyOTsNCtCd0LDQtNC/0LjRgdGMMjEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMzQsIDkpOw0K0J3QsNC00L/QuNGB0YwyMS7QotC10LrRgdGCID0gItCe0LHRj9C30LDRgtC10LvRjNC90YvQuSI7DQrQndCw0LTQv9C40YHRjDIxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwyMT5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDE0XQ0K0J/QvtC70LXQktCy0L7QtNCwMTQu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMzsNCtCf0L7Qu9C10JLQstC+0LTQsDE0LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgyOTYsIDIyKTsNCtCf0L7Qu9C10JLQstC+0LTQsDE0LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjg7DQrQn9C+0LvQtdCS0LLQvtC00LAxNC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE1LCAyNik7DQrQn9C+0LvQtdCS0LLQvtC00LAxNC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLQstC+0LTQsDE0Pl0NCls80J3QsNC00L/QuNGB0YwyMl0NCtCd0LDQtNC/0LjRgdGMMjIu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMzsNCtCd0LDQtNC/0LjRgdGMMjIu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEwMCwgMTQpOw0K0J3QsNC00L/QuNGB0YwyMi7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDI3Ow0K0J3QsNC00L/QuNGB0YwyMi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE1LCA5KTsNCtCd0LDQtNC/0LjRgdGMMjIu0KLQtdC60YHRgiA9ICLQmNC80Y8iOw0K0J3QsNC00L/QuNGB0YwyMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMjI+XQ0KWzzQktC60LvQsNC00LrQsDRdDQrQktC60LvQsNC00LrQsDQu0KDQvtC00LjRgtC10LvRjCA9INCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MTsNCtCS0LrQu9Cw0LTQutCwNC7QotC10LrRgdGCID0gIjMiOw0KW9CS0LrQu9Cw0LTQutCwND5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDE1XQ0K0J/QvtC70LXQktCy0L7QtNCwMTUu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwNDsNCtCf0L7Qu9C10JLQstC+0LTQsDE1LtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDE1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDE1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNDI7DQrQn9C+0LvQtdCS0LLQvtC00LAxNS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCAxMTApOw0K0J/QvtC70LXQktCy0L7QtNCwMTUu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAxNT5dDQpbPNCd0LDQtNC/0LjRgdGMMjNdDQrQndCw0LTQv9C40YHRjDIzLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDQ7DQrQndCw0LTQv9C40YHRjDIzLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMMjMu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MTsNCtCd0LDQtNC/0LjRgdGMMjMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgOTIpOw0K0J3QsNC00L/QuNGB0YwyMy7QotC10LrRgdGCID0gItCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0YwyMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMjM+XQ0KWzzQndCw0LTQv9C40YHRjDI0XQ0K0J3QsNC00L/QuNGB0YwyNC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA0Ow0K0J3QsNC00L/QuNGB0YwyNC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDI0LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzU7DQrQndCw0LTQv9C40YHRjDI0LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDkpOw0K0J3QsNC00L/QuNGB0YwyNC7QotC10LrRgdGCID0gItCY0LzRjyI7DQrQndCw0LTQv9C40YHRjDI0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwyND5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwOF0NCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA0Ow0K0J/QvtC70LXQktGL0LHQvtGA0LA4LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDQwOw0K0J/QvtC70LXQktGL0LHQvtGA0LA4LtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCA2OCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDgu0KLQtdC60YHRgiA9ICLQudC50LnQudC50LnQudC50LnQuSAgINC50LnQudC50LnQudC50LnQudC5IjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOC7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gNjE1Ow0K0J/QvtC70LXQktGL0LHQvtGA0LA4LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDgu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCR0YPQu9C10LLQvi4iLCAi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LA4LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQodGC0YDQvtC60LAuIiwgItCi0LjQvzog0KHRgtGA0L7QutCwLiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KfQuNGB0LvQvi4iLCAi0KLQuNC/OiDQp9C40YHQu9C+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0J/RgNC+0LjQt9Cy0L7Qu9GM0L3Ri9C5LiIsICLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDgu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQudC50LnQudC50LnQudC50LnQuSAgINC50LnQudC50LnQudC50LnQudC5IiwgItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiKSk7DQpb0J/QvtC70LXQktGL0LHQvtGA0LA4Pl0NCls80J/QvtC70LXQktCy0L7QtNCwMTZdDQrQn9C+0LvQtdCS0LLQvtC00LAxNi7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA0Ow0K0J/QvtC70LXQktCy0L7QtNCwMTYu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMTYu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzNjsNCtCf0L7Qu9C10JLQstC+0LTQsDE2LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDI2KTsNCtCf0L7Qu9C10JLQstC+0LTQsDE2LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMTY+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDldDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDku0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwNDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDku0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzOTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOS7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDku0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMzcsIDI2KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOS7QotC10LrRgdGCID0gItC+0LHRj9C30LDRgtC10LvRjNC90YvQuSI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDku0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDI5NjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LA5LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IiwgItC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwOS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC90LXQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiLCAi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDk+XQ0KWzzQndCw0LTQv9C40YHRjDI1XQ0K0J3QsNC00L/QuNGB0YwyNS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA0Ow0K0J3QsNC00L/QuNGB0YwyNS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDI1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzc7DQrQndCw0LTQv9C40YHRjDI1LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzM3LCA5KTsNCtCd0LDQtNC/0LjRgdGMMjUu0KLQtdC60YHRgiA9ICLQntCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J3QsNC00L/QuNGB0YwyNS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMjU+XQ0KWzzQndCw0LTQv9C40YHRjDI2XQ0K0J3QsNC00L/QuNGB0YwyNi7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA0Ow0K0J3QsNC00L/QuNGB0YwyNi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNik7DQrQndCw0LTQv9C40YHRjDI2LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzg7DQrQndCw0LTQv9C40YHRjDI2LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDQ5KTsNCtCd0LDQtNC/0LjRgdGMMjYu0KLQtdC60YHRgiA9ICLQotC40L8iOw0K0J3QsNC00L/QuNGB0YwyNi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMjY+XQ0KWzzQktC60LvQsNC00LrQsDVdDQrQktC60LvQsNC00LrQsDUu0KDQvtC00LjRgtC10LvRjCA9INCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MTsNCtCS0LrQu9Cw0LTQutCwNS7QotC10LrRgdGCID0gIjQiOw0KW9CS0LrQu9Cw0LTQutCwNT5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDE3XQ0K0J/QvtC70LXQktCy0L7QtNCwMTcu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwNTsNCtCf0L7Qu9C10JLQstC+0LTQsDE3LtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDE3LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDE3LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNDI7DQrQn9C+0LvQtdCS0LLQvtC00LAxNy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE3LCAxMTApOw0K0J/QvtC70LXQktCy0L7QtNCwMTcu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAxNz5dDQpbPNCd0LDQtNC/0LjRgdGMMjddDQrQndCw0LTQv9C40YHRjDI3LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDU7DQrQndCw0LTQv9C40YHRjDI3LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMMjcu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MTsNCtCd0LDQtNC/0LjRgdGMMjcu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNywgOTIpOw0K0J3QsNC00L/QuNGB0YwyNy7QotC10LrRgdGCID0gItCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0YwyNy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMjc+XQ0KWzzQndCw0LTQv9C40YHRjDI4XQ0K0J3QsNC00L/QuNGB0YwyOC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA1Ow0K0J3QsNC00L/QuNGB0YwyOC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDI4LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzU7DQrQndCw0LTQv9C40YHRjDI4LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTcsIDkpOw0K0J3QsNC00L/QuNGB0YwyOC7QotC10LrRgdGCID0gItCY0LzRjyI7DQrQndCw0LTQv9C40YHRjDI4LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwyOD5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMTBdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEwLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEwLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTAu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTAu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxMC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE3LCA2OCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEwLtCi0LXQutGB0YIgPSAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEwLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA2MTU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEwLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEwLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIiwgItCi0LjQvzog0JHRg9C70LXQstC+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTAu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCh0YLRgNC+0LrQsC4iLCAi0KLQuNC/OiDQodGC0YDQvtC60LAuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxMC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KfQuNGB0LvQvi4iLCAi0KLQuNC/OiDQp9C40YHQu9C+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTAu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxMC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDEwPl0NCls80J/QvtC70LXQktCy0L7QtNCwMThdDQrQn9C+0LvQtdCS0LLQvtC00LAxOC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA1Ow0K0J/QvtC70LXQktCy0L7QtNCwMTgu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMTgu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzNjsNCtCf0L7Qu9C10JLQstC+0LTQsDE4LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTcsIDI2KTsNCtCf0L7Qu9C10JLQstC+0LTQsDE4LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMTg+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDExXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAxMS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA1Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDExLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDExLtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMzYsIDI2KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTEu0KLQtdC60YHRgiA9ICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxMS7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxMS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDExLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvdC10L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMTE+XQ0KWzzQndCw0LTQv9C40YHRjDI5XQ0K0J3QsNC00L/QuNGB0YwyOS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA1Ow0K0J3QsNC00L/QuNGB0YwyOS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDI5LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzc7DQrQndCw0LTQv9C40YHRjDI5LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzM2LCA5KTsNCtCd0LDQtNC/0LjRgdGMMjku0KLQtdC60YHRgiA9ICLQntCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J3QsNC00L/QuNGB0YwyOS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMjk+XQ0KWzzQndCw0LTQv9C40YHRjDMwXQ0K0J3QsNC00L/QuNGB0YwzMC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA1Ow0K0J3QsNC00L/QuNGB0YwzMC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNik7DQrQndCw0LTQv9C40YHRjDMwLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzg7DQrQndCw0LTQv9C40YHRjDMwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTcsIDQ5KTsNCtCd0LDQtNC/0LjRgdGMMzAu0KLQtdC60YHRgiA9ICLQotC40L8iOw0K0J3QsNC00L/QuNGB0YwzMC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMzA+XQ0KWzzQktC60LvQsNC00LrQsDZdDQrQktC60LvQsNC00LrQsDYu0KDQvtC00LjRgtC10LvRjCA9INCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MTsNCtCS0LrQu9Cw0LTQutCwNi7QotC10LrRgdGCID0gIjUiOw0KW9CS0LrQu9Cw0LTQutCwNj5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDE5XQ0K0J/QvtC70LXQktCy0L7QtNCwMTku0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwNjsNCtCf0L7Qu9C10JLQstC+0LTQsDE5LtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDE5LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDE5LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNDI7DQrQn9C+0LvQtdCS0LLQvtC00LAxOS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCAxMTApOw0K0J/QvtC70LXQktCy0L7QtNCwMTku0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAxOT5dDQpbPNCd0LDQtNC/0LjRgdGMMzFdDQrQndCw0LTQv9C40YHRjDMxLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDY7DQrQndCw0LTQv9C40YHRjDMxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMMzEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MTsNCtCd0LDQtNC/0LjRgdGMMzEu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgOTIpOw0K0J3QsNC00L/QuNGB0YwzMS7QotC10LrRgdGCID0gItCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0YwzMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMzE+XQ0KWzzQndCw0LTQv9C40YHRjDMyXQ0K0J3QsNC00L/QuNGB0YwzMi7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA2Ow0K0J3QsNC00L/QuNGB0YwzMi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDMyLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzU7DQrQndCw0LTQv9C40YHRjDMyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDkpOw0K0J3QsNC00L/QuNGB0YwzMi7QotC10LrRgdGCID0gItCY0LzRjyI7DQrQndCw0LTQv9C40YHRjDMyLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwzMj5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMTJdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEyLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEyLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTIu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxMi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCA2OCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEyLtCi0LXQutGB0YIgPSAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEyLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA2MTU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEyLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEyLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIiwgItCi0LjQvzog0JHRg9C70LXQstC+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCh0YLRgNC+0LrQsC4iLCAi0KLQuNC/OiDQodGC0YDQvtC60LAuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KfQuNGB0LvQvi4iLCAi0KLQuNC/OiDQp9C40YHQu9C+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDEyPl0NCls80J/QvtC70LXQktCy0L7QtNCwMjBdDQrQn9C+0LvQtdCS0LLQvtC00LAyMC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA2Ow0K0J/QvtC70LXQktCy0L7QtNCwMjAu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMjAu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzNjsNCtCf0L7Qu9C10JLQstC+0LTQsDIwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDI2KTsNCtCf0L7Qu9C10JLQstC+0LTQsDIwLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMjA+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDEzXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAxMy7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEzLtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMzgsIDI2KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTMu0KLQtdC60YHRgiA9ICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxMy7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxMy7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDEzLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvdC10L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMTM+XQ0KWzzQndCw0LTQv9C40YHRjDMzXQ0K0J3QsNC00L/QuNGB0YwzMy7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA2Ow0K0J3QsNC00L/QuNGB0YwzMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDMzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzc7DQrQndCw0LTQv9C40YHRjDMzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzM4LCA5KTsNCtCd0LDQtNC/0LjRgdGMMzMu0KLQtdC60YHRgiA9ICLQntCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J3QsNC00L/QuNGB0YwzMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMzM+XQ0KWzzQndCw0LTQv9C40YHRjDM0XQ0K0J3QsNC00L/QuNGB0YwzNC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA2Ow0K0J3QsNC00L/QuNGB0YwzNC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNik7DQrQndCw0LTQv9C40YHRjDM0LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzg7DQrQndCw0LTQv9C40YHRjDM0LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDQ5KTsNCtCd0LDQtNC/0LjRgdGMMzQu0KLQtdC60YHRgiA9ICLQotC40L8iOw0K0J3QsNC00L/QuNGB0YwzNC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMzQ+XQ0KWzzQktC60LvQsNC00LrQsDddDQrQktC60LvQsNC00LrQsDcu0KDQvtC00LjRgtC10LvRjCA9INCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MTsNCtCS0LrQu9Cw0LTQutCwNy7QotC10LrRgdGCID0gIjYiOw0KW9CS0LrQu9Cw0LTQutCwNz5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDIxXQ0K0J/QvtC70LXQktCy0L7QtNCwMjEu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwNzsNCtCf0L7Qu9C10JLQstC+0LTQsDIxLtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDIxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDIxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNDI7DQrQn9C+0LvQtdCS0LLQvtC00LAyMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE2LCAxMTApOw0K0J/QvtC70LXQktCy0L7QtNCwMjEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAyMT5dDQpbPNCd0LDQtNC/0LjRgdGMMzVdDQrQndCw0LTQv9C40YHRjDM1LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDc7DQrQndCw0LTQv9C40YHRjDM1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMMzUu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MTsNCtCd0LDQtNC/0LjRgdGMMzUu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxNiwgOTIpOw0K0J3QsNC00L/QuNGB0YwzNS7QotC10LrRgdGCID0gItCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0YwzNS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMzU+XQ0KWzzQndCw0LTQv9C40YHRjDM2XQ0K0J3QsNC00L/QuNGB0YwzNi7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA3Ow0K0J3QsNC00L/QuNGB0YwzNi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDM2LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzU7DQrQndCw0LTQv9C40YHRjDM2LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTYsIDkpOw0K0J3QsNC00L/QuNGB0YwzNi7QotC10LrRgdGCID0gItCY0LzRjyI7DQrQndCw0LTQv9C40YHRjDM2LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0YwzNj5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMTRdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE0LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDc7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE0LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTQu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTQu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxNC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE2LCA2OCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE0LtCi0LXQutGB0YIgPSAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE0LtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA2MTU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE0LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIiwgItCi0LjQvzog0JHRg9C70LXQstC+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTQu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCh0YLRgNC+0LrQsC4iLCAi0KLQuNC/OiDQodGC0YDQvtC60LAuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KfQuNGB0LvQvi4iLCAi0KLQuNC/OiDQp9C40YHQu9C+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTQu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDE0Pl0NCls80J/QvtC70LXQktCy0L7QtNCwMjJdDQrQn9C+0LvQtdCS0LLQvtC00LAyMi7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA3Ow0K0J/QvtC70LXQktCy0L7QtNCwMjIu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMjIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzNjsNCtCf0L7Qu9C10JLQstC+0LTQsDIyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTYsIDI2KTsNCtCf0L7Qu9C10JLQstC+0LTQsDIyLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMjI+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDE1XQ0K0J/QvtC70LXQktGL0LHQvtGA0LAxNS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA3Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxNS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE1LtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTUu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMzUsIDI2KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTUu0KLQtdC60YHRgiA9ICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNS7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxNS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE1LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvdC10L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMTU+XQ0KWzzQndCw0LTQv9C40YHRjDM3XQ0K0J3QsNC00L/QuNGB0YwzNy7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA3Ow0K0J3QsNC00L/QuNGB0YwzNy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDM3LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzc7DQrQndCw0LTQv9C40YHRjDM3LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzM1LCA5KTsNCtCd0LDQtNC/0LjRgdGMMzcu0KLQtdC60YHRgiA9ICLQntCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J3QsNC00L/QuNGB0YwzNy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMzc+XQ0KWzzQndCw0LTQv9C40YHRjDM4XQ0K0J3QsNC00L/QuNGB0YwzOC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA3Ow0K0J3QsNC00L/QuNGB0YwzOC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNik7DQrQndCw0LTQv9C40YHRjDM4LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzg7DQrQndCw0LTQv9C40YHRjDM4LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTYsIDQ5KTsNCtCd0LDQtNC/0LjRgdGMMzgu0KLQtdC60YHRgiA9ICLQotC40L8iOw0K0J3QsNC00L/QuNGB0YwzOC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMzg+XQ0KWzzQktC60LvQsNC00LrQsDhdDQrQktC60LvQsNC00LrQsDgu0KDQvtC00LjRgtC10LvRjCA9INCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MTsNCtCS0LrQu9Cw0LTQutCwOC7QotC10LrRgdGCID0gIjciOw0KW9CS0LrQu9Cw0LTQutCwOD5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDIzXQ0K0J/QvtC70LXQktCy0L7QtNCwMjMu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwODsNCtCf0L7Qu9C10JLQstC+0LTQsDIzLtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDIzLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDIzLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNDI7DQrQn9C+0LvQtdCS0LLQvtC00LAyMy7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCAxMTApOw0K0J/QvtC70LXQktCy0L7QtNCwMjMu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAyMz5dDQpbPNCd0LDQtNC/0LjRgdGMMzldDQrQndCw0LTQv9C40YHRjDM5LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDg7DQrQndCw0LTQv9C40YHRjDM5LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMMzku0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MTsNCtCd0LDQtNC/0LjRgdGMMzku0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgOTIpOw0K0J3QsNC00L/QuNGB0YwzOS7QotC10LrRgdGCID0gItCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0YwzOS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMzk+XQ0KWzzQndCw0LTQv9C40YHRjDQwXQ0K0J3QsNC00L/QuNGB0Yw0MC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA4Ow0K0J3QsNC00L/QuNGB0Yw0MC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDQwLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzU7DQrQndCw0LTQv9C40YHRjDQwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDkpOw0K0J3QsNC00L/QuNGB0Yw0MC7QotC10LrRgdGCID0gItCY0LzRjyI7DQrQndCw0LTQv9C40YHRjDQwLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw0MD5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMTZdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE2LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDg7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE2LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTYu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTYu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxNi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCA2OCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE2LtCi0LXQutGB0YIgPSAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE2LtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA2MTU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE2LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE2LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIiwgItCi0LjQvzog0JHRg9C70LXQstC+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTYu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCh0YLRgNC+0LrQsC4iLCAi0KLQuNC/OiDQodGC0YDQvtC60LAuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KfQuNGB0LvQvi4iLCAi0KLQuNC/OiDQp9C40YHQu9C+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTYu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDE2Pl0NCls80J/QvtC70LXQktCy0L7QtNCwMjRdDQrQn9C+0LvQtdCS0LLQvtC00LAyNC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA4Ow0K0J/QvtC70LXQktCy0L7QtNCwMjQu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMjQu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzNjsNCtCf0L7Qu9C10JLQstC+0LTQsDI0LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDI2KTsNCtCf0L7Qu9C10JLQstC+0LTQsDI0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMjQ+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDE3XQ0K0J/QvtC70LXQktGL0LHQvtGA0LAxNy7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA4Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxNy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE3LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE3LtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTcu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMzcsIDI2KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTcu0KLQtdC60YHRgiA9ICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNy7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxNy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxNy7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE3LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvdC10L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMTc+XQ0KWzzQndCw0LTQv9C40YHRjDQxXQ0K0J3QsNC00L/QuNGB0Yw0MS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA4Ow0K0J3QsNC00L/QuNGB0Yw0MS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDQxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzc7DQrQndCw0LTQv9C40YHRjDQxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzM3LCA5KTsNCtCd0LDQtNC/0LjRgdGMNDEu0KLQtdC60YHRgiA9ICLQntCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J3QsNC00L/QuNGB0Yw0MS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNDE+XQ0KWzzQndCw0LTQv9C40YHRjDQyXQ0K0J3QsNC00L/QuNGB0Yw0Mi7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA4Ow0K0J3QsNC00L/QuNGB0Yw0Mi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNik7DQrQndCw0LTQv9C40YHRjDQyLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzg7DQrQndCw0LTQv9C40YHRjDQyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDQ5KTsNCtCd0LDQtNC/0LjRgdGMNDIu0KLQtdC60YHRgiA9ICLQotC40L8iOw0K0J3QsNC00L/QuNGB0Yw0Mi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNDI+XQ0KWzzQktC60LvQsNC00LrQsDldDQrQktC60LvQsNC00LrQsDku0KDQvtC00LjRgtC10LvRjCA9INCf0LDQvdC10LvRjNCS0LrQu9Cw0LTQvtC6MTsNCtCS0LrQu9Cw0LTQutCwOS7QotC10LrRgdGCID0gIjgiOw0KW9CS0LrQu9Cw0LTQutCwOT5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDI1XQ0K0J/QvtC70LXQktCy0L7QtNCwMjUu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwOTsNCtCf0L7Qu9C10JLQstC+0LTQsDI1LtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDI1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDczKTsNCtCf0L7Qu9C10JLQstC+0LTQsDI1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gNDI7DQrQn9C+0LvQtdCS0LLQvtC00LAyNS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCAxMTApOw0K0J/QvtC70LXQktCy0L7QtNCwMjUu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQn9C+0LvQtdCS0LLQvtC00LAyNT5dDQpbPNCd0LDQtNC/0LjRgdGMNDNdDQrQndCw0LTQv9C40YHRjDQzLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDk7DQrQndCw0LTQv9C40YHRjDQzLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMNDMu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MTsNCtCd0LDQtNC/0LjRgdGMNDMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOCwgOTIpOw0K0J3QsNC00L/QuNGB0Yw0My7QotC10LrRgdGCID0gItCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0Yw0My7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNDM+XQ0KWzzQndCw0LTQv9C40YHRjDQ0XQ0K0J3QsNC00L/QuNGB0Yw0NC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA5Ow0K0J3QsNC00L/QuNGB0Yw0NC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDQ0LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzU7DQrQndCw0LTQv9C40YHRjDQ0LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDkpOw0K0J3QsNC00L/QuNGB0Yw0NC7QotC10LrRgdGCID0gItCY0LzRjyI7DQrQndCw0LTQv9C40YHRjDQ0LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw0ND5dDQpbPNCf0L7Qu9C10JLRi9Cx0L7RgNCwMThdDQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE4LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE4LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg2MTUsIDI0KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTgu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTgu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxOC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE4LCA2OCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE4LtCi0LXQutGB0YIgPSAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSI7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE4LtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA2MTU7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE4LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE4LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIiwgItCi0LjQvzog0JHRg9C70LXQstC+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTgu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCh0YLRgNC+0LrQsC4iLCAi0KLQuNC/OiDQodGC0YDQvtC60LAuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxOC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KfQuNGB0LvQvi4iLCAi0KLQuNC/OiDQp9C40YHQu9C+LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTgu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iLCAi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxOC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDE4Pl0NCls80J/QvtC70LXQktCy0L7QtNCwMjZdDQrQn9C+0LvQtdCS0LLQvtC00LAyNi7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA5Ow0K0J/QvtC70LXQktCy0L7QtNCwMjYu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMjYu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzNjsNCtCf0L7Qu9C10JLQstC+0LTQsDI2LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDI2KTsNCtCf0L7Qu9C10JLQstC+0LTQsDI2LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMjY+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDE5XQ0K0J/QvtC70LXQktGL0LHQvtGA0LAxOS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA5Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxOS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMjk2LCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE5LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE5LtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTku0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMzcsIDI2KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMTku0KLQtdC60YHRgiA9ICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxOS7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMjk2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAxOS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0K0J/QvtC70LXQktGL0LHQvtGA0LAxOS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDE5LtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIsICLQvdC10L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMTk+XQ0KWzzQndCw0LTQv9C40YHRjDQ1XQ0K0J3QsNC00L/QuNGB0Yw0NS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA5Ow0K0J3QsNC00L/QuNGB0Yw0NS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNCk7DQrQndCw0LTQv9C40YHRjDQ1LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzc7DQrQndCw0LTQv9C40YHRjDQ1LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzM3LCA5KTsNCtCd0LDQtNC/0LjRgdGMNDUu0KLQtdC60YHRgiA9ICLQntCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiOw0K0J3QsNC00L/QuNGB0Yw0NS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNDU+XQ0KWzzQndCw0LTQv9C40YHRjDQ2XQ0K0J3QsNC00L/QuNGB0Yw0Ni7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LA5Ow0K0J3QsNC00L/QuNGB0Yw0Ni7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNik7DQrQndCw0LTQv9C40YHRjDQ2LtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzg7DQrQndCw0LTQv9C40YHRjDQ2LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTgsIDQ5KTsNCtCd0LDQtNC/0LjRgdGMNDYu0KLQtdC60YHRgiA9ICLQotC40L8iOw0K0J3QsNC00L/QuNGB0Yw0Ni7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNDY+XQ0KWzzQktC60LvQsNC00LrQsDEwXQ0K0JLQutC70LDQtNC60LAxMC7QoNC+0LTQuNGC0LXQu9GMID0g0J/QsNC90LXQu9GM0JLQutC70LDQtNC+0LoxOw0K0JLQutC70LDQtNC60LAxMC7QotC10LrRgdGCID0gIjkiOw0KW9CS0LrQu9Cw0LTQutCwMTA+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LAyN10NCtCf0L7Qu9C10JLQstC+0LTQsDI3LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDEwOw0K0J/QvtC70LXQktCy0L7QtNCwMjcu0JzQvdC+0LPQvtGB0YLRgNC+0YfQvdGL0LnQoNC10LbQuNC8ID0g0JjRgdGC0LjQvdCwOw0K0J/QvtC70LXQktCy0L7QtNCwMjcu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDYxNSwgNzMpOw0K0J/QvtC70LXQktCy0L7QtNCwMjcu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MjsNCtCf0L7Qu9C10JLQstC+0LTQsDI3LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDExMCk7DQrQn9C+0LvQtdCS0LLQvtC00LAyNy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLQstC+0LTQsDI3Pl0NCls80J3QsNC00L/QuNGB0Yw0N10NCtCd0LDQtNC/0LjRgdGMNDcu0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMTA7DQrQndCw0LTQv9C40YHRjDQ3LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE1KTsNCtCd0LDQtNC/0LjRgdGMNDcu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0MTsNCtCd0LDQtNC/0LjRgdGMNDcu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgxOSwgOTIpOw0K0J3QsNC00L/QuNGB0Yw0Ny7QotC10LrRgdGCID0gItCe0L/QuNGB0LDQvdC40LUiOw0K0J3QsNC00L/QuNGB0Yw0Ny7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNDc+XQ0KWzzQndCw0LTQv9C40YHRjDQ4XQ0K0J3QsNC00L/QuNGB0Yw0OC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAxMDsNCtCd0LDQtNC/0LjRgdGMNDgu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDEwMCwgMTQpOw0K0J3QsNC00L/QuNGB0Yw0OC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDM1Ow0K0J3QsNC00L/QuNGB0Yw0OC7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDE5LCA5KTsNCtCd0LDQtNC/0LjRgdGMNDgu0KLQtdC60YHRgiA9ICLQmNC80Y8iOw0K0J3QsNC00L/QuNGB0Yw0OC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNDg+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDIwXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAyMC7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAxMDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjAu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDYxNSwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMC7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDQwOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMC7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDY4KTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjAu0KLQtdC60YHRgiA9ICLQudC50LnQudC50LnQudC50LnQuSAgINC50LnQudC50LnQudC50LnQudC5IjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjAu0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDYxNTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjAu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjAu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCR0YPQu9C10LLQvi4iLCAi0KLQuNC/OiDQkdGD0LvQtdCy0L4uIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0KHRgtGA0L7QutCwLiIsICLQotC40L86INCh0YLRgNC+0LrQsC4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIwLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQp9C40YHQu9C+LiIsICLQotC40L86INCn0LjRgdC70L4uIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMC7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0J/RgNC+0LjQt9Cy0L7Qu9GM0L3Ri9C5LiIsICLQotC40L86INCf0YDQvtC40LfQstC+0LvRjNC90YvQuS4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIwLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIsICLQudC50LnQudC50LnQudC50LnQuSAgINC50LnQudC50LnQudC50LnQudC5IikpOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMjA+XQ0KWzzQn9C+0LvQtdCS0LLQvtC00LAyOF0NCtCf0L7Qu9C10JLQstC+0LTQsDI4LtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDEwOw0K0J/QvtC70LXQktCy0L7QtNCwMjgu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjIpOw0K0J/QvtC70LXQktCy0L7QtNCwMjgu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzNjsNCtCf0L7Qu9C10JLQstC+0LTQsDI4LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDI2KTsNCtCf0L7Qu9C10JLQstC+0LTQsDI4LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMjg+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDIxXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAyMS7QoNC+0LTQuNGC0LXQu9GMID0g0JLQutC70LDQtNC60LAxMDsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjEu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDI5NiwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDM5Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAyMS7QktGL0YHQvtGC0LDQrdC70LXQvNC10L3RgtCwID0gMTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMzM4LCAyNik7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIxLtCi0LXQutGB0YIgPSAi0L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjEu0KjQuNGA0LjQvdCw0JLRi9C/0LDQtNCw0Y7RidC10LPQvtCh0L/QuNGB0LrQsCA9IDI5NjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjEu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiLCAi0L7QsdGP0LfQsNGC0LXQu9GM0L3Ri9C5IikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMS7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC90LXQvtCx0Y/Qt9Cw0YLQtdC70YzQvdGL0LkiLCAi0L3QtdC+0LHRj9C30LDRgtC10LvRjNC90YvQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDIxPl0NCls80J3QsNC00L/QuNGB0Yw0OV0NCtCd0LDQtNC/0LjRgdGMNDku0KDQvtC00LjRgtC10LvRjCA9INCS0LrQu9Cw0LTQutCwMTA7DQrQndCw0LTQv9C40YHRjDQ5LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDAsIDE0KTsNCtCd0LDQtNC/0LjRgdGMNDku0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzNzsNCtCd0LDQtNC/0LjRgdGMNDku0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgzMzgsIDkpOw0K0J3QsNC00L/QuNGB0Yw0OS7QotC10LrRgdGCID0gItCe0LHRj9C30LDRgtC10LvRjNC90YvQuSI7DQrQndCw0LTQv9C40YHRjDQ5LtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J3QsNC00L/QuNGB0Yw0OT5dDQpbPNCd0LDQtNC/0LjRgdGMNTBdDQrQndCw0LTQv9C40YHRjDUwLtCg0L7QtNC40YLQtdC70YwgPSDQktC60LvQsNC00LrQsDEwOw0K0J3QsNC00L/QuNGB0Yw1MC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNik7DQrQndCw0LTQv9C40YHRjDUwLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMzg7DQrQndCw0LTQv9C40YHRjDUwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMTksIDQ5KTsNCtCd0LDQtNC/0LjRgdGMNTAu0KLQtdC60YHRgiA9ICLQotC40L8iOw0K0J3QsNC00L/QuNGB0Yw1MC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMNTA+XQ0KWzzQndCw0LTQv9C40YHRjDEwXQ0K0J3QsNC00L/QuNGB0YwxMC7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0YwxMC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxNyk7DQrQndCw0LTQv9C40YHRjDEwLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTc7DQrQndCw0LTQv9C40YHRjDEwLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDI5NCk7DQrQndCw0LTQv9C40YHRjDEwLtCi0LXQutGB0YIgPSAi0J/QsNGA0LDQvNC10YLRgNGLIjsNCtCd0LDQtNC/0LjRgdGMMTAu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDEwPl0NCls80J/QvtC70LXQktGL0LHQvtGA0LAyXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDY1NiwgMjQpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTg7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0JLRi9GB0L7RgtCw0K3Qu9C10LzQtdC90YLQsCA9IDE2Ow0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDE5NCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KLQtdC60YHRgiA9ICLQotC40L86INCR0YPQu9C10LLQvi4iOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCo0LjRgNC40L3QsNCS0YvQv9Cw0LTQsNGO0YnQtdCz0L7QodC/0LjRgdC60LAgPSA2NTY7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItCi0LjQvzog0JHRg9C70LXQstC+LiIsICLQotC40L86INCR0YPQu9C10LLQvi4iKSk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIu0K3Qu9C10LzQtdC90YLRiy7QlNC+0LHQsNCy0LjRgtGMKNCkLtCt0LvQtdC80LXQvdGC0KHQv9C40YHQutCwKCLQotC40L86INCh0YLRgNC+0LrQsC4iLCAi0KLQuNC/OiDQodGC0YDQvtC60LAuIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQp9C40YHQu9C+LiIsICLQotC40L86INCn0LjRgdC70L4uIikpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyLtCt0LvQtdC80LXQvdGC0Ysu0JTQvtCx0LDQstC40YLRjCjQpC7QrdC70LXQvNC10L3RgtCh0L/QuNGB0LrQsCgi0KLQuNC/OiDQn9GA0L7QuNC30LLQvtC70YzQvdGL0LkuIiwgItCi0LjQvzog0J/RgNC+0LjQt9Cy0L7Qu9GM0L3Ri9C5LiIpKTsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMi7QrdC70LXQvNC10L3RgtGLLtCU0L7QsdCw0LLQuNGC0Ywo0KQu0K3Qu9C10LzQtdC90YLQodC/0LjRgdC60LAoItC50LnQudC50LnQudC50LnQudC5ICAg0LnQudC50LnQudC50LnQudC50LkiLCAi0LnQudC50LnQudC50LnQudC50LkgICDQudC50LnQudC50LnQudC50LnQuSIpKTsNClvQn9C+0LvQtdCS0YvQsdC+0YDQsDI+XQ0KWzzQn9C+0LvQtdCS0YvQsdC+0YDQsDIyXQ0K0J/QvtC70LXQktGL0LHQvtGA0LAyMi7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMzIzLCAyNCk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIyLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMTk7DQrQn9C+0LvQtdCS0YvQsdC+0YDQsDIyLtCS0YvRgdC+0YLQsNCt0LvQtdC80LXQvdGC0LAgPSAxNjsNCtCf0L7Qu9C10JLRi9Cx0L7RgNCwMjIu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgyMiwgMjYpOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMi7QqNC40YDQuNC90LDQktGL0L/QsNC00LDRjtGJ0LXQs9C+0KHQv9C40YHQutCwID0gMzIzOw0K0J/QvtC70LXQktGL0LHQvtGA0LAyMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLRi9Cx0L7RgNCwMjI+XQ0KWzzQndCw0LTQv9C40YHRjDUxXQ0K0J3QsNC00L/QuNGB0Yw1MS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw1MS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTc3LCAxNyk7DQrQndCw0LTQv9C40YHRjDUxLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjE7DQrQndCw0LTQv9C40YHRjDUxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDUyOSk7DQrQndCw0LTQv9C40YHRjDUxLtCi0LXQutGB0YIgPSAi0J/RgNC40LzQtdC90LjQvNC+INC6IjsNCtCd0LDQtNC/0LjRgdGMNTEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDUxPl0NCls80JrQvdC+0L/QutCwMl0NCtCa0L3QvtC/0LrQsDIu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCa0L3QvtC/0LrQsDIu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDc0LCA0MCk7DQrQmtC90L7Qv9C60LAyLtCf0L7RgNGP0LTQvtC60J7QsdGF0L7QtNCwID0gMjI7DQrQmtC90L7Qv9C60LAyLtCd0LDQttCw0YLQuNC1ID0gItCh0L3Rj9GC0YzQktGB0LUiOw0K0JrQvdC+0L/QutCwMi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDYwNCwgNTY0KTsNCtCa0L3QvtC/0LrQsDIu0KLQtdC60YHRgiA9ICLQodC90Y/RgtGMINCy0YHQtSI7DQrQmtC90L7Qv9C60LAyLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0JrQvdC+0L/QutCwMj5dDQpbPNCa0L3QvtC/0LrQsDNdDQrQmtC90L7Qv9C60LAzLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQmtC90L7Qv9C60LAzLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg3NCwgNDApOw0K0JrQvdC+0L/QutCwMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDIzOw0K0JrQvdC+0L/QutCwMy7QndCw0LbQsNGC0LjQtSA9ICLQn9C+0LzQtdGC0LjRgtGM0JLRgdC1IjsNCtCa0L3QvtC/0LrQsDMu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCg2MDQsIDYxMCk7DQrQmtC90L7Qv9C60LAzLtCi0LXQutGB0YIgPSAi0J/QvtC80LXRgtC40YLRjCDQstGB0LUiOw0K0JrQvdC+0L/QutCwMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Ca0L3QvtC/0LrQsDM+XQ0KWzzQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxXQ0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoNTcyLCAxODIpOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDI0Ow0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7QpNC70LDQttC60LggPSDQmNGB0YLQuNC90LA7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAwID0g0KQu0JrQvtC70L7QvdC60LAoKTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDAu0KLQtdC60YHRgiA9ICLQotC10LMiOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMC7QqNC40YDQuNC90LAgPSAxODE7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCa0L7Qu9C+0L3QutC4LtCU0L7QsdCw0LLQuNGC0Ywo0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMCk7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAxID0g0KQu0JrQvtC70L7QvdC60LAoKTsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDEu0KLQtdC60YHRgiA9ICLQmtC70LDRgdGB0KDRg9GBIjsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDEu0KjQuNGA0LjQvdCwID0gMjE2Ow0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7QmtC+0LvQvtC90LrQuC7QlNC+0LHQsNCy0LjRgtGMKNCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDEpOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMdCa0L7Qu9C+0L3QutCwMiA9INCkLtCa0L7Qu9C+0L3QutCwKCk7DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIx0JrQvtC70L7QvdC60LAyLtCi0LXQutGB0YIgPSAi0JrQu9Cw0YHRgdCQ0L3Qs9C7IjsNCtCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDIu0KjQuNGA0LjQvdCwID0gMTg1Ow0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7QmtC+0LvQvtC90LrQuC7QlNC+0LHQsNCy0LjRgtGMKNCh0L/QuNGB0L7QutCt0LvQtdC80LXQvdGC0L7QsjHQmtC+0LvQvtC90LrQsDIpOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDI2LCA1NDkpOw0K0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMS7QoNC10LbQuNC80J7RgtC+0LHRgNCw0LbQtdC90LjRjyA9INCkLtCg0LXQttC40LzQntGC0L7QsdGA0LDQttC10L3QuNGPLtCf0L7QtNGA0L7QsdC90L47DQrQodC/0LjRgdC+0LrQrdC70LXQvNC10L3RgtC+0LIxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0KHQv9C40YHQvtC60K3Qu9C10LzQtdC90YLQvtCyMT5dDQpb0KHQstC+0LnRgdGC0LLQsD5dDQo=";
    ПодключитьВнешнююКомпоненту("C:\444\111\OneScriptForms\OneScriptForms\bin\Debug\OneScriptForms.dll");
    Ф = Новый ФормыДляОдноСкрипта();

    Форма_0 = Ф.Форма();
    Форма_0.Отображать = Истина;
    Форма_0.Показать();
    Форма_0.Активизировать();

    Надпись1 = Ф.Надпись();
    Надпись3 = Ф.Надпись();
    ПолеВвода3 = Ф.ПолеВвода();
    Кнопка1 = Ф.Кнопка();
    Надпись4 = Ф.Надпись();
    Надпись5 = Ф.Надпись();
    Надпись6 = Ф.Надпись();
    ПолеВвода4 = Ф.ПолеВвода();
    Надпись7 = Ф.Надпись();
    ПолеВвода5 = Ф.ПолеВвода();
    Надпись8 = Ф.Надпись();
    Надпись9 = Ф.Надпись();
    ПолеВвода8 = Ф.ПолеВвода();
    ПанельВкладок1 = Ф.ПанельВкладок();
    Вкладка1 = Ф.Вкладка();
    Вкладка2 = Ф.Вкладка();
    Надпись10 = Ф.Надпись();
    Вкладка3 = Ф.Вкладка();
    Вкладка4 = Ф.Вкладка();
    Вкладка5 = Ф.Вкладка();
    Вкладка6 = Ф.Вкладка();
    Вкладка7 = Ф.Вкладка();
    Вкладка8 = Ф.Вкладка();
    Вкладка9 = Ф.Вкладка();
    Вкладка10 = Ф.Вкладка();
    Надпись11 = Ф.Надпись();
    ПолеВвода9 = Ф.ПолеВвода();
    Надпись12 = Ф.Надпись();
    Надпись13 = Ф.Надпись();
    ПолеВыбора1 = Ф.ПолеВыбора();
    ПолеВыбора2 = Ф.ПолеВыбора();
    ПолеВыбора3 = Ф.ПолеВыбора();
    Надпись14 = Ф.Надпись();
    ПолеВвода10 = Ф.ПолеВвода();
    ПолеВвода11 = Ф.ПолеВвода();
    Надпись15 = Ф.Надпись();
    ПолеВыбора4 = Ф.ПолеВыбора();
    ПолеВыбора5 = Ф.ПолеВыбора();
    Надпись16 = Ф.Надпись();
    Надпись17 = Ф.Надпись();
    ПолеВвода12 = Ф.ПолеВвода();
    Надпись18 = Ф.Надпись();
    ПолеВвода13 = Ф.ПолеВвода();
    Надпись19 = Ф.Надпись();
    ПолеВыбора6 = Ф.ПолеВыбора();
    ПолеВыбора7 = Ф.ПолеВыбора();
    Надпись20 = Ф.Надпись();
    Надпись21 = Ф.Надпись();
    ПолеВвода14 = Ф.ПолеВвода();
    Надпись22 = Ф.Надпись();
    ПолеВвода15 = Ф.ПолеВвода();
    Надпись23 = Ф.Надпись();
    Надпись24 = Ф.Надпись();
    ПолеВыбора8 = Ф.ПолеВыбора();
    ПолеВвода16 = Ф.ПолеВвода();
    ПолеВыбора9 = Ф.ПолеВыбора();
    Надпись25 = Ф.Надпись();
    Надпись26 = Ф.Надпись();
    ПолеВвода17 = Ф.ПолеВвода();
    Надпись27 = Ф.Надпись();
    Надпись28 = Ф.Надпись();
    ПолеВыбора10 = Ф.ПолеВыбора();
    ПолеВвода18 = Ф.ПолеВвода();
    ПолеВыбора11 = Ф.ПолеВыбора();
    Надпись29 = Ф.Надпись();
    Надпись30 = Ф.Надпись();
    ПолеВвода19 = Ф.ПолеВвода();
    Надпись31 = Ф.Надпись();
    Надпись32 = Ф.Надпись();
    ПолеВыбора12 = Ф.ПолеВыбора();
    ПолеВвода20 = Ф.ПолеВвода();
    ПолеВыбора13 = Ф.ПолеВыбора();
    Надпись33 = Ф.Надпись();
    Надпись34 = Ф.Надпись();
    ПолеВвода21 = Ф.ПолеВвода();
    Надпись35 = Ф.Надпись();
    Надпись36 = Ф.Надпись();
    ПолеВыбора14 = Ф.ПолеВыбора();
    ПолеВвода22 = Ф.ПолеВвода();
    ПолеВыбора15 = Ф.ПолеВыбора();
    Надпись37 = Ф.Надпись();
    Надпись38 = Ф.Надпись();
    ПолеВвода23 = Ф.ПолеВвода();
    Надпись39 = Ф.Надпись();
    Надпись40 = Ф.Надпись();
    ПолеВыбора16 = Ф.ПолеВыбора();
    ПолеВвода24 = Ф.ПолеВвода();
    ПолеВыбора17 = Ф.ПолеВыбора();
    Надпись41 = Ф.Надпись();
    Надпись42 = Ф.Надпись();
    ПолеВвода25 = Ф.ПолеВвода();
    Надпись43 = Ф.Надпись();
    Надпись44 = Ф.Надпись();
    ПолеВыбора18 = Ф.ПолеВыбора();
    ПолеВвода26 = Ф.ПолеВвода();
    ПолеВыбора19 = Ф.ПолеВыбора();
    Надпись45 = Ф.Надпись();
    Надпись46 = Ф.Надпись();
    ПолеВвода27 = Ф.ПолеВвода();
    Надпись47 = Ф.Надпись();
    Надпись48 = Ф.Надпись();
    ПолеВыбора20 = Ф.ПолеВыбора();
    ПолеВвода28 = Ф.ПолеВвода();
    ПолеВыбора21 = Ф.ПолеВыбора();
    Надпись49 = Ф.Надпись();
    Надпись50 = Ф.Надпись();
    ПолеВыбора22 = Ф.ПолеВыбора();
    Надпись51 = Ф.Надпись();
    Кнопка2 = Ф.Кнопка();
    Кнопка3 = Ф.Кнопка();
    СписокЭлементов1 = Ф.СписокЭлементов();

    Форма_0.Размер = Ф.Размер(723, 775);
    Форма_0.Текст = "Создание метода";
    Форма_0.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись1.Родитель = Форма_0;
    Надпись1.Размер = Ф.Размер(100, 18);
    Надпись1.ПорядокОбхода = 0;
    Надпись1.Положение = Ф.Точка(26, 9);
    Надпись1.Текст = "Класс";
    Надпись1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись3.Родитель = Форма_0;
    Надпись3.Размер = Ф.Размер(123, 19);
    Надпись3.ПорядокОбхода = 3;
    Надпись3.Положение = Ф.Точка(26, 98);
    Надпись3.Текст = "МетодОписание";
    Надпись3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода3.Родитель = Форма_0;
    ПолеВвода3.Размер = Ф.Размер(656, 51);
    ПолеВвода3.ПорядокОбхода = 2;
    ПолеВвода3.МногострочныйРежим = Истина;
    ПолеВвода3.Положение = Ф.Точка(26, 120);
    ПолеВвода3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка1.Родитель = Форма_0;
    Кнопка1.Размер = Ф.Размер(91, 39);
    Кнопка1.ПорядокОбхода = 4;
    Кнопка1.Нажатие = Ф.Действие(ЭтотОбъект, "Кн1_Нажатие");
    Кнопка1.Положение = Ф.Точка(604, 685);
    Кнопка1.Текст = "Создать метод";
    Кнопка1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись4.Родитель = Форма_0;
    Надпись4.Размер = Ф.Размер(344, 17);
    Надпись4.ПорядокОбхода = 5;
    Надпись4.Положение = Ф.Точка(351, 29);
    Надпись4.Текст = "Выходные данные будут в каталоге C:\000";
    Надпись4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись5.Родитель = Форма_0;
    Надпись5.Размер = Ф.Размер(361, 23);
    Надпись5.ПорядокОбхода = 6;
    Надпись5.Положение = Ф.Точка(351, 4);
    Надпись5.Текст = "Исходные данные лежат в каталоге C:\444\OSDFormsRu";
    Надпись5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись6.Родитель = Форма_0;
    Надпись6.Размер = Ф.Размер(100, 19);
    Надпись6.ПорядокОбхода = 7;
    Надпись6.Положение = Ф.Точка(26, 53);
    Надпись6.Текст = "МетодИмяРус";
    Надпись6.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода4.Родитель = Форма_0;
    ПолеВвода4.Размер = Ф.Размер(325, 22);
    ПолеВвода4.ПорядокОбхода = 8;
    ПолеВвода4.Положение = Ф.Точка(22, 75);
    ПолеВвода4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись7.Родитель = Форма_0;
    Надпись7.Размер = Ф.Размер(100, 18);
    Надпись7.ПорядокОбхода = 9;
    Надпись7.Положение = Ф.Точка(357, 54);
    Надпись7.Текст = "МетодИмяEn";
    Надпись7.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода5.Родитель = Форма_0;
    ПолеВвода5.Размер = Ф.Размер(325, 22);
    ПолеВвода5.ПорядокОбхода = 10;
    ПолеВвода5.Положение = Ф.Точка(353, 75);
    ПолеВвода5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись8.Родитель = Форма_0;
    Надпись8.Размер = Ф.Размер(222, 18);
    Надпись8.ПорядокОбхода = 11;
    Надпись8.Положение = Ф.Точка(26, 174);
    Надпись8.Текст = "ВозвращаемоеЗначениеТип";
    Надпись8.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись9.Родитель = Форма_0;
    Надпись9.Размер = Ф.Размер(257, 17);
    Надпись9.ПорядокОбхода = 12;
    Надпись9.Положение = Ф.Точка(26, 218);
    Надпись9.Текст = "ВозвращаемоеЗначениеОписание";
    Надпись9.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода8.Родитель = Форма_0;
    ПолеВвода8.Размер = Ф.Размер(656, 54);
    ПолеВвода8.ПорядокОбхода = 15;
    ПолеВвода8.МногострочныйРежим = Истина;
    ПолеВвода8.Положение = Ф.Точка(26, 238);
    ПолеВвода8.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПанельВкладок1.Родитель = Форма_0;
    ПанельВкладок1.Размер = Ф.Размер(656, 212);
    ПанельВкладок1.ПорядокОбхода = 16;
    ПанельВкладок1.Положение = Ф.Точка(26, 314);
    ПанельВкладок1.РазмерЭлемента = Ф.Размер(42, 18);
    ПанельВкладок1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка1.Родитель = ПанельВкладок1;
    Вкладка1.Текст = "0";

    Надпись11.Родитель = Вкладка1;
    Надпись11.Размер = Ф.Размер(100, 14);
    Надпись11.ПорядокОбхода = 0;
    Надпись11.Положение = Ф.Точка(6, 3);
    Надпись11.Текст = "Имя";
    Надпись11.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода9.Родитель = Вкладка1;
    ПолеВвода9.Размер = Ф.Размер(296, 22);
    ПолеВвода9.ПорядокОбхода = 1;
    ПолеВвода9.Положение = Ф.Точка(6, 20);
    ПолеВвода9.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись12.Родитель = Вкладка1;
    Надпись12.Размер = Ф.Размер(100, 14);
    Надпись12.ПорядокОбхода = 2;
    Надпись12.Положение = Ф.Точка(325, 3);
    Надпись12.Текст = "Обязательный";
    Надпись12.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись13.Родитель = Вкладка1;
    Надпись13.Размер = Ф.Размер(100, 16);
    Надпись13.ПорядокОбхода = 3;
    Надпись13.Положение = Ф.Точка(6, 43);
    Надпись13.Текст = "Тип";
    Надпись13.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора1.Родитель = Вкладка1;
    ПолеВыбора1.Размер = Ф.Размер(296, 24);
    ПолеВыбора1.ПорядокОбхода = 5;
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора1.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора1.ВысотаЭлемента = 16;
    ПолеВыбора1.Положение = Ф.Точка(325, 20);
    ПолеВыбора1.Текст = "обязательный";
    ПолеВыбора1.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора3.Родитель = Вкладка1;
    ПолеВыбора3.Размер = Ф.Размер(615, 24);
    ПолеВыбора3.ПорядокОбхода = 6;
    ПолеВыбора3.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора3.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора3.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора3.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора3.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора3.ВысотаЭлемента = 16;
    ПолеВыбора3.Положение = Ф.Точка(6, 62);
    ПолеВыбора3.Текст = "Тип: Булево.";
    ПолеВыбора3.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись14.Родитель = Вкладка1;
    Надпись14.Размер = Ф.Размер(100, 15);
    Надпись14.ПорядокОбхода = 7;
    Надпись14.Положение = Ф.Точка(6, 86);
    Надпись14.Текст = "Описание";
    Надпись14.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода10.Родитель = Вкладка1;
    ПолеВвода10.Размер = Ф.Размер(615, 73);
    ПолеВвода10.ПорядокОбхода = 8;
    ПолеВвода10.МногострочныйРежим = Истина;
    ПолеВвода10.Положение = Ф.Точка(6, 104);
    ПолеВвода10.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка2.Родитель = ПанельВкладок1;
    Вкладка2.Текст = "1";

    ПолеВвода11.Родитель = Вкладка2;
    ПолеВвода11.Размер = Ф.Размер(615, 73);
    ПолеВвода11.ПорядокОбхода = 26;
    ПолеВвода11.МногострочныйРежим = Истина;
    ПолеВвода11.Положение = Ф.Точка(6, 107);
    ПолеВвода11.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись15.Родитель = Вкладка2;
    Надпись15.Размер = Ф.Размер(100, 15);
    Надпись15.ПорядокОбхода = 25;
    Надпись15.Положение = Ф.Точка(6, 89);
    Надпись15.Текст = "Описание";
    Надпись15.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора4.Родитель = Вкладка2;
    ПолеВыбора4.Размер = Ф.Размер(615, 24);
    ПолеВыбора4.ПорядокОбхода = 24;
    ПолеВыбора4.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора4.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора4.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора4.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора4.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора4.ВысотаЭлемента = 16;
    ПолеВыбора4.Положение = Ф.Точка(6, 65);
    ПолеВыбора4.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора4.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора5.Родитель = Вкладка2;
    ПолеВыбора5.Размер = Ф.Размер(296, 24);
    ПолеВыбора5.ПорядокОбхода = 23;
    ПолеВыбора5.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора5.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора5.ВысотаЭлемента = 16;
    ПолеВыбора5.Положение = Ф.Точка(325, 23);
    ПолеВыбора5.Текст = "обязательный";
    ПолеВыбора5.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись16.Родитель = Вкладка2;
    Надпись16.Размер = Ф.Размер(100, 16);
    Надпись16.ПорядокОбхода = 22;
    Надпись16.Положение = Ф.Точка(6, 46);
    Надпись16.Текст = "Тип";
    Надпись16.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись17.Родитель = Вкладка2;
    Надпись17.Размер = Ф.Размер(100, 14);
    Надпись17.ПорядокОбхода = 21;
    Надпись17.Положение = Ф.Точка(325, 6);
    Надпись17.Текст = "Обязательный";
    Надпись17.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода12.Родитель = Вкладка2;
    ПолеВвода12.Размер = Ф.Размер(296, 22);
    ПолеВвода12.ПорядокОбхода = 20;
    ПолеВвода12.Положение = Ф.Точка(6, 23);
    ПолеВвода12.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись18.Родитель = Вкладка2;
    Надпись18.Размер = Ф.Размер(100, 14);
    Надпись18.ПорядокОбхода = 19;
    Надпись18.Положение = Ф.Точка(6, 6);
    Надпись18.Текст = "Имя";
    Надпись18.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка3.Родитель = ПанельВкладок1;
    Вкладка3.Текст = "2";

    ПолеВвода13.Родитель = Вкладка3;
    ПолеВвода13.Размер = Ф.Размер(615, 73);
    ПолеВвода13.ПорядокОбхода = 34;
    ПолеВвода13.МногострочныйРежим = Истина;
    ПолеВвода13.Положение = Ф.Точка(15, 110);
    ПолеВвода13.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись19.Родитель = Вкладка3;
    Надпись19.Размер = Ф.Размер(100, 15);
    Надпись19.ПорядокОбхода = 33;
    Надпись19.Положение = Ф.Точка(15, 92);
    Надпись19.Текст = "Описание";
    Надпись19.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора6.Родитель = Вкладка3;
    ПолеВыбора6.Размер = Ф.Размер(615, 24);
    ПолеВыбора6.ПорядокОбхода = 32;
    ПолеВыбора6.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора6.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора6.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора6.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора6.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора6.ВысотаЭлемента = 16;
    ПолеВыбора6.Положение = Ф.Точка(15, 68);
    ПолеВыбора6.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора6.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора6.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора7.Родитель = Вкладка3;
    ПолеВыбора7.Размер = Ф.Размер(296, 24);
    ПолеВыбора7.ПорядокОбхода = 31;
    ПолеВыбора7.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора7.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора7.ВысотаЭлемента = 16;
    ПолеВыбора7.Положение = Ф.Точка(334, 26);
    ПолеВыбора7.Текст = "обязательный";
    ПолеВыбора7.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора7.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись20.Родитель = Вкладка3;
    Надпись20.Размер = Ф.Размер(100, 16);
    Надпись20.ПорядокОбхода = 30;
    Надпись20.Положение = Ф.Точка(15, 49);
    Надпись20.Текст = "Тип";
    Надпись20.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись21.Родитель = Вкладка3;
    Надпись21.Размер = Ф.Размер(100, 14);
    Надпись21.ПорядокОбхода = 29;
    Надпись21.Положение = Ф.Точка(334, 9);
    Надпись21.Текст = "Обязательный";
    Надпись21.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода14.Родитель = Вкладка3;
    ПолеВвода14.Размер = Ф.Размер(296, 22);
    ПолеВвода14.ПорядокОбхода = 28;
    ПолеВвода14.Положение = Ф.Точка(15, 26);
    ПолеВвода14.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись22.Родитель = Вкладка3;
    Надпись22.Размер = Ф.Размер(100, 14);
    Надпись22.ПорядокОбхода = 27;
    Надпись22.Положение = Ф.Точка(15, 9);
    Надпись22.Текст = "Имя";
    Надпись22.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка4.Родитель = ПанельВкладок1;
    Вкладка4.Текст = "3";

    ПолеВвода15.Родитель = Вкладка4;
    ПолеВвода15.Размер = Ф.Размер(615, 73);
    ПолеВвода15.ПорядокОбхода = 42;
    ПолеВвода15.МногострочныйРежим = Истина;
    ПолеВвода15.Положение = Ф.Точка(18, 110);
    ПолеВвода15.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись23.Родитель = Вкладка4;
    Надпись23.Размер = Ф.Размер(100, 15);
    Надпись23.ПорядокОбхода = 41;
    Надпись23.Положение = Ф.Точка(18, 92);
    Надпись23.Текст = "Описание";
    Надпись23.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись24.Родитель = Вкладка4;
    Надпись24.Размер = Ф.Размер(100, 14);
    Надпись24.ПорядокОбхода = 35;
    Надпись24.Положение = Ф.Точка(18, 9);
    Надпись24.Текст = "Имя";
    Надпись24.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора8.Родитель = Вкладка4;
    ПолеВыбора8.Размер = Ф.Размер(615, 24);
    ПолеВыбора8.ПорядокОбхода = 40;
    ПолеВыбора8.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора8.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора8.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора8.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора8.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора8.ВысотаЭлемента = 16;
    ПолеВыбора8.Положение = Ф.Точка(18, 68);
    ПолеВыбора8.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора8.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора8.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода16.Родитель = Вкладка4;
    ПолеВвода16.Размер = Ф.Размер(296, 22);
    ПолеВвода16.ПорядокОбхода = 36;
    ПолеВвода16.Положение = Ф.Точка(18, 26);
    ПолеВвода16.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора9.Родитель = Вкладка4;
    ПолеВыбора9.Размер = Ф.Размер(296, 24);
    ПолеВыбора9.ПорядокОбхода = 39;
    ПолеВыбора9.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора9.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора9.ВысотаЭлемента = 16;
    ПолеВыбора9.Положение = Ф.Точка(337, 26);
    ПолеВыбора9.Текст = "обязательный";
    ПолеВыбора9.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора9.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись25.Родитель = Вкладка4;
    Надпись25.Размер = Ф.Размер(100, 14);
    Надпись25.ПорядокОбхода = 37;
    Надпись25.Положение = Ф.Точка(337, 9);
    Надпись25.Текст = "Обязательный";
    Надпись25.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись26.Родитель = Вкладка4;
    Надпись26.Размер = Ф.Размер(100, 16);
    Надпись26.ПорядокОбхода = 38;
    Надпись26.Положение = Ф.Точка(18, 49);
    Надпись26.Текст = "Тип";
    Надпись26.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка5.Родитель = ПанельВкладок1;
    Вкладка5.Текст = "4";

    ПолеВвода17.Родитель = Вкладка5;
    ПолеВвода17.Размер = Ф.Размер(615, 73);
    ПолеВвода17.ПорядокОбхода = 42;
    ПолеВвода17.МногострочныйРежим = Истина;
    ПолеВвода17.Положение = Ф.Точка(17, 110);
    ПолеВвода17.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись27.Родитель = Вкладка5;
    Надпись27.Размер = Ф.Размер(100, 15);
    Надпись27.ПорядокОбхода = 41;
    Надпись27.Положение = Ф.Точка(17, 92);
    Надпись27.Текст = "Описание";
    Надпись27.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись28.Родитель = Вкладка5;
    Надпись28.Размер = Ф.Размер(100, 14);
    Надпись28.ПорядокОбхода = 35;
    Надпись28.Положение = Ф.Точка(17, 9);
    Надпись28.Текст = "Имя";
    Надпись28.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора10.Родитель = Вкладка5;
    ПолеВыбора10.Размер = Ф.Размер(615, 24);
    ПолеВыбора10.ПорядокОбхода = 40;
    ПолеВыбора10.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора10.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора10.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора10.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора10.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора10.ВысотаЭлемента = 16;
    ПолеВыбора10.Положение = Ф.Точка(17, 68);
    ПолеВыбора10.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора10.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора10.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода18.Родитель = Вкладка5;
    ПолеВвода18.Размер = Ф.Размер(296, 22);
    ПолеВвода18.ПорядокОбхода = 36;
    ПолеВвода18.Положение = Ф.Точка(17, 26);
    ПолеВвода18.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора11.Родитель = Вкладка5;
    ПолеВыбора11.Размер = Ф.Размер(296, 24);
    ПолеВыбора11.ПорядокОбхода = 39;
    ПолеВыбора11.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора11.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора11.ВысотаЭлемента = 16;
    ПолеВыбора11.Положение = Ф.Точка(336, 26);
    ПолеВыбора11.Текст = "обязательный";
    ПолеВыбора11.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора11.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись29.Родитель = Вкладка5;
    Надпись29.Размер = Ф.Размер(100, 14);
    Надпись29.ПорядокОбхода = 37;
    Надпись29.Положение = Ф.Точка(336, 9);
    Надпись29.Текст = "Обязательный";
    Надпись29.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись30.Родитель = Вкладка5;
    Надпись30.Размер = Ф.Размер(100, 16);
    Надпись30.ПорядокОбхода = 38;
    Надпись30.Положение = Ф.Точка(17, 49);
    Надпись30.Текст = "Тип";
    Надпись30.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка6.Родитель = ПанельВкладок1;
    Вкладка6.Текст = "5";

    ПолеВвода19.Родитель = Вкладка6;
    ПолеВвода19.Размер = Ф.Размер(615, 73);
    ПолеВвода19.ПорядокОбхода = 42;
    ПолеВвода19.МногострочныйРежим = Истина;
    ПолеВвода19.Положение = Ф.Точка(19, 110);
    ПолеВвода19.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись31.Родитель = Вкладка6;
    Надпись31.Размер = Ф.Размер(100, 15);
    Надпись31.ПорядокОбхода = 41;
    Надпись31.Положение = Ф.Точка(19, 92);
    Надпись31.Текст = "Описание";
    Надпись31.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись32.Родитель = Вкладка6;
    Надпись32.Размер = Ф.Размер(100, 14);
    Надпись32.ПорядокОбхода = 35;
    Надпись32.Положение = Ф.Точка(19, 9);
    Надпись32.Текст = "Имя";
    Надпись32.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора12.Родитель = Вкладка6;
    ПолеВыбора12.Размер = Ф.Размер(615, 24);
    ПолеВыбора12.ПорядокОбхода = 40;
    ПолеВыбора12.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора12.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора12.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора12.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора12.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора12.ВысотаЭлемента = 16;
    ПолеВыбора12.Положение = Ф.Точка(19, 68);
    ПолеВыбора12.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора12.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора12.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода20.Родитель = Вкладка6;
    ПолеВвода20.Размер = Ф.Размер(296, 22);
    ПолеВвода20.ПорядокОбхода = 36;
    ПолеВвода20.Положение = Ф.Точка(19, 26);
    ПолеВвода20.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора13.Родитель = Вкладка6;
    ПолеВыбора13.Размер = Ф.Размер(296, 24);
    ПолеВыбора13.ПорядокОбхода = 39;
    ПолеВыбора13.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора13.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора13.ВысотаЭлемента = 16;
    ПолеВыбора13.Положение = Ф.Точка(338, 26);
    ПолеВыбора13.Текст = "обязательный";
    ПолеВыбора13.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора13.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись33.Родитель = Вкладка6;
    Надпись33.Размер = Ф.Размер(100, 14);
    Надпись33.ПорядокОбхода = 37;
    Надпись33.Положение = Ф.Точка(338, 9);
    Надпись33.Текст = "Обязательный";
    Надпись33.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись34.Родитель = Вкладка6;
    Надпись34.Размер = Ф.Размер(100, 16);
    Надпись34.ПорядокОбхода = 38;
    Надпись34.Положение = Ф.Точка(19, 49);
    Надпись34.Текст = "Тип";
    Надпись34.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка7.Родитель = ПанельВкладок1;
    Вкладка7.Текст = "6";

    ПолеВвода21.Родитель = Вкладка7;
    ПолеВвода21.Размер = Ф.Размер(615, 73);
    ПолеВвода21.ПорядокОбхода = 42;
    ПолеВвода21.МногострочныйРежим = Истина;
    ПолеВвода21.Положение = Ф.Точка(16, 110);
    ПолеВвода21.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись35.Родитель = Вкладка7;
    Надпись35.Размер = Ф.Размер(100, 15);
    Надпись35.ПорядокОбхода = 41;
    Надпись35.Положение = Ф.Точка(16, 92);
    Надпись35.Текст = "Описание";
    Надпись35.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись36.Родитель = Вкладка7;
    Надпись36.Размер = Ф.Размер(100, 14);
    Надпись36.ПорядокОбхода = 35;
    Надпись36.Положение = Ф.Точка(16, 9);
    Надпись36.Текст = "Имя";
    Надпись36.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора14.Родитель = Вкладка7;
    ПолеВыбора14.Размер = Ф.Размер(615, 24);
    ПолеВыбора14.ПорядокОбхода = 40;
    ПолеВыбора14.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора14.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора14.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора14.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора14.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора14.ВысотаЭлемента = 16;
    ПолеВыбора14.Положение = Ф.Точка(16, 68);
    ПолеВыбора14.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора14.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора14.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода22.Родитель = Вкладка7;
    ПолеВвода22.Размер = Ф.Размер(296, 22);
    ПолеВвода22.ПорядокОбхода = 36;
    ПолеВвода22.Положение = Ф.Точка(16, 26);
    ПолеВвода22.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора15.Родитель = Вкладка7;
    ПолеВыбора15.Размер = Ф.Размер(296, 24);
    ПолеВыбора15.ПорядокОбхода = 39;
    ПолеВыбора15.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора15.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора15.ВысотаЭлемента = 16;
    ПолеВыбора15.Положение = Ф.Точка(335, 26);
    ПолеВыбора15.Текст = "обязательный";
    ПолеВыбора15.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора15.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись37.Родитель = Вкладка7;
    Надпись37.Размер = Ф.Размер(100, 14);
    Надпись37.ПорядокОбхода = 37;
    Надпись37.Положение = Ф.Точка(335, 9);
    Надпись37.Текст = "Обязательный";
    Надпись37.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись38.Родитель = Вкладка7;
    Надпись38.Размер = Ф.Размер(100, 16);
    Надпись38.ПорядокОбхода = 38;
    Надпись38.Положение = Ф.Точка(16, 49);
    Надпись38.Текст = "Тип";
    Надпись38.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка8.Родитель = ПанельВкладок1;
    Вкладка8.Текст = "7";

    ПолеВвода23.Родитель = Вкладка8;
    ПолеВвода23.Размер = Ф.Размер(615, 73);
    ПолеВвода23.ПорядокОбхода = 42;
    ПолеВвода23.МногострочныйРежим = Истина;
    ПолеВвода23.Положение = Ф.Точка(18, 110);
    ПолеВвода23.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись39.Родитель = Вкладка8;
    Надпись39.Размер = Ф.Размер(100, 15);
    Надпись39.ПорядокОбхода = 41;
    Надпись39.Положение = Ф.Точка(18, 92);
    Надпись39.Текст = "Описание";
    Надпись39.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись40.Родитель = Вкладка8;
    Надпись40.Размер = Ф.Размер(100, 14);
    Надпись40.ПорядокОбхода = 35;
    Надпись40.Положение = Ф.Точка(18, 9);
    Надпись40.Текст = "Имя";
    Надпись40.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора16.Родитель = Вкладка8;
    ПолеВыбора16.Размер = Ф.Размер(615, 24);
    ПолеВыбора16.ПорядокОбхода = 40;
    ПолеВыбора16.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора16.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора16.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора16.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора16.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора16.ВысотаЭлемента = 16;
    ПолеВыбора16.Положение = Ф.Точка(18, 68);
    ПолеВыбора16.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора16.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора16.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода24.Родитель = Вкладка8;
    ПолеВвода24.Размер = Ф.Размер(296, 22);
    ПолеВвода24.ПорядокОбхода = 36;
    ПолеВвода24.Положение = Ф.Точка(18, 26);
    ПолеВвода24.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора17.Родитель = Вкладка8;
    ПолеВыбора17.Размер = Ф.Размер(296, 24);
    ПолеВыбора17.ПорядокОбхода = 39;
    ПолеВыбора17.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора17.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора17.ВысотаЭлемента = 16;
    ПолеВыбора17.Положение = Ф.Точка(337, 26);
    ПолеВыбора17.Текст = "обязательный";
    ПолеВыбора17.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора17.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись41.Родитель = Вкладка8;
    Надпись41.Размер = Ф.Размер(100, 14);
    Надпись41.ПорядокОбхода = 37;
    Надпись41.Положение = Ф.Точка(337, 9);
    Надпись41.Текст = "Обязательный";
    Надпись41.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись42.Родитель = Вкладка8;
    Надпись42.Размер = Ф.Размер(100, 16);
    Надпись42.ПорядокОбхода = 38;
    Надпись42.Положение = Ф.Точка(18, 49);
    Надпись42.Текст = "Тип";
    Надпись42.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка9.Родитель = ПанельВкладок1;
    Вкладка9.Текст = "8";

    ПолеВвода25.Родитель = Вкладка9;
    ПолеВвода25.Размер = Ф.Размер(615, 73);
    ПолеВвода25.ПорядокОбхода = 42;
    ПолеВвода25.МногострочныйРежим = Истина;
    ПолеВвода25.Положение = Ф.Точка(18, 110);
    ПолеВвода25.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись43.Родитель = Вкладка9;
    Надпись43.Размер = Ф.Размер(100, 15);
    Надпись43.ПорядокОбхода = 41;
    Надпись43.Положение = Ф.Точка(18, 92);
    Надпись43.Текст = "Описание";
    Надпись43.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись44.Родитель = Вкладка9;
    Надпись44.Размер = Ф.Размер(100, 14);
    Надпись44.ПорядокОбхода = 35;
    Надпись44.Положение = Ф.Точка(18, 9);
    Надпись44.Текст = "Имя";
    Надпись44.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора18.Родитель = Вкладка9;
    ПолеВыбора18.Размер = Ф.Размер(615, 24);
    ПолеВыбора18.ПорядокОбхода = 40;
    ПолеВыбора18.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора18.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора18.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора18.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора18.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора18.ВысотаЭлемента = 16;
    ПолеВыбора18.Положение = Ф.Точка(18, 68);
    ПолеВыбора18.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора18.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора18.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода26.Родитель = Вкладка9;
    ПолеВвода26.Размер = Ф.Размер(296, 22);
    ПолеВвода26.ПорядокОбхода = 36;
    ПолеВвода26.Положение = Ф.Точка(18, 26);
    ПолеВвода26.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора19.Родитель = Вкладка9;
    ПолеВыбора19.Размер = Ф.Размер(296, 24);
    ПолеВыбора19.ПорядокОбхода = 39;
    ПолеВыбора19.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора19.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора19.ВысотаЭлемента = 16;
    ПолеВыбора19.Положение = Ф.Точка(337, 26);
    ПолеВыбора19.Текст = "обязательный";
    ПолеВыбора19.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора19.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись45.Родитель = Вкладка9;
    Надпись45.Размер = Ф.Размер(100, 14);
    Надпись45.ПорядокОбхода = 37;
    Надпись45.Положение = Ф.Точка(337, 9);
    Надпись45.Текст = "Обязательный";
    Надпись45.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись46.Родитель = Вкладка9;
    Надпись46.Размер = Ф.Размер(100, 16);
    Надпись46.ПорядокОбхода = 38;
    Надпись46.Положение = Ф.Точка(18, 49);
    Надпись46.Текст = "Тип";
    Надпись46.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Вкладка10.Родитель = ПанельВкладок1;
    Вкладка10.Текст = "9";

    ПолеВвода27.Родитель = Вкладка10;
    ПолеВвода27.Размер = Ф.Размер(615, 73);
    ПолеВвода27.ПорядокОбхода = 42;
    ПолеВвода27.МногострочныйРежим = Истина;
    ПолеВвода27.Положение = Ф.Точка(19, 110);
    ПолеВвода27.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись47.Родитель = Вкладка10;
    Надпись47.Размер = Ф.Размер(100, 15);
    Надпись47.ПорядокОбхода = 41;
    Надпись47.Положение = Ф.Точка(19, 92);
    Надпись47.Текст = "Описание";
    Надпись47.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись48.Родитель = Вкладка10;
    Надпись48.Размер = Ф.Размер(100, 14);
    Надпись48.ПорядокОбхода = 35;
    Надпись48.Положение = Ф.Точка(19, 9);
    Надпись48.Текст = "Имя";
    Надпись48.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора20.Родитель = Вкладка10;
    ПолеВыбора20.Размер = Ф.Размер(615, 24);
    ПолеВыбора20.ПорядокОбхода = 40;
    ПолеВыбора20.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора20.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора20.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора20.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора20.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора20.ВысотаЭлемента = 16;
    ПолеВыбора20.Положение = Ф.Точка(19, 68);
    ПолеВыбора20.Текст = "йййййййййй   йййййййййй";
    ПолеВыбора20.ШиринаВыпадающегоСписка = 615;
    ПолеВыбора20.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода28.Родитель = Вкладка10;
    ПолеВвода28.Размер = Ф.Размер(296, 22);
    ПолеВвода28.ПорядокОбхода = 36;
    ПолеВвода28.Положение = Ф.Точка(19, 26);
    ПолеВвода28.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора21.Родитель = Вкладка10;
    ПолеВыбора21.Размер = Ф.Размер(296, 24);
    ПолеВыбора21.ПорядокОбхода = 39;
    ПолеВыбора21.Элементы.Добавить(Ф.ЭлементСписка("обязательный", "обязательный"));
    ПолеВыбора21.Элементы.Добавить(Ф.ЭлементСписка("необязательный", "необязательный"));
    ПолеВыбора21.ВысотаЭлемента = 16;
    ПолеВыбора21.Положение = Ф.Точка(338, 26);
    ПолеВыбора21.Текст = "обязательный";
    ПолеВыбора21.ШиринаВыпадающегоСписка = 296;
    ПолеВыбора21.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись49.Родитель = Вкладка10;
    Надпись49.Размер = Ф.Размер(100, 14);
    Надпись49.ПорядокОбхода = 37;
    Надпись49.Положение = Ф.Точка(338, 9);
    Надпись49.Текст = "Обязательный";
    Надпись49.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись50.Родитель = Вкладка10;
    Надпись50.Размер = Ф.Размер(100, 16);
    Надпись50.ПорядокОбхода = 38;
    Надпись50.Положение = Ф.Точка(19, 49);
    Надпись50.Текст = "Тип";
    Надпись50.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись10.Родитель = Форма_0;
    Надпись10.Размер = Ф.Размер(100, 17);
    Надпись10.ПорядокОбхода = 17;
    Надпись10.Положение = Ф.Точка(26, 294);
    Надпись10.Текст = "Параметры";
    Надпись10.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора2.Родитель = Форма_0;
    ПолеВыбора2.Размер = Ф.Размер(656, 24);
    ПолеВыбора2.ПорядокОбхода = 18;
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Тип: Булево.", "Тип: Булево."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Тип: Строка.", "Тип: Строка."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Тип: Число.", "Тип: Число."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("Тип: Произвольный.", "Тип: Произвольный."));
    ПолеВыбора2.Элементы.Добавить(Ф.ЭлементСписка("йййййййййй   йййййййййй", "йййййййййй   йййййййййй"));
    ПолеВыбора2.ВысотаЭлемента = 16;
    ПолеВыбора2.Положение = Ф.Точка(26, 194);
    ПолеВыбора2.Текст = "Тип: Булево.";
    ПолеВыбора2.ШиринаВыпадающегоСписка = 656;
    ПолеВыбора2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВыбора22.Родитель = Форма_0;
    ПолеВыбора22.Размер = Ф.Размер(323, 24);
    ПолеВыбора22.ПорядокОбхода = 19;
    ПолеВыбора22.ВысотаЭлемента = 16;
    ПолеВыбора22.Положение = Ф.Точка(22, 26);
    ПолеВыбора22.ШиринаВыпадающегоСписка = 323;
    ПолеВыбора22.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись51.Родитель = Форма_0;
    Надпись51.Размер = Ф.Размер(177, 17);
    Надпись51.ПорядокОбхода = 21;
    Надпись51.Положение = Ф.Точка(26, 529);
    Надпись51.Текст = "Применимо к";
    Надпись51.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка2.Родитель = Форма_0;
    Кнопка2.Размер = Ф.Размер(74, 40);
    Кнопка2.ПорядокОбхода = 22;
    Кнопка2.Нажатие = Ф.Действие(ЭтотОбъект, "СнятьВсе");
    Кнопка2.Положение = Ф.Точка(604, 564);
    Кнопка2.Текст = "Снять все";
    Кнопка2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка3.Родитель = Форма_0;
    Кнопка3.Размер = Ф.Размер(74, 40);
    Кнопка3.ПорядокОбхода = 23;
    Кнопка3.Нажатие = Ф.Действие(ЭтотОбъект, "ПометитьВсе");
    Кнопка3.Положение = Ф.Точка(604, 610);
    Кнопка3.Текст = "Пометить все";
    Кнопка3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    СписокЭлементов1.Родитель = Форма_0;
    СписокЭлементов1.Размер = Ф.Размер(572, 182);
    СписокЭлементов1.ПорядокОбхода = 24;
    СписокЭлементов1.Флажки = Истина;
    СписокЭлементов1Колонка0 = Ф.Колонка();
    СписокЭлементов1Колонка0.Текст = "Тег";
    СписокЭлементов1Колонка0.Ширина = 181;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка0);
    СписокЭлементов1Колонка1 = Ф.Колонка();
    СписокЭлементов1Колонка1.Текст = "КлассРус";
    СписокЭлементов1Колонка1.Ширина = 216;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка1);
    СписокЭлементов1Колонка2 = Ф.Колонка();
    СписокЭлементов1Колонка2.Текст = "КлассАнгл";
    СписокЭлементов1Колонка2.Ширина = 185;
    СписокЭлементов1.Колонки.Добавить(СписокЭлементов1Колонка2);
    СписокЭлементов1.Положение = Ф.Точка(26, 549);
    СписокЭлементов1.РежимОтображения = Ф.РежимОтображения.Подробно;
    СписокЭлементов1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

КонецПроцедуры

Процедура НачальноеЗаполнениеФормы()
	ПолеВыбора22.Текст = "Элемент Element";
	ПолеВвода3.Текст = "";
	ПолеВвода4.Текст = "";
	ПолеВвода5.Текст = "";
	ПолеВыбора2.Текст = "";
	ПолеВвода8.Текст = "";
	
	М = РазобратьСтроку(СтрКлассов, ";");
	ЭлементыПоляВыбора22 = ПолеВыбора22.Элементы;
	Для А = 0 По М.ВГраница() Цикл
		// Сообщить("" + М[А]);
		М2 = РазобратьСтроку(М[А], ",");
		ЭлементыПоляВыбора22.Добавить(М2[0] + " " + М2[1]);
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
	
	Для А = 0 По ПанельВкладок1.Вкладки.Количество - 1 Цикл
		Вкладка = ПанельВкладок1.Вкладки(А);
		Для А1 = 0 По Вкладка.ЭлементыУправления.Количество - 1 Цикл
			Элемент = Вкладка.ЭлементУправления(А1);
			Если ТипЗнч(Элемент) = Тип("КлПолеВвода") или ТипЗнч(Элемент) = Тип("КлПолеВыбора") Тогда
				Элемент.Текст = "";
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
	
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
КлассИмяРус = "КлассИмяРус";//!!!!!!!!!!!!!!!!!!!!
КлассИмяEn = "КлассИмяEn";//!!!!!!!!!!!!!!!!!!!!

МетодИмяРус = "МетодИмяРус";//!!!!!!!!!!!!!!!!!!!!
МетодИмяEn = "МетодИмяEn";//!!!!!!!!!!!!!!!!!!!!
МетодОписание = "МетодОписание";//!!!!!!!!!!!!!!!!!!!!

ВозвращаемоеЗначениеТип = "ВозвращаемоеЗначениеТип";//!!!!!!!!!!!!!!!!!!!!
ВозвращаемоеЗначениеОписание = "ВозвращаемоеЗначениеОписание";//!!!!!!!!!!!!!!!!!!!!

М_Параметров = Новый Массив();

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

// ...

Ф.ЗапуститьОбработкуСобытий();
