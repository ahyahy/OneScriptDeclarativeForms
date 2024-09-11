Перем Ф;
Перем Кнопка1;
Перем Надпись1;
Перем Надпись2;
Перем Надпись3;
Перем Надпись4;
Перем ПолеВвода1;
Перем ПолеВвода2;
Перем ПолеВвода3;
Перем Форма_0;
Перем ИмяРус;
Перем ИмяEn;
Перем Описание;
Перем Надпись5;
Перем ВыходнойКаталог;

Процедура Кн1_Нажатие() Экспорт
	ИмяРус = СокрЛП(ПолеВвода1.Текст);
	ИмяEn = СокрЛП(ПолеВвода2.Текст);
	Описание = СокрЛП(ПолеВвода3.Текст);

    СоздатьКласс();
КонецПроцедуры

Процедура ПодготовкаКомпонентов()
    // ВАЖНО: Необходимая процедура для поддержки конструктора — не изменяйте содержимое этой процедуры с помощью редактора кода.
    // osdText = "WzzQmtC+0L3RgdGC0YDRg9C60YLQvtGA0YtdDQrQpNC+0YDQvNCwXzAgPSDQpC7QpNC+0YDQvNCwKCk7DQrQndCw0LTQv9C40YHRjDEgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0YwyID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDEgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCf0L7Qu9C10JLQstC+0LTQsDIgPSDQpC7Qn9C+0LvQtdCS0LLQvtC00LAoKTsNCtCd0LDQtNC/0LjRgdGMMyA9INCkLtCd0LDQtNC/0LjRgdGMKCk7DQrQn9C+0LvQtdCS0LLQvtC00LAzID0g0KQu0J/QvtC70LXQktCy0L7QtNCwKCk7DQrQmtC90L7Qv9C60LAxID0g0KQu0JrQvdC+0L/QutCwKCk7DQrQndCw0LTQv9C40YHRjDQgPSDQpC7QndCw0LTQv9C40YHRjCgpOw0K0J3QsNC00L/QuNGB0Yw1ID0g0KQu0J3QsNC00L/QuNGB0YwoKTsNClvQmtC+0L3RgdGC0YDRg9C60YLQvtGA0Ys+XQ0KWzzQodCy0L7QudGB0YLQstCwXQ0KWzzQpNC+0YDQvNCwXzBdDQrQpNC+0YDQvNCwXzAu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDY0MCwgMzg3KTsNCtCk0L7RgNC80LBfMC7Qn9GD0YLRjCA9ICJDOlw0NDRcOS3Ql9Cw0LPQvtGC0L7QstC60LjQlNC10LrQu9Cw0YDQpNC+0YDQvFzQodC+0LfQtNCw0L3QuNC10JrQu9Cw0YHRgdCwMi5vcyI7DQrQpNC+0YDQvNCwXzAu0KHRgtC40LvRjNCh0LrRgNC40L/RgtCwID0gItCh0YLQuNC70YzQodC60YDQuNC/0YLQsCI7DQrQpNC+0YDQvNCwXzAu0KLQtdC60YHRgiA9ICLQodC+0LfQtNCw0L3QuNC1INC60LvQsNGB0YHQsCI7DQrQpNC+0YDQvNCwXzAu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNCtCk0L7RgNC80LBfMC7QmNC80Y/QntCx0YrQtdC60YLQsNCk0L7RgNC80YvQlNC70Y/QntC00L3QvtCh0LrRgNC40L/RgtCwID0gItCkIjsNClvQpNC+0YDQvNCwXzA+XQ0KWzzQndCw0LTQv9C40YHRjDFdDQrQndCw0LTQv9C40YHRjDEu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMS7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxOCk7DQrQndCw0LTQv9C40YHRjDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAwOw0K0J3QsNC00L/QuNGB0YwxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDI3KTsNCtCd0LDQtNC/0LjRgdGMMS7QotC10LrRgdGCID0gItCY0LzRj9Cg0YPRgSI7DQrQndCw0LTQv9C40YHRjDEu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDE+XQ0KWzzQndCw0LTQv9C40YHRjDJdDQrQndCw0LTQv9C40YHRjDIu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMi7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxOCk7DQrQndCw0LTQv9C40YHRjDIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAwOw0K0J3QsNC00L/QuNGB0YwyLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDkxKTsNCtCd0LDQtNC/0LjRgdGMMi7QotC10LrRgdGCID0gItCY0LzRj0VuIjsNCtCd0LDQtNC/0LjRgdGMMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMj5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDFdDQrQn9C+0LvQtdCS0LLQvtC00LAxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LAxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg1NjcsIDIyKTsNCtCf0L7Qu9C10JLQstC+0LTQsDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAxOw0K0J/QvtC70LXQktCy0L7QtNCwMS7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDI2LCA0OCk7DQrQn9C+0LvQtdCS0LLQvtC00LAxLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMT5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDJdDQrQn9C+0LvQtdCS0LLQvtC00LAyLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LAyLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCg1NjcsIDIyKTsNCtCf0L7Qu9C10JLQstC+0LTQsDIu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAyOw0K0J/QvtC70LXQktCy0L7QtNCwMi7Qn9C+0LvQvtC20LXQvdC40LUgPSDQpC7QotC+0YfQutCwKDI2LCAxMTIpOw0K0J/QvtC70LXQktCy0L7QtNCwMi7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cf0L7Qu9C10JLQstC+0LTQsDI+XQ0KWzzQndCw0LTQv9C40YHRjDNdDQrQndCw0LTQv9C40YHRjDMu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMMy7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMTAwLCAxOSk7DQrQndCw0LTQv9C40YHRjDMu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSAzOw0K0J3QsNC00L/QuNGB0YwzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDE1Nik7DQrQndCw0LTQv9C40YHRjDMu0KLQtdC60YHRgiA9ICLQntC/0LjRgdCw0L3QuNC1IjsNCtCd0LDQtNC/0LjRgdGMMy7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMMz5dDQpbPNCf0L7Qu9C10JLQstC+0LTQsDNdDQrQn9C+0LvQtdCS0LLQvtC00LAzLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCc0L3QvtCz0L7RgdGC0YDQvtGH0L3Ri9C50KDQtdC20LjQvCA9INCY0YHRgtC40L3QsDsNCtCf0L7Qu9C10JLQstC+0LTQsDMu0KDQsNC30LzQtdGAID0g0KQu0KDQsNC30LzQtdGAKDU2NywgODQpOw0K0J/QvtC70LXQktCy0L7QtNCwMy7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDI7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDE3OCk7DQrQn9C+0LvQtdCS0LLQvtC00LAzLtCo0YDQuNGE0YIgPSDQpC7QqNGA0LjRhNGCKCJNaWNyb3NvZnQgU2FucyBTZXJpZiIsIDkuNzUsICk7DQpb0J/QvtC70LXQktCy0L7QtNCwMz5dDQpbPNCa0L3QvtC/0LrQsDFdDQrQmtC90L7Qv9C60LAxLtCg0L7QtNC40YLQtdC70YwgPSDQpNC+0YDQvNCwXzA7DQrQmtC90L7Qv9C60LAxLtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgxMDcsIDIzKTsNCtCa0L3QvtC/0LrQsDEu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA0Ow0K0JrQvdC+0L/QutCwMS7QndCw0LbQsNGC0LjQtSA9ICLQmtC9MV/QndCw0LbQsNGC0LjQtSI7DQrQmtC90L7Qv9C60LAxLtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoNDg2LCAyODMpOw0K0JrQvdC+0L/QutCwMS7QotC10LrRgdGCID0gItCh0L7Qt9C00LDRgtGMINC60LvQsNGB0YEiOw0K0JrQvdC+0L/QutCwMS7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Ca0L3QvtC/0LrQsDE+XQ0KWzzQndCw0LTQv9C40YHRjDRdDQrQndCw0LTQv9C40YHRjDQu0KDQvtC00LjRgtC10LvRjCA9INCk0L7RgNC80LBfMDsNCtCd0LDQtNC/0LjRgdGMNC7QoNCw0LfQvNC10YAgPSDQpC7QoNCw0LfQvNC10YAoMzY4LCAyMyk7DQrQndCw0LTQv9C40YHRjDQu0J/QvtGA0Y/QtNC+0LrQntCx0YXQvtC00LAgPSA1Ow0K0J3QsNC00L/QuNGB0Yw0LtCf0L7Qu9C+0LbQtdC90LjQtSA9INCkLtCi0L7Rh9C60LAoMjYsIDMwNik7DQrQndCw0LTQv9C40YHRjDQu0KLQtdC60YHRgiA9ICLQktGL0YXQvtC00L3Ri9C1INC00LDQvdC90YvQtSDQsdGD0LTRg9GCINCyINC60LDRgtCw0LvQvtCz0LUgQzpcMDAwIjsNCtCd0LDQtNC/0LjRgdGMNC7QqNGA0LjRhNGCID0g0KQu0KjRgNC40YTRgigiTWljcm9zb2Z0IFNhbnMgU2VyaWYiLCA5Ljc1LCApOw0KW9Cd0LDQtNC/0LjRgdGMND5dDQpbPNCd0LDQtNC/0LjRgdGMNV0NCtCd0LDQtNC/0LjRgdGMNS7QoNC+0LTQuNGC0LXQu9GMID0g0KTQvtGA0LzQsF8wOw0K0J3QsNC00L/QuNGB0Yw1LtCg0LDQt9C80LXRgCA9INCkLtCg0LDQt9C80LXRgCgzNjgsIDIzKTsNCtCd0LDQtNC/0LjRgdGMNS7Qn9C+0YDRj9C00L7QutCe0LHRhdC+0LTQsCA9IDY7DQrQndCw0LTQv9C40YHRjDUu0J/QvtC70L7QttC10L3QuNC1ID0g0KQu0KLQvtGH0LrQsCgyNiwgMjgzKTsNCtCd0LDQtNC/0LjRgdGMNS7QotC10LrRgdGCID0gItCY0YHRhdC+0LTQvdGL0LUg0LTQsNC90L3Ri9C1INC70LXQttCw0YIg0LIg0LrQsNGC0LDQu9C+0LPQtSBDOlw0NDRcT1NERm9ybXNSdSI7DQrQndCw0LTQv9C40YHRjDUu0KjRgNC40YTRgiA9INCkLtCo0YDQuNGE0YIoIk1pY3Jvc29mdCBTYW5zIFNlcmlmIiwgOS43NSwgKTsNClvQndCw0LTQv9C40YHRjDU+XQ0KW9Ch0LLQvtC50YHRgtCy0LA+XQ0K";
    ПодключитьВнешнююКомпоненту("C:\444\111\OneScriptForms\OneScriptForms\bin\Debug\OneScriptForms.dll");
    Ф = Новый ФормыДляОдноСкрипта();

    Форма_0 = Ф.Форма();
    Форма_0.Отображать = Истина;
    Форма_0.Показать();
    Форма_0.Активизировать();

    Надпись1 = Ф.Надпись();
    Надпись2 = Ф.Надпись();
    ПолеВвода1 = Ф.ПолеВвода();
    ПолеВвода2 = Ф.ПолеВвода();
    Надпись3 = Ф.Надпись();
    ПолеВвода3 = Ф.ПолеВвода();
    Кнопка1 = Ф.Кнопка();
    Надпись4 = Ф.Надпись();
    Надпись5 = Ф.Надпись();

    Форма_0.Размер = Ф.Размер(640, 387);
    Форма_0.Текст = "Создание класса";
    Форма_0.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись1.Родитель = Форма_0;
    Надпись1.Размер = Ф.Размер(100, 18);
    Надпись1.ПорядокОбхода = 0;
    Надпись1.Положение = Ф.Точка(26, 27);
    Надпись1.Текст = "ИмяРус";
    Надпись1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись2.Родитель = Форма_0;
    Надпись2.Размер = Ф.Размер(100, 18);
    Надпись2.ПорядокОбхода = 0;
    Надпись2.Положение = Ф.Точка(26, 91);
    Надпись2.Текст = "ИмяEn";
    Надпись2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода1.Родитель = Форма_0;
    ПолеВвода1.Размер = Ф.Размер(567, 22);
    ПолеВвода1.ПорядокОбхода = 1;
    ПолеВвода1.Положение = Ф.Точка(26, 48);
    ПолеВвода1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода2.Родитель = Форма_0;
    ПолеВвода2.Размер = Ф.Размер(567, 22);
    ПолеВвода2.ПорядокОбхода = 2;
    ПолеВвода2.Положение = Ф.Точка(26, 112);
    ПолеВвода2.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись3.Родитель = Форма_0;
    Надпись3.Размер = Ф.Размер(100, 19);
    Надпись3.ПорядокОбхода = 3;
    Надпись3.Положение = Ф.Точка(26, 156);
    Надпись3.Текст = "Описание";
    Надпись3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    ПолеВвода3.Родитель = Форма_0;
    ПолеВвода3.Размер = Ф.Размер(567, 84);
    ПолеВвода3.ПорядокОбхода = 2;
    ПолеВвода3.МногострочныйРежим = Истина;
    ПолеВвода3.Положение = Ф.Точка(26, 178);
    ПолеВвода3.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Кнопка1.Родитель = Форма_0;
    Кнопка1.Размер = Ф.Размер(107, 23);
    Кнопка1.ПорядокОбхода = 4;
    Кнопка1.Нажатие = Ф.Действие(ЭтотОбъект, "Кн1_Нажатие");
    Кнопка1.Положение = Ф.Точка(486, 283);
    Кнопка1.Текст = "Создать класс";
    Кнопка1.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись4.Родитель = Форма_0;
    Надпись4.Размер = Ф.Размер(368, 23);
    Надпись4.ПорядокОбхода = 5;
    Надпись4.Положение = Ф.Точка(26, 306);
    Надпись4.Текст = "Выходные данные будут в каталоге C:\000";
    Надпись4.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

    Надпись5.Родитель = Форма_0;
    Надпись5.Размер = Ф.Размер(368, 23);
    Надпись5.ПорядокОбхода = 6;
    Надпись5.Положение = Ф.Точка(26, 283);
    Надпись5.Текст = "Исходные данные лежат в каталоге C:\444\OSDFormsRu";
    Надпись5.Шрифт = Ф.Шрифт("Microsoft Sans Serif", 9.75, );

КонецПроцедуры

Процедура НачальноеЗаполнениеФормы()
	ПолеВвода1.Текст = ИмяРус;
	ПолеВвода2.Текст = ИмяEn;
	ПолеВвода3.Текст = Описание;
КонецПроцедуры

Процедура СоздатьКласс()
	// Создадим ".html" для нового класса ===============================================================================
	СтрКласса = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
	|<HTML><HEAD><TITLE>CCLLAASS Class</TITLE>
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
	|<H1 class=dtH1>ККЛЛААСС (CCLLAASS) Класс</H1></DIV></DIV>
	|<DIV id=nstext>
	|<H4 class=dtH4>Описание</H4>
	|<P>" + Описание + "</P>
	|<P></P>
	|<H4 class=dtH4>Смотрите также</H4>
	|<P><A href=""OSDForms.html"">Библиотека&nbsp;DeclarativeForms</A></P></DIV></BODY></HTML>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрКласса = СтрЗаменить(СтрКласса, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрКласса = СтрЗаменить(СтрКласса, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "Описание_йййййййййй";
	ПодстрокаЗамены = Описание;
	СтрКласса = СтрЗаменить(СтрКласса, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSDForms." + ИмяEn + ".html";
	ТекстДок.УстановитьТекст(СтрКласса);
	ТекстДок.Записать(ИмяФайла);

	// Создадим конструктор для нового класса ===============================================================================
	СтрКонструктор = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
	|<HTML><HEAD><TITLE>CCLLAASS Constructor</TITLE>
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
	|<H1 class=dtH1>ККЛЛААСС (CCLLAASS)&nbsp;Конструктор</H1></DIV></DIV>
	|<DIV id=nstext>
	|<H4 class=dtH4>Синтаксис</H4>
	|<P>ККЛЛААСС()</P>
	|<H4 class=dtH4>Параметры</H4>
	|<DL></DL>
	|<H4 class=dtH4>Описание</H4>
	|<P>Создаёт новый экземпляр класса <B>ККЛЛААСС&nbsp;(CCLLAASS)</B>.</P>
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
	|<P><A href=""OSDForms.html"">Библиотека&nbsp;DeclarativeForms</A></P></DIV>
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
	ПодстрокаЗамены = ИмяРус;
	СтрКонструктор = СтрЗаменить(СтрКонструктор, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрКонструктор = СтрЗаменить(СтрКонструктор, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSDForms." + ИмяEn + "Constructor.html";
	ТекстДок.УстановитьТекст(СтрКонструктор);
	ТекстДок.Записать(ИмяФайла);

	// Создадим раздел События для нового класса ===============================================================================
	СтрСобытия = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
	|<HTML><HEAD><TITLE>CCLLAASS Events</TITLE>
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
	|<H1 class=dtH1>ККЛЛААСС (CCLLAASS)&nbsp;События</H1></DIV></DIV>
	|<DIV id=nstext>
	|<P></P>
	|<H4 class=dtH4>События</H4>
	|<DIV class=tablediv>
	|<TABLE class=dtTABLE cellSpacing=0>
	|  <TBODY>
	|  <TR vAlign=top>
	|    <TD width=""50%""><A href=""OSDForms.йййййййййй.йййййййййй.html"">йййййййййй&nbsp;(йййййййййй)</A></TD>
	|    <TD width=""50%"">йййййййййй</TD></TR></TBODY></TABLE></DIV>
	|<H4 class=dtH4>Смотрите также</H4>
	|<P><A href=""OSDForms.html"">Библиотека&nbsp;DeclarativeForms</A></P></DIV></BODY></HTML>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрСобытия = СтрЗаменить(СтрСобытия, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрСобытия = СтрЗаменить(СтрСобытия, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSDForms." + ИмяEn + "Events.html";
	ТекстДок.УстановитьТекст(СтрСобытия);
	ТекстДок.Записать(ИмяФайла);

	// Создадим раздел Методы для нового класса ===============================================================================
	СтрМетоды = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
	|<HTML><HEAD><TITLE>CCLLAASS Methods</TITLE>
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
	|<H1 class=dtH1>ККЛЛААСС (CCLLAASS)&nbsp;Методы</H1></DIV></DIV>
	|<DIV id=nstext>
	|<P></P>
	|<H4 class=dtH4>Методы</H4>
	|<DIV class=tablediv>
	|<TABLE class=dtTABLE cellSpacing=0>
	|  <TBODY>
	|  <TR vAlign=top>
	|    <TD width=""50%""><IMG src=""pubmethod.gif""></IMG><A href=""OSDForms.CCLLAASS.йййййййййй.html"">йййййййййй&nbsp;(йййййййййй)</A></TD>
	|    <TD width=""50%"">йййййййййй</TD></TR></TBODY></TABLE></DIV>
	|<H4 class=dtH4>Смотрите также</H4>
	|<P><A href=""OSDForms.html"">Библиотека&nbsp;DeclarativeForms</A></P></DIV></BODY></HTML>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрМетоды = СтрЗаменить(СтрМетоды, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрМетоды = СтрЗаменить(СтрМетоды, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSDForms." + ИмяEn + "Methods.html";
	ТекстДок.УстановитьТекст(СтрМетоды);
	ТекстДок.Записать(ИмяФайла);

	// Создадим раздел Свойства для нового класса ===============================================================================
	СтрСвойства = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">
	|<HTML><HEAD><TITLE>CCLLAASS Properties</TITLE>
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
	|<H1 class=dtH1>ККЛЛААСС (CCLLAASS)&nbsp;Свойства</H1></DIV></DIV>
	|<DIV id=nstext>
	|<P></P>
	|<H4 class=dtH4>Свойства</H4>
	|<DIV class=tablediv>
	|<TABLE class=dtTABLE cellSpacing=0>
	|  <TBODY>
	|  <TR vAlign=top>
	|    <TD width=""50%""><IMG src=""pubproperty.gif""></IMG><A href=""OSDForms.CCLLAASS.йййййййййй.html"">йййййййййй&nbsp;(йййййййййй)</A></TD>
	|    <TD width=""50%"">йййййййййй</TD></TR></TBODY></TABLE></DIV>
	|<H4 class=dtH4>Смотрите также</H4>
	|<P><A href=""OSDForms.html"">Библиотека&nbsp;DeclarativeForms</A></P></DIV></BODY></HTML>
	|";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрСвойства = СтрЗаменить(СтрСвойства, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрСвойства = СтрЗаменить(СтрСвойства, ПодстрокаПоиска, ПодстрокаЗамены);

	ТекстДок = Новый ТекстовыйДокумент;
	ИмяФайла = ВыходнойКаталог + "\OSDForms." + ИмяEn + "Properties.html";
	ТекстДок.УстановитьТекст(СтрСвойства);
	ТекстДок.Записать(ИмяФайла);

	// ============================================================================================
	// Добавим ссылку в C:\444\OSDFormsRu\contents.htm
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать("C:\444\OSDFormsRu\contents.htm");
	Стр = ТекстДок.ПолучитьТекст();

	СтрШаблон1 = 
	"d.add(8000,1,""ККЛЛААСС (CCLLAASS)"",""OSDForms.CCLLAASS.html"");
	|d.add(8001,8000,""Конструктор"",""OSDForms.CCLLAASSConstructor.html"");
	|d.add(8002,8000,""События"",""OSDForms.CCLLAASSEvents.html"");
	|d.add(8003,8000,""Свойства"",""OSDForms.CCLLAASSProperties.html"");
	|d.add(8004,8000,""Методы"",""OSDForms.CCLLAASSMethods.html"");";
	ПодстрокаПоиска = "ККЛЛААСС";
	ПодстрокаЗамены = ИмяРус;
	СтрШаблон1 = СтрЗаменить(СтрШаблон1, ПодстрокаПоиска, ПодстрокаЗамены);

	ПодстрокаПоиска = "CCLLAASS";
	ПодстрокаЗамены = ИмяEn;
	СтрШаблон1 = СтрЗаменить(СтрШаблон1, ПодстрокаПоиска, ПодстрокаЗамены);

	М = СтрНайтиМежду(Стр, 
		".html"");
		|
		|document.write(d);", 
		"</script>", 
		Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = ".html"");" + 
		"
		|" + СтрШаблон1 + "
		|
		|document.write(d);
		|</script>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;
	ИмяФайла = ВыходнойКаталог + "\contents.htm";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	// ============================================================================================
	// Добавим ссылку в C:\444\OSDFormsRu\OSDForms.html
	ТекстДок = Новый ТекстовыйДокумент;
	ТекстДок.Прочитать("C:\444\OSDFormsRu\OSDForms.html");
	Стр = ТекстДок.ПолучитьТекст();
	М = СтрНайтиМежду(Стр, 
			"<H3 class=dtH3>Классы</H3>
			|<DIV class=tablediv>
			|<TABLE class=dtTABLE cellSpacing=0>
			|  <TBODY>", 
			"<TR vAlign=top>", 
			Ложь, );
	Если М.Количество() > 0 Тогда
		СтрЗаголовка= М[0];
		// Сообщить("М[0] = " + М[0]);
		ПодстрокаПоиска = М[0];
		ПодстрокаЗамены = М[0] + "
		|    <TD width=""50%""><A href=""OSDForms." + ИмяEn + ".html"">" + ИмяРус + "&nbsp;(" + ИмяEn + ")</A></TD>
		|    <TD width=""50%"">" + Описание + "</TD></TR>
		|  <TR vAlign=top>";
		Стр = СтрЗаменить(Стр, ПодстрокаПоиска, ПодстрокаЗамены);
	КонецЕсли;
	ИмяФайла = ВыходнойКаталог + "\OSDForms.html";
	ТекстДок.УстановитьТекст(Стр);
	ТекстДок.Записать(ИмяФайла);
	
	ОкноСообщений1 = Ф.ОкноСообщений();
	Ф.ОкноСообщений().Показать("Завершено", "Завершено", Ф.КнопкиОкнаСообщений.ОКОтмена, Ф.ЗначокОкнаСообщений.Восклицание);
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
ИмяРус = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
ИмяEn = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!
Описание = "йййййййййй";//!!!!!!!!!!!!!!!!!!!!

НачальноеЗаполнениеФормы();
// ...

Ф.ЗапуститьОбработкуСобытий();
