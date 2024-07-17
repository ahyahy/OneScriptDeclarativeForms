using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Collections;
using System.Collections.Generic;

namespace osdf
{
    [ContextClass ("ДфЦвет", "DfColor")]
    public class DfColor : AutoContext<DfColor>, ICollectionContext, IEnumerable<IValue>
    {
        private List<IValue> _list;

        public int Count()
        {
            return _list.Count;
        }

        public CollectionEnumerator GetManagedIterator()
        {
            return new CollectionEnumerator(this);
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return ((IEnumerable<IValue>)_list).GetEnumerator();
        }

        IEnumerator<IValue> IEnumerable<IValue>.GetEnumerator()
        {
            foreach (var item in _list)
            {
                yield return (item as IValue);
            }
        }

        public DfColor()
        {
            _list = new List<IValue>();
            _list.Add(ValueFactory.Create(Aquamarine));
            _list.Add(ValueFactory.Create(AntiqueWhite));
            _list.Add(ValueFactory.Create(Beige));
            _list.Add(ValueFactory.Create(WhiteSmoke));
            _list.Add(ValueFactory.Create(White));
            _list.Add(ValueFactory.Create(NavajoWhite));
            _list.Add(ValueFactory.Create(Turquoise));
            _list.Add(ValueFactory.Create(Bisque));
            _list.Add(ValueFactory.Create(PaleTurquoise));
            _list.Add(ValueFactory.Create(Cornsilk));
            _list.Add(ValueFactory.Create(PaleGreen));
            _list.Add(ValueFactory.Create(PaleGoldenrod));
            _list.Add(ValueFactory.Create(CornflowerBlue));
            _list.Add(ValueFactory.Create(DeepSkyBlue));
            _list.Add(ValueFactory.Create(LightSlateGray));
            _list.Add(ValueFactory.Create(SlateBlue));
            _list.Add(ValueFactory.Create(YellowGreen));
            _list.Add(ValueFactory.Create(Yellow));
            _list.Add(ValueFactory.Create(DodgerBlue));
            _list.Add(ValueFactory.Create(SpringGreen));
            _list.Add(ValueFactory.Create(LawnGreen));
            _list.Add(ValueFactory.Create(GreenYellow));
            _list.Add(ValueFactory.Create(SeaGreen));
            _list.Add(ValueFactory.Create(Green));
            _list.Add(ValueFactory.Create(LimeGreen));
            _list.Add(ValueFactory.Create(ForestGreen));
            _list.Add(ValueFactory.Create(Goldenrod));
            _list.Add(ValueFactory.Create(Gold));
            _list.Add(ValueFactory.Create(Indigo));
            _list.Add(ValueFactory.Create(IndianRed));
            _list.Add(ValueFactory.Create(Firebrick));
            _list.Add(ValueFactory.Create(SaddleBrown));
            _list.Add(ValueFactory.Create(Coral));
            _list.Add(ValueFactory.Create(Maroon));
            _list.Add(ValueFactory.Create(Brown));
            _list.Add(ValueFactory.Create(RoyalBlue));
            _list.Add(ValueFactory.Create(Red));
            _list.Add(ValueFactory.Create(Crimson));
            _list.Add(ValueFactory.Create(Lavender));
            _list.Add(ValueFactory.Create(Azure));
            _list.Add(ValueFactory.Create(Lime));
            _list.Add(ValueFactory.Create(PaleVioletRed));
            _list.Add(ValueFactory.Create(Salmon));
            _list.Add(ValueFactory.Create(Linen));
            _list.Add(ValueFactory.Create(Magenta));
            _list.Add(ValueFactory.Create(Honeydew));
            _list.Add(ValueFactory.Create(Moccasin));
            _list.Add(ValueFactory.Create(Aqua));
            _list.Add(ValueFactory.Create(SeaShell));
            _list.Add(ValueFactory.Create(MintCream));
            _list.Add(ValueFactory.Create(SkyBlue));
            _list.Add(ValueFactory.Create(LightSkyBlue));
            _list.Add(ValueFactory.Create(OliveDrab));
            _list.Add(ValueFactory.Create(Olive));
            _list.Add(ValueFactory.Create(OrangeRed));
            _list.Add(ValueFactory.Create(Orange));
            _list.Add(ValueFactory.Create(Orchid));
            _list.Add(ValueFactory.Create(Sienna));
            _list.Add(ValueFactory.Create(PeachPuff));
            _list.Add(ValueFactory.Create(SandyBrown));
            _list.Add(ValueFactory.Create(PapayaWhip));
            _list.Add(ValueFactory.Create(MidnightBlue));
            _list.Add(ValueFactory.Create(PowderBlue));
            _list.Add(ValueFactory.Create(GhostWhite));
            _list.Add(ValueFactory.Create(Purple));
            _list.Add(ValueFactory.Create(Wheat));
            _list.Add(ValueFactory.Create(RosyBrown));
            _list.Add(ValueFactory.Create(LavenderBlush));
            _list.Add(ValueFactory.Create(Pink));
            _list.Add(ValueFactory.Create(LightSeaGreen));
            _list.Add(ValueFactory.Create(LightYellow));
            _list.Add(ValueFactory.Create(LightGoldenrodYellow));
            _list.Add(ValueFactory.Create(LightGreen));
            _list.Add(ValueFactory.Create(LightCoral));
            _list.Add(ValueFactory.Create(Peru));
            _list.Add(ValueFactory.Create(BlanchedAlmond));
            _list.Add(ValueFactory.Create(LemonChiffon));
            _list.Add(ValueFactory.Create(LightPink));
            _list.Add(ValueFactory.Create(LightGray));
            _list.Add(ValueFactory.Create(LightBlue));
            _list.Add(ValueFactory.Create(LightCyan));
            _list.Add(ValueFactory.Create(LightSalmon));
            _list.Add(ValueFactory.Create(Silver));
            _list.Add(ValueFactory.Create(CadetBlue));
            _list.Add(ValueFactory.Create(Gray));
            _list.Add(ValueFactory.Create(SlateGray));
            _list.Add(ValueFactory.Create(LightSteelBlue));
            _list.Add(ValueFactory.Create(Teal));
            _list.Add(ValueFactory.Create(BlueViolet));
            _list.Add(ValueFactory.Create(Blue));
            _list.Add(ValueFactory.Create(AliceBlue));
            _list.Add(ValueFactory.Create(SteelBlue));
            _list.Add(ValueFactory.Create(Plum));
            _list.Add(ValueFactory.Create(Ivory));
            _list.Add(ValueFactory.Create(OldLace));
            _list.Add(ValueFactory.Create(DarkSalmon));
            _list.Add(ValueFactory.Create(DarkSeaGreen));
            _list.Add(ValueFactory.Create(DarkOrchid));
            _list.Add(ValueFactory.Create(DarkSlateGray));
            _list.Add(ValueFactory.Create(DarkCyan));
            _list.Add(ValueFactory.Create(DarkGreen));
            _list.Add(ValueFactory.Create(DarkRed));
            _list.Add(ValueFactory.Create(DarkTurquoise));
            _list.Add(ValueFactory.Create(DarkMagenta));
            _list.Add(ValueFactory.Create(DarkGray));
            _list.Add(ValueFactory.Create(DarkBlue));
            _list.Add(ValueFactory.Create(DarkViolet));
            _list.Add(ValueFactory.Create(DarkSlateBlue));
            _list.Add(ValueFactory.Create(DarkGoldenrod));
            _list.Add(ValueFactory.Create(DarkOliveGreen));
            _list.Add(ValueFactory.Create(DarkOrange));
            _list.Add(ValueFactory.Create(DarkKhaki));
            _list.Add(ValueFactory.Create(Tomato));
            _list.Add(ValueFactory.Create(Gainsboro));
            _list.Add(ValueFactory.Create(MistyRose));
            _list.Add(ValueFactory.Create(DimGray));
            _list.Add(ValueFactory.Create(MediumAquamarine));
            _list.Add(ValueFactory.Create(MediumTurquoise));
            _list.Add(ValueFactory.Create(MediumSpringGreen));
            _list.Add(ValueFactory.Create(MediumSlateBlue));
            _list.Add(ValueFactory.Create(MediumSeaGreen));
            _list.Add(ValueFactory.Create(MediumOrchid));
            _list.Add(ValueFactory.Create(MediumBlue));
            _list.Add(ValueFactory.Create(MediumVioletRed));
            _list.Add(ValueFactory.Create(MediumPurple));
            _list.Add(ValueFactory.Create(Violet));
            _list.Add(ValueFactory.Create(Fuchsia));
            _list.Add(ValueFactory.Create(Khaki));
            _list.Add(ValueFactory.Create(Tan));
            _list.Add(ValueFactory.Create(BurlyWood));
            _list.Add(ValueFactory.Create(Navy));
            _list.Add(ValueFactory.Create(FloralWhite));
            _list.Add(ValueFactory.Create(Cyan));
            _list.Add(ValueFactory.Create(Black));
            _list.Add(ValueFactory.Create(Thistle));
            _list.Add(ValueFactory.Create(Chartreuse));
            _list.Add(ValueFactory.Create(Chocolate));
            _list.Add(ValueFactory.Create(Snow));
            _list.Add(ValueFactory.Create(HotPink));
        }

        [ContextProperty("Аквамариновый", "Aquamarine")]
        public string Aquamarine
        {
            get { return "rgb(127, 255, 212)"; }
        }

        [ContextProperty("АнтичныйБелый", "AntiqueWhite")]
        public string AntiqueWhite
        {
            get { return "rgb(250, 235, 215)"; }
        }

        [ContextProperty("Бежевый", "Beige")]
        public string Beige
        {
            get { return "rgb(245, 245, 220)"; }
        }

        [ContextProperty("БелаяДымка", "WhiteSmoke")]
        public string WhiteSmoke
        {
            get { return "rgb(245, 245, 245)"; }
        }

        [ContextProperty("Белый", "White")]
        public string White
        {
            get { return "rgb(255, 255, 255)"; }
        }

        [ContextProperty("БелыйНавахо", "NavajoWhite")]
        public string NavajoWhite
        {
            get { return "rgb(255, 222, 173)"; }
        }

        [ContextProperty("Бирюзовый", "Turquoise")]
        public string Turquoise
        {
            get { return "rgb(64, 224, 208)"; }
        }

        [ContextProperty("Бисквитный", "Bisque")]
        public string Bisque
        {
            get { return "rgb(255, 228, 196)"; }
        }

        [ContextProperty("БледноБирюзовый", "PaleTurquoise")]
        public string PaleTurquoise
        {
            get { return "rgb(175, 238, 238)"; }
        }

        [ContextProperty("БледноЖелтый", "Cornsilk")]
        public string Cornsilk
        {
            get { return "rgb(255, 248, 220)"; }
        }

        [ContextProperty("БледноЗеленый", "PaleGreen")]
        public string PaleGreen
        {
            get { return "rgb(152, 251, 152)"; }
        }

        [ContextProperty("БледноЗолотистый", "PaleGoldenrod")]
        public string PaleGoldenrod
        {
            get { return "rgb(238, 232, 170)"; }
        }

        [ContextProperty("Васильковый", "CornflowerBlue")]
        public string CornflowerBlue
        {
            get { return "rgb(100, 149, 237)"; }
        }

        [ContextProperty("ГлубокийРозовый", "DeepPink")]
        public string DeepPink
        {
            get { return "rgb(255, 20, 147)"; }
        }

        [ContextProperty("Голубой", "DeepSkyBlue")]
        public string DeepSkyBlue
        {
            get { return "rgb(0, 191, 255)"; }
        }

        [ContextProperty("ГрифельноСерый", "LightSlateGray")]
        public string LightSlateGray
        {
            get { return "rgb(119, 136, 153)"; }
        }

        [ContextProperty("ГрифельноСиний", "SlateBlue")]
        public string SlateBlue
        {
            get { return "rgb(106, 90, 205)"; }
        }

        [ContextProperty("ЖелтоЗеленый", "YellowGreen")]
        public string YellowGreen
        {
            get { return "rgb(154, 205, 50)"; }
        }

        [ContextProperty("Желтый", "Yellow")]
        public string Yellow
        {
            get { return "rgb(255, 255, 0)"; }
        }

        [ContextProperty("ЗащитноСиний", "DodgerBlue")]
        public string DodgerBlue
        {
            get { return "rgb(30, 144, 255)"; }
        }

        [ContextProperty("ЗеленаяВесна", "SpringGreen")]
        public string SpringGreen
        {
            get { return "rgb(0, 255, 127)"; }
        }

        [ContextProperty("ЗеленаяЛужайка", "LawnGreen")]
        public string LawnGreen
        {
            get { return "rgb(124, 252, 0)"; }
        }

        [ContextProperty("ЗеленоЖелтый", "GreenYellow")]
        public string GreenYellow
        {
            get { return "rgb(173, 255, 47)"; }
        }

        [ContextProperty("ЗеленоеМоре", "SeaGreen")]
        public string SeaGreen
        {
            get { return "rgb(46, 139, 87)"; }
        }

        [ContextProperty("Зеленый", "Green")]
        public string Green
        {
            get { return "rgb(0, 128, 0)"; }
        }

        [ContextProperty("ЗеленыйЛайм", "LimeGreen")]
        public string LimeGreen
        {
            get { return "rgb(50, 205, 50)"; }
        }

        [ContextProperty("ЗеленыйЛесной", "ForestGreen")]
        public string ForestGreen
        {
            get { return "rgb(34, 139, 34)"; }
        }

        [ContextProperty("Золотарник", "Goldenrod")]
        public string Goldenrod
        {
            get { return "rgb(218, 165, 32)"; }
        }

        [ContextProperty("Золотой", "Gold")]
        public string Gold
        {
            get { return "rgb(255, 215, 0)"; }
        }

        [ContextProperty("Индиго", "Indigo")]
        public string Indigo
        {
            get { return "rgb(75, 0, 130)"; }
        }

        [ContextProperty("ИндийскийКрасный", "IndianRed")]
        public string IndianRed
        {
            get { return "rgb(205, 92, 92)"; }
        }

        [ContextProperty("Кирпичный", "Firebrick")]
        public string Firebrick
        {
            get { return "rgb(178, 34, 34)"; }
        }

        [ContextProperty("КожаноКоричневый", "SaddleBrown")]
        public string SaddleBrown
        {
            get { return "rgb(139, 69, 19)"; }
        }

        [ContextProperty("Коралловый", "Coral")]
        public string Coral
        {
            get { return "rgb(255, 127, 80)"; }
        }

        [ContextProperty("КоричневоМалиновый", "Maroon")]
        public string Maroon
        {
            get { return "rgb(128, 0, 0)"; }
        }

        [ContextProperty("Коричневый", "Brown")]
        public string Brown
        {
            get { return "rgb(165, 42, 42)"; }
        }

        [ContextProperty("КоролевскийСиний", "RoyalBlue")]
        public string RoyalBlue
        {
            get { return "rgb(65, 105, 225)"; }
        }

        [ContextProperty("Красный", "Red")]
        public string Red
        {
            get { return "rgb(255, 0, 0)"; }
        }

        [ContextProperty("Кровавый", "Crimson")]
        public string Crimson
        {
            get { return "rgb(220, 20, 60)"; }
        }

        [ContextProperty("Лаванда", "Lavender")]
        public string Lavender
        {
            get { return "rgb(230, 230, 250)"; }
        }

        [ContextProperty("Лазурный", "Azure")]
        public string Azure
        {
            get { return "rgb(240, 255, 255)"; }
        }

        [ContextProperty("Лайм", "Lime")]
        public string Lime
        {
            get { return "rgb(0, 255, 0)"; }
        }

        [ContextProperty("Лиловый", "PaleVioletRed")]
        public string PaleVioletRed
        {
            get { return "rgb(219, 112, 147)"; }
        }

        [ContextProperty("Лососевый", "Salmon")]
        public string Salmon
        {
            get { return "rgb(250, 128, 114)"; }
        }

        [ContextProperty("Льняной", "Linen")]
        public string Linen
        {
            get { return "rgb(250, 240, 230)"; }
        }

        [ContextProperty("Малиновый", "Magenta")]
        public string Magenta
        {
            get { return "rgb(255, 0, 255)"; }
        }

        [ContextProperty("Медовый", "Honeydew")]
        public string Honeydew
        {
            get { return "rgb(240, 255, 240)"; }
        }

        [ContextProperty("Мокасиновый", "Moccasin")]
        public string Moccasin
        {
            get { return "rgb(255, 228, 181)"; }
        }

        [ContextProperty("МорскаяВолна", "Aqua")]
        public string Aqua
        {
            get { return "rgb(0, 255, 255)"; }
        }

        [ContextProperty("МорскаяРакушка", "SeaShell")]
        public string SeaShell
        {
            get { return "rgb(255, 245, 238)"; }
        }

        [ContextProperty("МятноКремовый", "MintCream")]
        public string MintCream
        {
            get { return "rgb(245, 255, 250)"; }
        }

        [ContextProperty("НебесноГолубой", "SkyBlue")]
        public string SkyBlue
        {
            get { return "rgb(135, 206, 235)"; }
        }

        [ContextProperty("НебесноГолубойСветлый", "LightSkyBlue")]
        public string LightSkyBlue
        {
            get { return "rgb(135, 206, 250)"; }
        }

        [ContextProperty("НежноОливковый", "OliveDrab")]
        public string OliveDrab
        {
            get { return "rgb(107, 142, 35)"; }
        }

        [ContextProperty("Оливковый", "Olive")]
        public string Olive
        {
            get { return "rgb(128, 128, 0)"; }
        }

        [ContextProperty("ОранжевоКрасный", "OrangeRed")]
        public string OrangeRed
        {
            get { return "rgb(255, 69, 0)"; }
        }

        [ContextProperty("Оранжевый", "Orange")]
        public string Orange
        {
            get { return "rgb(255, 165, 0)"; }
        }

        [ContextProperty("Орхидея", "Orchid")]
        public string Orchid
        {
            get { return "rgb(218, 112, 214)"; }
        }

        [ContextProperty("Охра", "Sienna")]
        public string Sienna
        {
            get { return "rgb(160, 82, 45)"; }
        }

        [ContextProperty("Персиковый", "PeachPuff")]
        public string PeachPuff
        {
            get { return "rgb(255, 218, 185)"; }
        }

        [ContextProperty("Песочный", "SandyBrown")]
        public string SandyBrown
        {
            get { return "rgb(244, 164, 96)"; }
        }

        [ContextProperty("ПобегПапайи", "PapayaWhip")]
        public string PapayaWhip
        {
            get { return "rgb(255, 239, 213)"; }
        }

        [ContextProperty("ПолуночноСиний", "MidnightBlue")]
        public string MidnightBlue
        {
            get { return "rgb(25, 25, 112)"; }
        }

        [ContextProperty("ПороховаяСинь", "PowderBlue")]
        public string PowderBlue
        {
            get { return "rgb(176, 224, 230)"; }
        }

        [ContextProperty("ПризрачноБелый", "GhostWhite")]
        public string GhostWhite
        {
            get { return "rgb(248, 248, 255)"; }
        }

        [ContextProperty("Пурпурный", "Purple")]
        public string Purple
        {
            get { return "rgb(128, 0, 128)"; }
        }

        [ContextProperty("Пшеничный", "Wheat")]
        public string Wheat
        {
            get { return "rgb(245, 222, 179)"; }
        }

        [ContextProperty("РозовоКоричневый", "RosyBrown")]
        public string RosyBrown
        {
            get { return "rgb(188, 143, 143)"; }
        }

        [ContextProperty("РозовоЛавандовый", "LavenderBlush")]
        public string LavenderBlush
        {
            get { return "rgb(255, 240, 245)"; }
        }

        [ContextProperty("Розовый", "Pink")]
        public string Pink
        {
            get { return "rgb(255, 192, 203)"; }
        }

        [ContextProperty("СветлаяМорскаяВолна", "LightSeaGreen")]
        public string LightSeaGreen
        {
            get { return "rgb(32, 178, 170)"; }
        }

        [ContextProperty("СветлоЖелтый", "LightYellow")]
        public string LightYellow
        {
            get { return "rgb(255, 255, 224)"; }
        }

        [ContextProperty("СветлоЖелтыйЗолотистый", "LightGoldenrodYellow")]
        public string LightGoldenrodYellow
        {
            get { return "rgb(250, 250, 210)"; }
        }

        [ContextProperty("СветлоЗеленый", "LightGreen")]
        public string LightGreen
        {
            get { return "rgb(144, 238, 144)"; }
        }

        [ContextProperty("СветлоКоралловый", "LightCoral")]
        public string LightCoral
        {
            get { return "rgb(240, 128, 128)"; }
        }

        [ContextProperty("СветлоКоричневый", "Peru")]
        public string Peru
        {
            get { return "rgb(205, 133, 63)"; }
        }

        [ContextProperty("СветлоКремовый", "BlanchedAlmond")]
        public string BlanchedAlmond
        {
            get { return "rgb(255, 235, 205)"; }
        }

        [ContextProperty("СветлоЛимонный", "LemonChiffon")]
        public string LemonChiffon
        {
            get { return "rgb(255, 250, 205)"; }
        }

        [ContextProperty("СветлоРозовый", "LightPink")]
        public string LightPink
        {
            get { return "rgb(255, 182, 193)"; }
        }

        [ContextProperty("СветлоСерый", "LightGray")]
        public string LightGray
        {
            get { return "rgb(211, 211, 211)"; }
        }

        [ContextProperty("СветлоСиний", "LightBlue")]
        public string LightBlue
        {
            get { return "rgb(173, 216, 230)"; }
        }

        [ContextProperty("СветлыйЗеленоватоГолубой", "LightCyan")]
        public string LightCyan
        {
            get { return "rgb(224, 255, 255)"; }
        }

        [ContextProperty("СветлыйЛососевый", "LightSalmon")]
        public string LightSalmon
        {
            get { return "rgb(255, 160, 122)"; }
        }

        [ContextProperty("Серебристый", "Silver")]
        public string Silver
        {
            get { return "rgb(192, 192, 192)"; }
        }

        [ContextProperty("СероСиний", "CadetBlue")]
        public string CadetBlue
        {
            get { return "rgb(95, 158, 160)"; }
        }

        [ContextProperty("Серый", "Gray")]
        public string Gray
        {
            get { return "rgb(128, 128, 128)"; }
        }

        [ContextProperty("СерыйШифер", "SlateGray")]
        public string SlateGray
        {
            get { return "rgb(112, 128, 144)"; }
        }

        [ContextProperty("СинеГолубойСоСтальнымОттенком", "LightSteelBlue")]
        public string LightSteelBlue
        {
            get { return "rgb(176, 196, 222)"; }
        }

        [ContextProperty("СинеЗеленый", "Teal")]
        public string Teal
        {
            get { return "rgb(0, 128, 128)"; }
        }

        [ContextProperty("СинеФиолетовый", "BlueViolet")]
        public string BlueViolet
        {
            get { return "rgb(138, 43, 226)"; }
        }

        [ContextProperty("Синий", "Blue")]
        public string Blue
        {
            get { return "rgb(0, 0, 255)"; }
        }

        [ContextProperty("СинийЭлис", "AliceBlue")]
        public string AliceBlue
        {
            get { return "rgb(240, 248, 255)"; }
        }

        [ContextProperty("СиняяСталь", "SteelBlue")]
        public string SteelBlue
        {
            get { return "rgb(70, 130, 180)"; }
        }

        [ContextProperty("Сливовый", "Plum")]
        public string Plum
        {
            get { return "rgb(221, 160, 221)"; }
        }

        [ContextProperty("СлоноваяКость", "Ivory")]
        public string Ivory
        {
            get { return "rgb(255, 255, 240)"; }
        }

        [ContextProperty("СтароеКружево", "OldLace")]
        public string OldLace
        {
            get { return "rgb(253, 245, 230)"; }
        }

        [ContextProperty("ТемнаяЛососина", "DarkSalmon")]
        public string DarkSalmon
        {
            get { return "rgb(233, 150, 122)"; }
        }

        [ContextProperty("ТемнаяМорскаяВолна", "DarkSeaGreen")]
        public string DarkSeaGreen
        {
            get { return "rgb(143, 188, 139)"; }
        }

        [ContextProperty("ТемнаяОрхидея", "DarkOrchid")]
        public string DarkOrchid
        {
            get { return "rgb(153, 50, 204)"; }
        }

        [ContextProperty("ТемноАспидныйСерый", "DarkSlateGray")]
        public string DarkSlateGray
        {
            get { return "rgb(47, 79, 79)"; }
        }

        [ContextProperty("ТемноГолубой", "DarkCyan")]
        public string DarkCyan
        {
            get { return "rgb(0, 139, 139)"; }
        }

        [ContextProperty("ТемноЗеленый", "DarkGreen")]
        public string DarkGreen
        {
            get { return "rgb(0, 100, 0)"; }
        }

        [ContextProperty("ТемноКрасный", "DarkRed")]
        public string DarkRed
        {
            get { return "rgb(139, 0, 0)"; }
        }

        [ContextProperty("ТемноМандариновый", "DarkTurquoise")]
        public string DarkTurquoise
        {
            get { return "rgb(0, 206, 209)"; }
        }

        [ContextProperty("ТемноПурпурный", "DarkMagenta")]
        public string DarkMagenta
        {
            get { return "rgb(139, 0, 139)"; }
        }

        [ContextProperty("ТемноСерый", "DarkGray")]
        public string DarkGray
        {
            get { return "rgb(169, 169, 169)"; }
        }

        [ContextProperty("ТемноСиний", "DarkBlue")]
        public string DarkBlue
        {
            get { return "rgb(0, 0, 139)"; }
        }

        [ContextProperty("ТемноФиолетовый", "DarkViolet")]
        public string DarkViolet
        {
            get { return "rgb(148, 0, 211)"; }
        }

        [ContextProperty("ТемныйГрифельноСиний", "DarkSlateBlue")]
        public string DarkSlateBlue
        {
            get { return "rgb(72, 61, 139)"; }
        }

        [ContextProperty("ТемныйЗолотой", "DarkGoldenrod")]
        public string DarkGoldenrod
        {
            get { return "rgb(184, 134, 11)"; }
        }

        [ContextProperty("ТемныйОливковоЗеленый", "DarkOliveGreen")]
        public string DarkOliveGreen
        {
            get { return "rgb(85, 107, 47)"; }
        }

        [ContextProperty("ТемныйОранжевый", "DarkOrange")]
        public string DarkOrange
        {
            get { return "rgb(255, 140, 0)"; }
        }

        [ContextProperty("ТемныйХаки", "DarkKhaki")]
        public string DarkKhaki
        {
            get { return "rgb(189, 183, 107)"; }
        }

        [ContextProperty("Томатный", "Tomato")]
        public string Tomato
        {
            get { return "rgb(255, 99, 71)"; }
        }

        [ContextProperty("ТуманноБелый", "Gainsboro")]
        public string Gainsboro
        {
            get { return "rgb(220, 220, 220)"; }
        }

        [ContextProperty("ТусклоРозовый", "MistyRose")]
        public string MistyRose
        {
            get { return "rgb(255, 228, 225)"; }
        }

        [ContextProperty("ТусклоСерый", "DimGray")]
        public string DimGray
        {
            get { return "rgb(105, 105, 105)"; }
        }

        [ContextProperty("УмеренныйАквамарин", "MediumAquamarine")]
        public string MediumAquamarine
        {
            get { return "rgb(102, 205, 170)"; }
        }

        [ContextProperty("УмеренныйБирюзовый", "MediumTurquoise")]
        public string MediumTurquoise
        {
            get { return "rgb(72, 209, 204)"; }
        }

        [ContextProperty("УмеренныйВесеннеЗеленый", "MediumSpringGreen")]
        public string MediumSpringGreen
        {
            get { return "rgb(0, 250, 154)"; }
        }

        [ContextProperty("УмеренныйГрифельноСиний", "MediumSlateBlue")]
        public string MediumSlateBlue
        {
            get { return "rgb(123, 104, 238)"; }
        }

        [ContextProperty("УмеренныйМорскаяВолна", "MediumSeaGreen")]
        public string MediumSeaGreen
        {
            get { return "rgb(60, 179, 113)"; }
        }

        [ContextProperty("УмеренныйОрхидея", "MediumOrchid")]
        public string MediumOrchid
        {
            get { return "rgb(186, 85, 211)"; }
        }

        [ContextProperty("УмеренныйСиний", "MediumBlue")]
        public string MediumBlue
        {
            get { return "rgb(0, 0, 205)"; }
        }

        [ContextProperty("УмеренныйФиолетовоКрасный", "MediumVioletRed")]
        public string MediumVioletRed
        {
            get { return "rgb(199, 21, 133)"; }
        }

        [ContextProperty("УмеренныйФиолетовый", "MediumPurple")]
        public string MediumPurple
        {
            get { return "rgb(147, 112, 219)"; }
        }

        [ContextProperty("Фиолетовый", "Violet")]
        public string Violet
        {
            get { return "rgb(238, 130, 238)"; }
        }

        [ContextProperty("Фуксия", "Fuchsia")]
        public string Fuchsia
        {
            get { return "rgb(255, 0, 255)"; }
        }

        [ContextProperty("Хаки", "Khaki")]
        public string Khaki
        {
            get { return "rgb(240, 230, 140)"; }
        }

        [ContextProperty("ЦветЗагара", "Tan")]
        public string Tan
        {
            get { return "rgb(210, 180, 140)"; }
        }

        [ContextProperty("ЦветПлотнойДревесины", "BurlyWood")]
        public string BurlyWood
        {
            get { return "rgb(222, 184, 135)"; }
        }

        [ContextProperty("ЦветФормыМорскихОфицеров", "Navy")]
        public string Navy
        {
            get { return "rgb(0, 0, 128)"; }
        }

        [ContextProperty("ЦветочноБелый", "FloralWhite")]
        public string FloralWhite
        {
            get { return "rgb(255, 250, 240)"; }
        }

        [ContextProperty("Циан", "Cyan")]
        public string Cyan
        {
            get { return "rgb(0, 255, 255)"; }
        }

        [ContextProperty("Черный", "Black")]
        public string Black
        {
            get { return "rgb(0, 0, 0)"; }
        }

        [ContextProperty("Чертополох", "Thistle")]
        public string Thistle
        {
            get { return "rgb(216, 191, 216)"; }
        }

        [ContextProperty("Шартрез", "Chartreuse")]
        public string Chartreuse
        {
            get { return "rgb(127, 255, 0)"; }
        }

        [ContextProperty("Шоколадный", "Chocolate")]
        public string Chocolate
        {
            get { return "rgb(210, 105, 30)"; }
        }

        [ContextProperty("ЯркийБелый", "Snow")]
        public string Snow
        {
            get { return "rgb(255, 250, 250)"; }
        }

        [ContextProperty("ЯркоРозовый", "HotPink")]
        public string HotPink
        {
            get { return "rgb(255, 105, 180)"; }
        }
    }
}
