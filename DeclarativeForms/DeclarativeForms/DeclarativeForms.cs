using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;
using ScriptEngine.HostedScript.Library;

namespace osdf
{
    [ContextClass("ДекларативныеФормы", "DeclarativeForms")]
    public class DeclarativeForms : AutoContext<DeclarativeForms>
    {
        public static string funDelimiter = "d1ziwjr520tq"; // Разделитель передаваемых форме функций в переменной СтрокаФункций.
        public static string paramDelimiter = "|"; // Разделитель передаваемых от формы параметров.		
        public static string separator = Path.DirectorySeparatorChar.ToString();
        private static StructureImpl shareStructure = new StructureImpl();
        public DfEventArgs eventArgs;
        public static DeclarativeForms instance;
        private static object syncRoot = new Object();
        public static string _oscriptPath = "";
        public static string _nw = "";
        public static string strFunctions = "";

        public static string InitialStrFunctions { get; set; } = null; // Запомним интерфейс формы при запуске.
        public static long TimeClietnClosed { get; set; } // Время отключения клиента.
        public static long TimeClietnConnected { get; set; } // Время подключения клиента.

        public static Hashtable hashtable = new Hashtable();
        private static DfForm form = new DfForm();
        public static System.Diagnostics.Process process;
        public static System.Random Random = new Random();
        public static bool scriptsIsLoad = false;

        public static bool isWin = System.Environment.OSVersion.VersionString.Contains("Microsoft");
		
        public static IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
        public static string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Source")).AsString();
        public static string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Path")).AsString();
        public static string nameStartupScript = fullPathStartupScript.Replace(pathStartupScript, "").Replace(".os", "").Replace(separator, "");		

        public static DeclarativeForms getInstance()
        {
            if (instance == null)
            {
                lock (syncRoot)
                {
                    if (instance == null)
                    {
                        instance = new DeclarativeForms();
                    }
                }
            }
            return instance;
        }

        [ScriptConstructor]
        public static IRuntimeContextInstance Constructor()
        {
            if (isWin)
            {
                _nw = pathStartupScript + separator + "nwjs" + separator + "nw.exe";
            }
            else
            {
                _nw = pathStartupScript + separator + "nwjslin" + separator + "nw";
            }
            _oscriptPath = pathStartupScript + separator + "oscript" + separator + "bin" + separator + "oscript.exe";

            DeclarativeForms inst = getInstance();
            inst.InjectGlobalProperty(shareStructure, "ОбщаяСтруктура", false);
            shareStructure.Insert("ДФ", inst);
            return inst;
        }

        public static SystemGlobalContext GlobalContext()
        {
            return GlobalsManager.GetGlobalContext<SystemGlobalContext>();
        }
		
        public static void SendStrFunc(string strFunc)
        {
            strFunctions = strFunctions + strFunc + funDelimiter;
        }

        public static bool displayStartupWarning = false;
        [ContextProperty("ВыводитьПредупреждениеПриЗапуске", "DisplayStartupWarning")]
        public bool DisplayStartupWarning
        {
            get { return displayStartupWarning; }
            set { displayStartupWarning = value; }
        }

        public static bool openInBrowser = false;
        [ContextProperty("ОткрытьВБраузере", "OpenInBrowser")]
        public bool OpenInBrowser
        {
            get { return openInBrowser; }
            set
            {
                if (isWin)
                {
                    openInBrowser = value;
                }
            }
        }
		
        public static string CSSPath = "styles.css";
        private string _cssPath;
        [ContextProperty("cssПуть", "cssPath")]
        public string cssPath
        {
            get { return _cssPath; }
            set
            {
                _cssPath = value;
                CSSPath = _cssPath;
            }
        }
		
        [ContextMethod("ОкноСообщений", "MessageBox")]
        public DfMessageBox MessageBox(string p1 = null, string p2 = null, DfPoint p3 = null)
        {
            return new DfMessageBox(p1, p2, p3);
        }		

        [ContextProperty("МаксимумУведомленийНаЭкране", "MaxBalloonsOnScreen")]
        public int MaxBalloonsOnScreen { get; set; } = 5;
		
        [ContextMethod("Уведомления", "Balloons")]
        public DfBalloons Balloons()
        {
            return new DfBalloons();
        }		

        [ContextMethod("Лоток", "Tray")]
        public DfTray Tray()
        {
            if (!openInBrowser)
            {
                return new DfTray();
            }
            else
            {
                GlobalContext().Echo("Элемент Лоток недоступен при открытии программы в браузере.");
                return null;
            }
        }		
		
        [ContextMethod("Таймер", "Timer")]
        public DfTimer Timer()
        {
            return new DfTimer();
        }		
		
        [ContextMethod("Фон", "Background")]
        public DfBackground Background(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null, IValue p8 = null)
        {
            return new DfBackground(p1, p2, p3, p4, p5, p6, p7, p8);
        }

        [ContextMethod("Скрипт", "Script")]
        public DfScript Script()
        {
            return new DfScript();
        }
		
        [ContextMethod("Математика", "Math")]
        public DfMath Math()
        {
            return new DfMath();
        }

        private static DfTextBaseline df_TextBaseline = new DfTextBaseline();
        [ContextProperty("БазоваяЛинияТекста", "TextBaseline")]
        public DfTextBaseline TextBaseline
        {
            get { return df_TextBaseline; }
        }

        private static DfFontVariant df_FontVariant = new DfFontVariant();
        [ContextProperty("ВариантШрифта", "FontVariant")]
        public DfFontVariant FontVariant
        {
            get { return df_FontVariant; }
        }

        private static DfVerticalAlign df_VerticalAlign = new DfVerticalAlign();
        [ContextProperty("ВертикальноеВыравнивание", "VerticalAlign")]
        public DfVerticalAlign VerticalAlign
        {
            get { return df_VerticalAlign; }
        }

        private static DfVisibility df_Visibility = new DfVisibility();
        [ContextProperty("Видимость", "Visibility")]
        public DfVisibility Visibility
        {
            get { return df_Visibility; }
        }

        private static DfObjectFit df_ObjectFit = new DfObjectFit();
        [ContextProperty("ВписываниеОбъекта", "ObjectFit")]
        public DfObjectFit ObjectFit
        {
            get { return df_ObjectFit; }
        }

        private static DfUserSelect df_UserSelect = new DfUserSelect();
        [ContextProperty("ВыделениеПользователем", "UserSelect")]
        public DfUserSelect UserSelect
        {
            get { return df_UserSelect; }
        }

        private static DfAlignSelf df_AlignSelf = new DfAlignSelf();
        [ContextProperty("ВыравниваниеОтдельных", "AlignSelf")]
        public DfAlignSelf AlignSelf
        {
            get { return df_AlignSelf; }
        }

        private static DfAlignContent df_AlignContent = new DfAlignContent();
        [ContextProperty("ВыравниваниеСодержимого", "AlignContent")]
        public DfAlignContent AlignContent
        {
            get { return df_AlignContent; }
        }

        private static DfTextAlign df_TextAlign = new DfTextAlign();
        [ContextProperty("ВыравниваниеТекста", "TextAlign")]
        public DfTextAlign TextAlign
        {
            get { return df_TextAlign; }
        }

        private static DfAlignItems df_AlignItems = new DfAlignItems();
        [ContextProperty("ВыравниваниеЭлементов", "AlignItems")]
        public DfAlignItems AlignItems
        {
            get { return df_AlignItems; }
        }

        private static DfCssFloat df_CssFloat = new DfCssFloat();
        [ContextProperty("ГоризонтальноеВыравнивание", "CssFloat")]
        public DfCssFloat CssFloat
        {
            get { return df_CssFloat; }
        }

        private static DfHorizontalTextAlign df_HorizontalTextAlign = new DfHorizontalTextAlign();
        [ContextProperty("ГоризонтальноеВыравниваниеТекста", "HorizontalTextAlign")]
        public DfHorizontalTextAlign HorizontalTextAlign
        {
            get { return df_HorizontalTextAlign; }
        }

        private static DfBorderCollapse df_BorderCollapse = new DfBorderCollapse();
        [ContextProperty("ГраницаСвернута", "BorderCollapse")]
        public DfBorderCollapse BorderCollapse
        {
            get { return df_BorderCollapse; }
        }

        private static DfFontWeight df_FontWeight = new DfFontWeight();
        [ContextProperty("ЖирностьШрифта", "FontWeight")]
        public DfFontWeight FontWeight
        {
            get { return df_FontWeight; }
        }

        private static DfAnimationFillMode df_AnimationFillMode = new DfAnimationFillMode();
        [ContextProperty("ЗаливкаАнимации", "AnimationFillMode")]
        public DfAnimationFillMode AnimationFillMode
        {
            get { return df_AnimationFillMode; }
        }

        private static DfColumnFill df_ColumnFill = new DfColumnFill();
        [ContextProperty("ЗаполнениеКолонок", "ColumnFill")]
        public DfColumnFill ColumnFill
        {
            get { return df_ColumnFill; }
        }

        private static DfResize df_Resize = new DfResize();
        [ContextProperty("ИзменяемыйРазмер", "Resize")]
        public DfResize Resize
        {
            get { return df_Resize; }
        }

        private static DfBoxSizing df_BoxSizing = new DfBoxSizing();
        [ContextProperty("Калибровка", "BoxSizing")]
        public DfBoxSizing BoxSizing
        {
            get { return df_BoxSizing; }
        }

        private static DfMouseButtons df_MouseButtons = new DfMouseButtons();
        [ContextProperty("КнопкиМыши", "MouseButtons")]
        public DfMouseButtons MouseButtons
        {
            get { return df_MouseButtons; }
        }

        private static DfGlobalCompositeOperation df_GlobalCompositeOperation = new DfGlobalCompositeOperation();
        [ContextProperty("Композиция", "GlobalCompositeOperation")]
        public DfGlobalCompositeOperation GlobalCompositeOperation
        {
            get { return df_GlobalCompositeOperation; }
        }

        private static DfCursor df_Cursor = new DfCursor();
        [ContextProperty("Курсор", "Cursor")]
        public DfCursor Cursor
        {
            get { return df_Cursor; }
        }

        private static DfBackgroundRepeat df_BackgroundRepeat = new DfBackgroundRepeat();
        [ContextProperty("МозаикаКартинки", "BackgroundRepeat")]
        public DfBackgroundRepeat BackgroundRepeat
        {
            get { return df_BackgroundRepeat; }
        }

        private static DfBorderImageRepeat df_BorderImageRepeat = new DfBorderImageRepeat();
        [ContextProperty("МозаикаКартинкиГраницы", "BorderImageRepeat")]
        public DfBorderImageRepeat BorderImageRepeat
        {
            get { return df_BorderImageRepeat; }
        }

        private static DfTarget df_Target = new DfTarget();
        [ContextProperty("Назначение", "Target")]
        public DfTarget Target
        {
            get { return df_Target; }
        }
		
        private static DfDir df_Dir = new DfDir();
        [ContextProperty("Направление", "Dir")]
        public DfDir Dir
        {
            get { return df_Dir; }
        }

        private static DfAnimationDirection df_AnimationDirection = new DfAnimationDirection();
        [ContextProperty("НаправлениеАнимации", "AnimationDirection")]
        public DfAnimationDirection AnimationDirection
        {
            get { return df_AnimationDirection; }
        }

        private static DfFlexDirection df_FlexDirection = new DfFlexDirection();
        [ContextProperty("НаправлениеЭлементов", "FlexDirection")]
        public DfFlexDirection FlexDirection
        {
            get { return df_FlexDirection; }
        }

        private static DfClear df_Clear = new DfClear();
        [ContextProperty("Несвободно", "Clear")]
        public DfClear Clear
        {
            get { return df_Clear; }
        }

        private static DfBackgroundOrigin df_BackgroundOrigin = new DfBackgroundOrigin();
        [ContextProperty("ОбластьКартинки", "BackgroundOrigin")]
        public DfBackgroundOrigin BackgroundOrigin
        {
            get { return df_BackgroundOrigin; }
        }

        private static DfBackgroundClip df_BackgroundClip = new DfBackgroundClip();
        [ContextProperty("ОбластьРисования", "BackgroundClip")]
        public DfBackgroundClip BackgroundClip
        {
            get { return df_BackgroundClip; }
        }

        private static DfDisplay df_Display = new DfDisplay();
        [ContextProperty("Отображать", "Display")]
        public DfDisplay Display
        {
            get { return df_Display; }
        }

        private static DfTextDecorationLine df_TextDecorationLine = new DfTextDecorationLine();
        [ContextProperty("ОформлениеТекстаЛиния", "TextDecorationLine")]
        public DfTextDecorationLine TextDecorationLine
        {
            get { return df_TextDecorationLine; }
        }

        private static DfTextDecorationStyle df_TextDecorationStyle = new DfTextDecorationStyle();
        [ContextProperty("ОформлениеТекстаСтиль", "TextDecorationStyle")]
        public DfTextDecorationStyle TextDecorationStyle
        {
            get { return df_TextDecorationStyle; }
        }

        private static DfAnimationPlayState df_AnimationPlayState = new DfAnimationPlayState();
        [ContextProperty("Состояние", "AnimationPlayState")]
        public DfAnimationPlayState AnimationPlayState
        {
            get { return df_AnimationPlayState; }
        }

        private static DfFlexWrap df_FlexWrap = new DfFlexWrap();
        [ContextProperty("ПереносГибких", "FlexWrap")]
        public DfFlexWrap FlexWrap
        {
            get { return df_FlexWrap; }
        }

        private static DfWordWrap df_WordWrap = new DfWordWrap();
        [ContextProperty("ПереносСлов", "WordWrap")]
        public DfWordWrap WordWrap
        {
            get { return df_WordWrap; }
        }

        private static DfTextWrap df_TextWrap = new DfTextWrap();
        [ContextProperty("ПереносТекста", "TextWrap")]
        public DfTextWrap TextWrap
        {
            get { return df_TextWrap; }
        }

        private static DfOverflow df_Overflow = new DfOverflow();
        [ContextProperty("Переполнение", "Overflow")]
        public DfOverflow Overflow
        {
            get { return df_Overflow; }
        }

        private static DfTextOverflow df_TextOverflow = new DfTextOverflow();
        [ContextProperty("ПереполнениеТекста", "TextOverflow")]
        public DfTextOverflow TextOverflow
        {
            get { return df_TextOverflow; }
        }

        private static DfPatternRepeat df_PatternRepeat = new DfPatternRepeat();
        [ContextProperty("ПовторШаблона", "PatternRepeat")]
        public DfPatternRepeat PatternRepeat
        {
            get { return df_PatternRepeat; }
        }

        private static DfPosition df_Position = new DfPosition();
        [ContextProperty("Позиция", "Position")]
        public DfPosition Position
        {
            get { return df_Position; }
        }

        private static DfListStylePosition df_ListStylePosition = new DfListStylePosition();
        [ContextProperty("ПозицияСтиляСписка", "ListStylePosition")]
        public DfListStylePosition ListStylePosition
        {
            get { return df_ListStylePosition; }
        }

        private static DfFormPosition df_FormPosition = new DfFormPosition();
        [ContextProperty("ПозицияФормы", "FormPosition")]
        public DfFormPosition FormPosition
        {
            get { return df_FormPosition; }
        }

        private static DfCaptionSide df_CaptionSide = new DfCaptionSide();
        [ContextProperty("ПоложениеЗаголовка", "CaptionSide")]
        public DfCaptionSide CaptionSide
        {
            get { return df_CaptionSide; }
        }

        private static DfBackgroundPosition df_BackgroundPosition = new DfBackgroundPosition();
        [ContextProperty("ПоложениеКартинки", "BackgroundPosition")]
        public DfBackgroundPosition BackgroundPosition
        {
            get { return df_BackgroundPosition; }
        }

        private static DfWhiteSpace df_WhiteSpace = new DfWhiteSpace();
        [ContextProperty("Пробелы", "WhiteSpace")]
        public DfWhiteSpace WhiteSpace
        {
            get { return df_WhiteSpace; }
        }

        private static DfTextTransform df_TextTransform = new DfTextTransform();
        [ContextProperty("ПрописныеТекста", "TextTransform")]
        public DfTextTransform TextTransform
        {
            get { return df_TextTransform; }
        }

        private static DfEmptyCells df_EmptyCells = new DfEmptyCells();
        [ContextProperty("ПустыеЯчейки", "EmptyCells")]
        public DfEmptyCells EmptyCells
        {
            get { return df_EmptyCells; }
        }

        private static DfBackgroundSize df_BackgroundSize = new DfBackgroundSize();
        [ContextProperty("РазмерКартинки", "BackgroundSize")]
        public DfBackgroundSize BackgroundSize
        {
            get { return df_BackgroundSize; }
        }

        private static DfTableLayout df_TableLayout = new DfTableLayout();
        [ContextProperty("РазмещениеВТаблице", "TableLayout")]
        public DfTableLayout TableLayout
        {
            get { return df_TableLayout; }
        }

        private static DfJustifyContent df_JustifyContent = new DfJustifyContent();
        [ContextProperty("РасположениеСодержимого", "JustifyContent")]
        public DfJustifyContent JustifyContent
        {
            get { return df_JustifyContent; }
        }

        private static DfTransitionProperty df_TransitionProperty = new DfTransitionProperty();
        [ContextProperty("СвойствоПерехода", "TransitionProperty")]
        public DfTransitionProperty TransitionProperty
        {
            get { return df_TransitionProperty; }
        }
		
        private static DfBorderStyle df_BorderStyle = new DfBorderStyle();
        [ContextProperty("СтильГраницы", "BorderStyle")]
        public DfBorderStyle BorderStyle
        {
            get { return df_BorderStyle; }
        }

        private static DfOutlineStyle df_OutlineStyle = new DfOutlineStyle();
        [ContextProperty("СтильКонтура", "OutlineStyle")]
        public DfOutlineStyle OutlineStyle
        {
            get { return df_OutlineStyle; }
        }

        private static DfLineCap df_LineCap = new DfLineCap();
        [ContextProperty("СтильКонцовЛинии", "LineCap")]
        public DfLineCap LineCap
        {
            get { return df_LineCap; }
        }

        private static DfColumnRuleStyle df_ColumnRuleStyle = new DfColumnRuleStyle();
        [ContextProperty("СтильРазделителяКолонок", "ColumnRuleStyle")]
        public DfColumnRuleStyle ColumnRuleStyle
        {
            get { return df_ColumnRuleStyle; }
        }

        private static DfTransformStyle df_TransformStyle = new DfTransformStyle();
        [ContextProperty("СтильСдвига", "TransformStyle")]
        public DfTransformStyle TransformStyle
        {
            get { return df_TransformStyle; }
        }

        private static DfLineJoin df_LineJoin = new DfLineJoin();
        [ContextProperty("СтильУглаПересечения", "LineJoin")]
        public DfLineJoin LineJoin
        {
            get { return df_LineJoin; }
        }

        private static DfFontStyle df_FontStyle = new DfFontStyle();
        [ContextProperty("СтильШрифта", "FontStyle")]
        public DfFontStyle FontStyle
        {
            get { return df_FontStyle; }
        }

        private static DfRules df_Rules = new DfRules();
        [ContextProperty("Разлиновка", "Rules")]
        public DfRules Rules
        {
            get { return df_Rules; }
        }

        private static DfSelectedFileType df_SelectedFileType = new DfSelectedFileType();
        [ContextProperty("ТипВыбранногоФайла", "SelectedFileType")]
        public DfSelectedFileType SelectedFileType
        {
            get { return df_SelectedFileType; }
        }

        private static DfMarkerType df_MarkerType = new DfMarkerType();
        [ContextProperty("ТипМаркера", "MarkerType")]
        public DfMarkerType MarkerType
        {
            get { return df_MarkerType; }
        }

        private static DfMenuType df_MenuType = new DfMenuType();
        [ContextProperty("ТипМеню", "MenuType")]
        public DfMenuType MenuType
        {
            get { return df_MenuType; }
        }

        private static DfDisplayType df_DisplayType = new DfDisplayType();
        [ContextProperty("ТипОтображения", "DisplayType")]
        public DfDisplayType DisplayType
        {
            get { return df_DisplayType; }
        }

        private static DfListStyleType df_ListStyleType = new DfListStyleType();
        [ContextProperty("ТипСтиляСписка", "ListStyleType")]
        public DfListStyleType ListStyleType
        {
            get { return df_ListStyleType; }
        }

        private static DfMenuItemType df_MenuItemType = new DfMenuItemType();
        [ContextProperty("ТипЭлементаМеню", "MenuItemType")]
        public DfMenuItemType MenuItemType
        {
            get { return df_MenuItemType; }
        }

        private static DfBackgroundAttachment df_BackgroundAttachment = new DfBackgroundAttachment();
        [ContextProperty("ФоновоеВложение", "BackgroundAttachment")]
        public DfBackgroundAttachment BackgroundAttachment
        {
            get { return df_BackgroundAttachment; }
        }

        private static DfTransitionTimingFunction df_TransitionTimingFunction = new DfTransitionTimingFunction();
        [ContextProperty("ФункцияПерехода", "TransitionTimingFunction")]
        public DfTransitionTimingFunction TransitionTimingFunction
        {
            get { return df_TransitionTimingFunction; }
        }

        private static DfAnimationTimingFunction df_AnimationTimingFunction = new DfAnimationTimingFunction();
        [ContextProperty("ФункцияСинхронизации", "AnimationTimingFunction")]
        public DfAnimationTimingFunction AnimationTimingFunction
        {
            get { return df_AnimationTimingFunction; }
        }

        private static DfColor df_Color = new DfColor();
        [ContextProperty("Цвет", "Color")]
        public DfColor Color
        {
            get { return df_Color; }
        }

        private static DfBorderWidth df_BorderWidth = new DfBorderWidth();
        [ContextProperty("ШиринаГраницы", "BorderWidth")]
        public DfBorderWidth BorderWidth
        {
            get { return df_BorderWidth; }
        }

        [ContextMethod("Артикль", "Article")]
        public DfArticle Article()
        {
            return new DfArticle();
        }

        [ContextMethod("Абзац", "Paragraph")]
        public DfParagraph Paragraph()
        {
            return new DfParagraph();
        }

        [ContextProperty("АргументыСобытия", "EventArgs")]
        public IValue EventArgs
        {
            get { return eventArgs; }
        }

        [ContextMethod("Аудио", "Audio")]
        public DfAudio Audio()
        {
            return new DfAudio();
        }

        [ContextMethod("Блок", "Div")]
        public DfDiv Div()
        {
            return new DfDiv();
        }

        [ContextMethod("ВыборВремени", "TimeSelection")]
        public DfTimeSelection TimeSelection()
        {
            return new DfTimeSelection();
        }

        [ContextMethod("ВыборДаты", "DateSelection")]
        public DfDateSelection DateSelection()
        {
            return new DfDateSelection();
        }

        [ContextMethod("ВыборДатыВремени", "DateTimeSelection")]
        public DfDateTimeSelection DateTimeSelection()
        {
            return new DfDateTimeSelection();
        }

        [ContextMethod("ВыборМестнойДатыВремени", "DateTimeLocalSelection")]
        public DfDateTimeLocalSelection DateTimeLocalSelection()
        {
            return new DfDateTimeLocalSelection();
        }

        [ContextMethod("ВыборМесяца", "MonthSelection")]
        public DfMonthSelection MonthSelection()
        {
            return new DfMonthSelection();
        }

        [ContextMethod("ВыборНедели", "WeekSelection")]
        public DfWeekSelection WeekSelection()
        {
            return new DfWeekSelection();
        }

        [ContextMethod("ВыборФайла", "FileSelection")]
        public DfFileSelection FileSelection()
        {
            return new DfFileSelection();
        }

        [ContextMethod("ВыборЦвета", "ColorSelection")]
        public DfColorSelection ColorSelection()
        {
            return new DfColorSelection();
        }

        [ContextMethod("Группа", "Group")]
        public DfGroup Group()
        {
            return new DfGroup();
        }

        [ContextMethod("ГруппаКолонок", "Colgroup")]
        public DfColgroup Colgroup()
        {
            return new DfColgroup();
        }

        [ContextMethod("ГруппировкаПоляСписка", "SelectGroup")]
        public DfSelectGroup SelectGroup()
        {
            return new DfSelectGroup();
        }

        [ContextMethod("Действие", "Action")]
        public DfAction Action(IRuntimeContextInstance script, string methodName, IValue param = null)
        {
            return new DfAction(script, methodName, param);
        }

        [ContextMethod("Диалог", "Dialog")]
        public DfDialog Dialog()
        {
            return new DfDialog();
        }

        [ContextMethod("ДополнительныйБлок", "AdditionalDiv")]
        public DfAdditionalDiv AdditionalDiv()
        {
            return new DfAdditionalDiv();
        }

        [ContextMethod("ЖирныйТекст", "BoldText")]
        public DfBoldText BoldText()
        {
            return new DfBoldText();
        }

        [ContextMethod("Заголовок", "Caption")]
        public DfCaption Caption()
        {
            return new DfCaption();
        }

        [ContextMethod("Заголовок1", "H1")]
        public DfH1 H1()
        {
            return new DfH1();
        }

        [ContextMethod("Заголовок2", "H2")]
        public DfH2 H2()
        {
            return new DfH2();
        }

        [ContextMethod("Заголовок3", "H3")]
        public DfH3 H3()
        {
            return new DfH3();
        }

        [ContextMethod("Заголовок4", "H4")]
        public DfH4 H4()
        {
            return new DfH4();
        }

        [ContextMethod("Заголовок5", "H5")]
        public DfH5 H5()
        {
            return new DfH5();
        }

        [ContextMethod("Заголовок6", "H6")]
        public DfH6 H6()
        {
            return new DfH6();
        }

        [ContextMethod("ЗаголовокГруппы", "GroupTitle")]
        public DfGroupTitle GroupTitle()
        {
            return new DfGroupTitle();
        }

        [ContextMethod("ЯчейкаЗаголовка", "HeaderCell")]
        public DfHeaderCell HeaderCell()
        {
            return new DfHeaderCell();
        }

        [ContextMethod("ЗаголовокРаскрываемогоБлока", "ExpandableDivHeader")]
        public DfExpandableDivHeader ExpandableDivHeader()
        {
            return new DfExpandableDivHeader();
        }

        [ContextMethod("Изображение", "Image")]
        public DfImage Image()
        {
            return new DfImage();
        }

        [ContextMethod("Индикатор", "Progress")]
        public DfProgress Progress()
        {
            return new DfProgress();
        }

        [ContextMethod("Итоги", "Outcome")]
        public DfOutcome Outcome()
        {
            return new DfOutcome();
        }

        [ContextMethod("Карта", "Map")]
        public DfMap Map()
        {
            return new DfMap();
        }

        [ContextMethod("Кнопка", "Button")]
        public DfButton Button()
        {
            return new DfButton();
        }

        [ContextMethod("Код", "Code")]
        public DfCode Code()
        {
            return new DfCode();
        }

        [ContextMethod("Колонка", "Column")]
        public DfColumn Column()
        {
            return new DfColumn();
        }

        [ContextMethod("Колонтитул", "Header")]
        public DfHeader Header()
        {
            return new DfHeader();
        }

        [ContextMethod("КурсивТекст", "ItalicsText")]
        public DfItalicsText ItalicsText()
        {
            return new DfItalicsText();
        }

        [ContextMethod("Линия", "Line")]
        public DfLine Line()
        {
            return new DfLine();
        }

        [ContextMethod("МаркированныйТекст", "MarkedText")]
        public DfMarkedText MarkedText()
        {
            return new DfMarkedText();
        }

        [ContextMethod("МедиаГруппа", "MediaGroup")]
        public DfMediaGroup MediaGroup()
        {
            return new DfMediaGroup();
        }

        [ContextMethod("МелкийТекст", "SmallText")]
        public DfSmallText SmallText()
        {
            return new DfSmallText();
        }

        [ContextMethod("Меню", "Menu")]
        public DfMenu Menu(string type)
        {
            return new DfMenu(type);
        }

        [ContextMethod("НадстрочныйТекст", "SupText")]
        public DfSupText SupText()
        {
            return new DfSupText();
        }

        [ContextMethod("НаправленныйТекст", "DirectedText")]
        public DfDirectedText DirectedText()
        {
            return new DfDirectedText();
        }

        [ContextMethod("НеупорядоченныйСписок", "UnorderedList")]
        public DfUnorderedList UnorderedList()
        {
            return new DfUnorderedList();
        }

        [ContextMethod("НижнийКолонтитул", "Footer")]
        public DfFooter Footer()
        {
            return new DfFooter();
        }

        [ContextMethod("Область", "Area")]
        public DfArea Area()
        {
            return new DfArea();
        }

        [ContextMethod("ОбластьТаблицы", "TableBody")]
        public DfTableBody TableBody()
        {
            return new DfTableBody();
        }

        [ContextMethod("ОбластьТекста", "TextArea")]
        public DfTextArea TextArea()
        {
            return new DfTextArea();
        }

        [ContextMethod("ОписаниеМедиа", "CaptionMedia")]
        public DfCaptionMedia CaptionMedia()
        {
            return new DfCaptionMedia();
        }

        [ContextMethod("Определение", "Definition")]
        public DfDefinition Definition()
        {
            return new DfDefinition();
        }

        [ContextMethod("Переключатель", "Radio")]
        public DfRadio Radio()
        {
            return new DfRadio();
        }

        [ContextMethod("Перенос", "Transfer")]
        public DfTransfer Transfer()
        {
            return new DfTransfer();
        }

        [ContextMethod("Подпись", "Label")]
        public DfLabel Label()
        {
            return new DfLabel();
        }

        [ContextMethod("ПодстрочныйТекст", "SubText")]
        public DfSubText SubText()
        {
            return new DfSubText();
        }

        [ContextMethod("ПодчеркнутыйТекст", "UnderlineText")]
        public DfUnderlineText UnderlineText()
        {
            return new DfUnderlineText();
        }

        [ContextMethod("ПолеПароля", "PasswordField")]
        public DfPasswordField PasswordField()
        {
            return new DfPasswordField();
        }

        [ContextMethod("ПолеПоиска", "SearchField")]
        public DfSearchField SearchField()
        {
            return new DfSearchField();
        }

        [ContextMethod("ПолеСписка", "Select")]
        public DfSelect Select()
        {
            return new DfSelect();
        }

        [ContextMethod("ПолеТекста", "TextField")]
        public DfTextField TextField()
        {
            return new DfTextField();
        }

        [ContextMethod("ПолеЧисла", "NumberField")]
        public DfNumberField NumberField()
        {
            return new DfNumberField();
        }

        [ContextMethod("Ползунок", "Range")]
        public DfRange Range()
        {
            return new DfRange();
        }

        [ContextMethod("РаскрываемыйБлок", "ExpandableDiv")]
        public DfExpandableDiv ExpandableDiv()
        {
            return new DfExpandableDiv();
        }

        [ContextMethod("Результат", "Output")]
        public DfOutput Output()
        {
            return new DfOutput();
        }

        [ContextMethod("СписокОпределений", "ListDefinition")]
        public DfListDefinition ListDefinition()
        {
            return new DfListDefinition();
        }

        [ContextMethod("Ссылка", "Link")]
        public DfLink Link()
        {
            return new DfLink();
        }

        [ContextMethod("СтрокаТаблицы", "TableRow")]
        public DfTableRow TableRow()
        {
            return new DfTableRow();
        }

        [ContextMethod("Таблица", "Table")]
        public DfTable Table()
        {
            return new DfTable();
        }

        [ContextMethod("Термин", "Term")]
        public DfTerm Term()
        {
            return new DfTerm();
        }

        [ContextMethod("УдаленыйТекст", "DeletedText")]
        public DfDeletedText DeletedText()
        {
            return new DfDeletedText();
        }

        [ContextMethod("УпорядоченныйСписок", "OrderedList")]
        public DfOrderedList OrderedList()
        {
            return new DfOrderedList();
        }

        [ContextMethod("Флажок", "CheckBox")]
        public DfCheckBox CheckBox()
        {
            return new DfCheckBox();
        }

        [ContextProperty("Форма", "Form")]
        public DfForm Form
        {
            get { return form; }
        }

        [ContextMethod("ФорматированныйТекст", "PreformattedText")]
        public DfPreformattedText PreformattedText()
        {
            return new DfPreformattedText();
        }

        [ContextMethod("Фрейм", "Frame")]
        public DfFrame Frame()
        {
            return new DfFrame();
        }

        [ContextMethod("Холст", "Canvas")]
        public DfCanvas Canvas()
        {
            return new DfCanvas();
        }

        [ContextMethod("ШапкаТаблицы", "TableHeader")]
        public DfTableHeader TableHeader()
        {
            return new DfTableHeader();
        }

        [ContextMethod("Шкала", "Meter")]
        public DfMeter Meter()
        {
            return new DfMeter();
        }
		
        [ContextMethod("СвойстваАнимации", "AnimationOptions")]
        public DfAnimationProperties AnimationProperties(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null, IValue p8 = null)
        {
            return new DfAnimationProperties(p1, p2, p3, p4, p5, p6, p7, p8);
        }
		
        [ContextMethod("ПараметрыАнимации", "AnimationOptions")]
        public DfAnimationOptions AnimationOptions(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null)
        {
            return new DfAnimationOptions(p1, p2, p3, p4, p5, p6, p7);
        }

        [ContextMethod("Кадры", "Frames")]
        public DfFrames Frames()
        {
            return new DfFrames();
        }

        [ContextMethod("БезьеКуб", "CubicBezier")]
        public DfCubicBezier CubicBezier(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
        {
            return new DfCubicBezier(p1, p2, p3, p4);
        }

        [ContextMethod("Границы", "Borders")]
        public DfBorders Borders(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfBorders(p1, p2, p3);
        }

        [ContextMethod("ВерхняяГраница", "BorderTop")]
        public DfBorderTop BorderTop(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfBorderTop(p1, p2, p3);
        }

        [ContextMethod("Заполнение", "Padding")]
        public DfPadding Padding(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
        {
            return new DfPadding(p1, p2, p3, p4);
        }

        [ContextMethod("КартинкаГраницы", "BorderImage")]
        public DfBorderImage BorderImage(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null)
        {
            return new DfBorderImage(p1, p2, p3, p4, p5);
        }

        [ContextMethod("КолонкиЭлемента", "Columns")]
        public DfColumns Columns(IValue p1 = null, IValue p2 = null)
        {
            return new DfColumns(p1, p2);
        }

        [ContextMethod("Контур", "Outline")]
        public DfOutline Outline(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfOutline(p1, p2, p3);
        }

        [ContextMethod("ЛеваяГраница", "BorderLeft")]
        public DfBorderLeft BorderLeft(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfBorderLeft(p1, p2, p3);
        }

        [ContextMethod("Масштаб", "Scale")]
        public DfScale Scale(IValue p1 = null, IValue p2 = null)
        {
            return new DfScale(p1, p2);
        }

        [ContextMethod("Масштаб3Д", "Scale3D")]
        public DfScale3D Scale3D(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfScale3D(p1, p2, p3);
        }

        [ContextMethod("МасштабЗет", "ScaleZ")]
        public DfScaleZ ScaleZ(IValue p1 = null)
        {
            return new DfScaleZ(p1);
        }

        [ContextMethod("МасштабИгрек", "ScaleY")]
        public DfScaleY ScaleY(IValue p1 = null)
        {
            return new DfScaleY(p1);
        }

        [ContextMethod("МасштабИкс", "ScaleX")]
        public DfScaleX ScaleX(IValue p1 = null)
        {
            return new DfScaleX(p1);
        }

        [ContextMethod("Матрица", "Matrix")]
        public DfMatrix Matrix(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null)
        {
            return new DfMatrix(p1, p2, p3, p4, p5, p6);
        }

        [ContextMethod("Матрица3Д", "Matrix3D")]
        public DfMatrix3D Matrix3D(ArrayImpl p1 = null)
        {
            if (p1 != null)
            {
                return new DfMatrix3D(p1);
            }
            return new DfMatrix3D();
        }

        [ContextMethod("Наклон", "Skew")]
        public DfSkew Skew(IValue p1 = null, IValue p2 = null)
        {
            return new DfSkew(p1, p2);
        }

        [ContextMethod("НаклонИгрек", "SkewY")]
        public DfSkewY SkewY(IValue p1 = null)
        {
            return new DfSkewY(p1);
        }

        [ContextMethod("НаклонИкс", "SkewX")]
        public DfSkewX SkewX(IValue p1 = null)
        {
            return new DfSkewX(p1);
        }

        [ContextMethod("НижняяГраница", "BorderBottom")]
        public DfBorderBottom BorderBottom(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfBorderBottom(p1, p2, p3);
        }

        [ContextMethod("Отступ", "Margin")]
        public DfMargin Margin(int p1 = 0, int p2 = 0, int p3 = 0, int p4 = 0, bool p5 = false)
        {
            return new DfMargin(p1, p2, p3, p4, p5);
        }

        [ContextMethod("Перевод", "Translate")]
        public DfTranslate Translate(IValue p1 = null, IValue p2 = null)
        {
            return new DfTranslate(p1, p2);
        }

        [ContextMethod("Перевод3Д", "Translate3D")]
        public DfTranslate3D Translate3D(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfTranslate3D(p1, p2, p3);
        }

        [ContextMethod("ПереводЗет", "TranslateZ")]
        public DfTranslateZ TranslateZ(IValue p1 = null)
        {
            return new DfTranslateZ(p1);
        }

        [ContextMethod("ПереводИгрек", "TranslateY")]
        public DfTranslateY TranslateY(IValue p1 = null)
        {
            return new DfTranslateY(p1);
        }

        [ContextMethod("ПереводИкс", "TranslateX")]
        public DfTranslateX TranslateX(IValue p1 = null)
        {
            return new DfTranslateX(p1);
        }

        [ContextMethod("Переход", "Transition")]
        public DfTransition Transition(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
        {
            return new DfTransition(p1, p2, p3, p4);
        }

        [ContextMethod("Перспектива", "Perspective")]
        public DfPerspective Perspective(IValue p1 = null)
        {
            return new DfPerspective(p1);
        }

        [ContextMethod("Поворот", "Rotate")]
        public DfRotate Rotate(IValue p1 = null)
        {
            return new DfRotate(p1);
        }

        [ContextMethod("Поворот3Д", "Rotate3D")]
        public DfRotate3D Rotate3D(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
        {
            return new DfRotate3D(p1, p2, p3, p4);
        }

        [ContextMethod("ПоворотЗет", "RotateZ")]
        public DfRotateZ RotateZ(IValue p1 = null)
        {
            return new DfRotateZ(p1);
        }

        [ContextMethod("ПоворотИгрек", "RotateY")]
        public DfRotateY RotateY(IValue p1 = null)
        {
            return new DfRotateY(p1);
        }

        [ContextMethod("ПоворотИкс", "RotateX")]
        public DfRotateX RotateX(IValue p1 = null)
        {
            return new DfRotateX(p1);
        }

        [ContextMethod("ПраваяГраница", "BorderRight")]
        public DfBorderRight BorderRight(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfBorderRight(p1, p2, p3);
        }

        [ContextMethod("Прямоугольник", "Rectangle")]
        public DfRectangle Rectangle(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
        {
            return new DfRectangle(p1, p2, p3, p4);
        }

        [ContextMethod("Круг", "Circle")]
        public DfCircle Circle(int p1 = 0, int p2 = 0, int p3 = 0)
        {
            return new DfCircle(p1, p2, p3);
        }

        [ContextMethod("Полигон", "Polygon")]
        public DfPolygon Polygon(ArrayImpl p1 = null)
        {
            return new DfPolygon(p1);
        }

        [ContextMethod("РадиусГраницы", "BorderRadius")]
        public DfBorderRadius BorderRadius(int p1 = 0, int p2 = 0, int p3 = 0, int p4 = 0)
        {
            return new DfBorderRadius(p1, p2, p3, p4);
        }

        [ContextMethod("РазделительКолонок", "ColumnRule")]
        public DfColumnRule ColumnRule(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfColumnRule(p1, p2, p3);
        }

        [ContextMethod("Размер", "Size")]
        public DfSize Size(IValue p1 = null, IValue p2 = null)
        {
            return new DfSize(p1, p2);
        }

        [ContextMethod("ТочкаСдвига", "TransformOrigin")]
        public DfTransformOrigin TransformOrigin(int p1 = 0, int p2 = 0, int p3 = 0)
        {
            return new DfTransformOrigin(p1, p2, p3);
        }

        [ContextMethod("Стиль", "Style")]
        public DfStyle Style()
        {
            return new DfStyle();
        }

        [ContextMethod("СтильГраниц", "BordersStyle")]
        public DfBordersStyle BordersStyle(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
        {
            return new DfBordersStyle(p1, p2, p3, p4);
        }

        [ContextMethod("СтильСписка", "ListStyle")]
        public DfListStyle ListStyle(IValue p1 = null, IValue p2 = null, IValue p3 = null)
        {
            return new DfListStyle(p1, p2, p3);
        }

        [ContextMethod("Тень", "BoxShadow")]
        public DfBoxShadow BoxShadow(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, bool p6 = false)
        {
            return new DfBoxShadow(p1, p2, p3, p4, p5, p6);
        }

        [ContextMethod("ИсточникПерспективы", "PerspectiveOrigin")]
        public DfPerspectiveOrigin PerspectiveOrigin(IValue p1 = null, IValue p2 = null)
        {
            return new DfPerspectiveOrigin(p1, p2);
        }

        [ContextMethod("Точка", "Point")]
        public DfPoint Point(int p1 = 0, int p2 = 0)
        {
            return new DfPoint(p1, p2);
        }

        [ContextMethod("ФильтрИзображений", "ImagesFilter")]
        public DfImagesFilter ImagesFilter(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null, IValue p7 = null, IValue p8 = null, IValue p9 = null, IValue p10 = null)
        {
            return new DfImagesFilter(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10);
        }

        [ContextMethod("ЦветГраниц", "BordersColor")]
        public DfBordersColor BordersColor(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
        {
            return new DfBordersColor(p1, p2, p3, p4);
        }

        [ContextMethod("ШиринаГраниц", "BordersWidth")]
        public DfBordersWidth BordersWidth(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
        {
            return new DfBordersWidth(p1, p2, p3, p4);
        }

        [ContextMethod("Шрифт", "Font")]
        public DfFont Font(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null, IValue p5 = null, IValue p6 = null)
        {
            return new DfFont(p1, p2, p3, p4, p5, p6);
        }
		
        [ContextMethod("ЭлементМеню", "MenuItem")]
        public DfMenuItem MenuItem(string label = "меню", string type = "normal", DfMenu menu = null, string key = null, string modifiers = null)
        {
            if (menu != null)
            {
                if (key != null)
                {
                    if (modifiers != null)
                    {
                        return new DfMenuItem(label, type, menu, key, modifiers);
                    }
                    else
                    {
                        return new DfMenuItem(label, type, menu, key);
                    }
                }
                else
                {
                    return new DfMenuItem(label, type, menu);
                }
            }
            else
            {
                if (key != null)
                {
                    if (modifiers != null)
                    {
                        return new DfMenuItem(label, type, key, modifiers);
                    }
                    else
                    {
                        return new DfMenuItem(label, type, key);
                    }
                }
                else
                {
                    return new DfMenuItem(label, type);
                }
            }
        }

        [ContextMethod("ЭлементПоляСписка", "SelectItem")]
        public DfSelectItem SelectItem()
        {
            return new DfSelectItem();
        }

        [ContextMethod("ЭлементСписка", "ListItem")]
        public DfListItem ListItem()
        {
            return new DfListItem();
        }

        [ContextMethod("Ячейка", "Cell")]
        public DfCell Cell()
        {
            return new DfCell();
        }

        [ContextMethod("ЗавершитьРаботу", "Exit")]
        public void Exit()
        {
            if (!OpenInBrowser)
            {
                Send("gui.App.quit();");
            }
            else
            {
                Send("window.close();");
            }
        }

        [ContextMethod("Цвет", "Color")]
        public IValue Color2(IValue p1 = null, int p2 = 0, int p3 = 0)
        {
            if (p1 != null)
            {
                if (p1.SystemType.Name == "Строка")
                {
                    DfColor DfColor1 = new DfColor();
                    int NumberProp1 = DfColor1.FindProperty(p1.AsString());
                    string obj1 = DfColor1.GetPropValue(NumberProp1).AsString();
                    return ValueFactory.Create(obj1);
                }
                if (p1.SystemType.Name == "Число")
                {
                    string res = "rgb(" + Convert.ToString(p1.AsNumber()) + ", " + Convert.ToString(p2) + ", " + Convert.ToString(p3) + ")";
                    return ValueFactory.Create(res);
                }
            }
            return new DfColor();
        }

        [ContextProperty("СтрокаФункций", "FunctionString")]
        public string FunctionString
        {
            get { return strFunctions; }
            set { strFunctions = value; }
        }

        [ContextProperty("oscriptПуть", "oscriptPath")]
        public string oscriptPath
        {
            get { return _oscriptPath; }
            set { _oscriptPath = value; }
        }

        [ContextProperty("nwПуть", "nwPath")]
        public string nwPath
        {
            get { return _nw; }
            set { _nw = value; }
        }

        public static int portReceivingServer = 3333;
        [ContextProperty("ПортСервераПриема", "PortReceivingServer")]
        public int PortReceivingServer
        {
            get { return portReceivingServer; }
            set { portReceivingServer = value; }
        }

        public static int portSendServer = 3339;
        [ContextProperty("ПортСервераОтправки", "PortSendServer")]
        public int PortSendServer
        {
            get { return portSendServer; }
            set { portSendServer = value; }
        }

        [ContextProperty("ОбщаяСтруктура", "ShareStructure")]
        public StructureImpl ShareStructure
        {
            get { return shareStructure; }
        }

        [ContextMethod("ВвестиГлобальноеСвойство", "InjectGlobalProperty")]
        public void InjectGlobalProperty(IValue obj, string name, bool onlyRead)
        {
            GlobalContext().EngineInstance.Environment.InjectGlobalProperty(obj, name, onlyRead);
        }

        public static bool webserverReceivingUploaded = false;
        public static void LoadWsserverReceiving()
        {
            StructureImpl extContext = new StructureImpl();
            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
            extContext.Insert("ОбщаяСтруктура", shareStructure);

            string backgroundTasksServerReceiving = @"
Процедура ЗапускКлиента(параметр1) Экспорт
	Контекст = Новый Структура(""ДФ"", параметр1);
	Стр = ""
	|Перем ВСПДФ;
	|Перем ПервоеСообщение;
	|
	|Процедура ВСПДФ_ПриПолученииСообщения() Экспорт
	|	Сообщение = ВСПДФ.АргументыСобытия.Сообщение;
	|	ДФ.ОбработатьСообщение(Сообщение);
	|	Если ПервоеСообщение Тогда
	|	    ПервоеСообщение = Ложь;
	|	Иначе
	|	    Попытка
	|		    ВСПДФ.ОтправитьТекст(ДФ.СтрокаФункций);
	|	    Исключение
	|	    КонецПопытки;
	|	    ДФ.СтрокаФункций = """""""";
	|	КонецЕсли;
	|КонецПроцедуры
	|   
	|ВСПДФ = Новый ВебСерверПолученияДекларФорм();
	|ВСПДФ.ПриПолученииСообщения = ВСПДФ.Действие(ЭтотОбъект, """"ВСПДФ_ПриПолученииСообщения"""");
	|ВСПДФ.Начать(""""127.0.0.1"""", ДФ.ПортСервераПриема);
	|
	|ПервоеСообщение = Истина;
	|
	|Пока ВСПДФ.Продолжать Цикл
	|   ВСПДФ.ПолучитьСобытие().Выполнить();
	|КонецЦикла;
	|"";
	ЗагрузитьСценарийИзСтроки(Стр, Контекст);
КонецПроцедуры

МассивПараметров = Новый Массив(1);
МассивПараметров[0] = ОбщаяСтруктура.ДФ;
Задание = ФоновыеЗадания.Выполнить(ЭтотОбъект, ""ЗапускКлиента"", МассивПараметров);
";
            GlobalContext().LoadScriptFromString(backgroundTasksServerReceiving, extContext);
            while (!webserverReceivingUploaded)
            {
                System.Threading.Thread.Sleep(300);
            }		
        }

        public static bool webserverSendUploaded = false;
        public static void LoadWsserverSend()
        {
            StructureImpl extContext = new StructureImpl();
            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
            extContext.Insert("ОбщаяСтруктура", shareStructure);

            string backgroundTasksServerSend = @"
Процедура ЗапускКлиента(параметр1) Экспорт
	Контекст = Новый Структура(""ДФ"", параметр1);
	Стр = ""
	|Перем ВСОДФ;
	|Перем ПервоеСообщение;
	|
	|Процедура ВСОДФ_ПриПолученииСообщения() Экспорт
	|	Сообщение = ВСОДФ.АргументыСобытия.Сообщение;
	|	ДФ.ОбработатьСообщение(Сообщение);
	|	Если ПервоеСообщение Тогда
	|	    Попытка
	|		    ВСОДФ.ОтправитьТекст(ДФ.СтрокаФункций);
	|	    Исключение
	|	    КонецПопытки;
	|	    ДФ.СтрокаФункций = """""""";
	|	    ПервоеСообщение = Ложь;
	|	КонецЕсли;
	|КонецПроцедуры
	|   
	|ВСОДФ = Новый ВебСерверОтправкиДекларФорм();
	|ВСОДФ.ПриПолученииСообщения = ВСОДФ.Действие(ЭтотОбъект, """"ВСОДФ_ПриПолученииСообщения"""");
	|ВСОДФ.Начать(""""127.0.0.1"""", ДФ.ПортСервераОтправки);
	|
	|ПервоеСообщение = Истина;
	|
	|Пока ВСОДФ.Продолжать Цикл
	|   ВСОДФ.ПолучитьСобытие().Выполнить();
	|КонецЦикла;
	|"";
	ЗагрузитьСценарийИзСтроки(Стр, Контекст);
КонецПроцедуры

МассивПараметров = Новый Массив(1);
МассивПараметров[0] = ОбщаяСтруктура.ДФ;
Задание = ФоновыеЗадания.Выполнить(ЭтотОбъект, ""ЗапускКлиента"", МассивПараметров);
";
            GlobalContext().LoadScriptFromString(backgroundTasksServerSend, extContext);
            while (!webserverSendUploaded)
            {
                System.Threading.Thread.Sleep(300);
            }
        }

        public static bool clientServerUploaded = false;
        public void LoadClientServer()
        {
            StructureImpl extContext = new StructureImpl();
            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
            extContext.Insert("ОбщаяСтруктура", shareStructure);

            string backgroundClientServer = @"
Процедура ЗапускКлиента(параметр1) Экспорт
	Контекст = Новый Структура(""ДФ"", параметр1);
	Стр = ""
	|Перем КСДФ;
	|Перем Клиент;
	|Перем ИдентификаторКлиента;
	|
	|Процедура Сервер_ПриПодключенииКлиента() Экспорт
	|	СерверКлиент = КСДФ.СерверКлиентАрг().Клиент;
	|	ИдентификаторКлиента = СерверКлиент.ИдентификаторКлиента;
	|	//Сообщить(""""Клиент подключен. Идентификатор клиента = """" + СерверКлиент.ИдентификаторКлиента + """" """" + ТекущаяДата());
	|КонецПроцедуры
	|
	|Процедура Сервер_ПриОтключенииКлиента() Экспорт
	|	СерверКлиент = КСДФ.СерверКлиентАрг().Клиент;
	|	//Сообщить(""""Клиент отключен. Идентификатор клиента = """" + СерверКлиент.ИдентификаторКлиента + """" """" + ТекущаяДата());
	|КонецПроцедуры
	|
	|Процедура Сервер_ПриПолученииСообщения() Экспорт
	|	Сообщение = КСДФ.АргументыСобытия.Сообщение;
	|	Отправитель = КСДФ.АргументыСобытия.Отправитель;
	|	ДФ.ОбработатьСообщение(Сообщение.Текст);
	|	
	|	//Сообщить(""""Сообщение.Текст = """" + Сообщение.Текст);
	|	Если Сообщение.Текст = """"ConstantClient5du4fsjiwixxf"""" Тогда
	|		Клиент = КСДФ.АргументыСобытия.Отправитель;
	|		ДФ.ОбщаяСтруктура.Вставить(""""Клиент"""", Клиент);
	|		ДФ.ОбщаяСтруктура.Вставить(""""КСДФ"""", КСДФ);
	|	Иначе
	|	КонецЕсли;
	|
	|	//Сообщить(""""ДФ.СтрокаФункций = """" + ДФ.СтрокаФункций);
	|	Попытка
	|		Клиент.ОтправитьСообщение(КСДФ.СообщениеТекст(ДФ.СтрокаФункций));
	|	Исключение
	|		Отправитель.ОтправитьСообщение(КСДФ.СообщениеТекст(ДФ.СтрокаФункций));
	|	КонецПопытки;
	|	ДФ.СтрокаФункций = """""""";
	|	
	|	Если КСДФ.РежимСтороннегоКлиента = КСДФ.РежимКлиента.Браузер Тогда
	|		Если Сообщение.Текст = """"ConstantClient5du4fsjiwixxf"""" Тогда
	|		Иначе
	|			Отправитель.Отключить();
	|		КонецЕсли;
	|	КонецЕсли;
	|	// Сообщить(""""== Событие обработано ======================================="""");
	|КонецПроцедуры
	|
	|КСДФ = Новый КлиентСерверДекларФорм();
	|TCPСервер1 = КСДФ.TCPСервер(ДФ.ПортСервераПриема);
	|TCPСервер1.ПриПодключенииКлиента = КСДФ.Действие(ЭтотОбъект, """"Сервер_ПриПодключенииКлиента""""); // Это свойство необходимо установить.
	|TCPСервер1.ПриОтключенииКлиента = КСДФ.Действие(ЭтотОбъект, """"Сервер_ПриОтключенииКлиента""""); // Это свойство необходимо установить.
	|TCPСервер1.ПриПолученииСообщения = КСДФ.Действие(ЭтотОбъект, """"Сервер_ПриПолученииСообщения"""");
	|КСДФ.РежимСтороннегоКлиента = КСДФ.РежимКлиента.Браузер;
	|
	|TCPСервер1.Начать();
	|
	|Пока КСДФ.Продолжать Цикл
	|   КСДФ.ПолучитьСобытие().Выполнить();
	|КонецЦикла;
	|"";
	ЗагрузитьСценарийИзСтроки(Стр, Контекст);
КонецПроцедуры

МассивПараметров = Новый Массив(1);
МассивПараметров[0] = ОбщаяСтруктура.ДФ;
Задание = ФоновыеЗадания.Выполнить(ЭтотОбъект, ""ЗапускКлиента"", МассивПараметров);
";
            GlobalContext().LoadScriptFromString(backgroundClientServer, extContext);
            while (!clientServerUploaded)
            {
                System.Threading.Thread.Sleep(300);
            }
        }

        [ContextMethod("ЗагрузитьСценарии", "LoadScripts")]
        public StructureImpl LoadScripts(string folderName)
        {
            StructureImpl scripts = new StructureImpl();
            StructureImpl attachByPath = new StructureImpl();
            StructureImpl extContext = new StructureImpl();
            shareStructure.Insert("Сценарии", scripts);
            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
            extContext.Insert("ОбщаяСтруктура", shareStructure);

            // Ставим условия для корректной загрузки в случае одиночного или многократного использования
            // в сценарии метода Сценарии = ДФ.ЗагрузитьСценарии("os");
            if (!scriptsIsLoad)
            {
                if (isWin)
                {
                    LoadWsserverReceiving();
                    LoadWsserverSend();
                }
                else
                {
                    LoadClientServer();
                }
            }

            // Создаем в этом каталоге файл package.json с заданными в сценарии начальными свойствами формы.
            if (!OpenInBrowser)
            {
                File.WriteAllText(pathStartupScript + separator + "package.json", Packagejson.packagejson, System.Text.Encoding.UTF8);
            }

            // Создаем в этом каталоге файл index.html.
            if (isWin)
            {
                if (OpenInBrowser)
                {
                    string strIndexhtmlBr = IndexhtmlWinBr.Indexhtml;
                    if (DisplayStartupWarning)
                    {
                        string str1 = "//setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);";
                        string str2 = "setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);";
                        strIndexhtmlBr = strIndexhtmlBr.Replace(str1, str2);
                    }
                    File.WriteAllText(pathStartupScript + separator + "index.html", strIndexhtmlBr, System.Text.Encoding.UTF8);
                }
                else
                {
                    File.WriteAllText(pathStartupScript + separator + "index.html", IndexhtmlWin.Indexhtml, System.Text.Encoding.UTF8);
                }
            }
            else
            {
                if (OpenInBrowser)
                {
                    string str1 = "//setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);";
                    string str2 = "setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);";
                    string strIndexhtmlBr = IndexhtmlLinBr.Indexhtml.Replace(str1, str2);
                    File.WriteAllText(pathStartupScript + separator + "index.html", strIndexhtmlBr, System.Text.Encoding.UTF8);
                }
                else
                {
                    File.WriteAllText(pathStartupScript + separator + "index.html", IndexhtmlLin.Indexhtml, System.Text.Encoding.UTF8);
                }
            }

            if (isWin)
            {
                if (folderName == @".\")
                {
                    string path = @".\Классы\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @".\Модули\"; if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (folderName == @"..\")
                {
                    string path = @"..\Классы\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @"..\Модули\";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (!(folderName.Contains(@".\") || folderName.Contains(@"..\")))
                {
                    string[] result2 = folderName.Split(new string[] { ";", "\u000a", "\u000d" }, StringSplitOptions.RemoveEmptyEntries);
                    string path = "";
                    for (int i1 = 0; i1 < result2.Length; i1++)
                    {
                        path = result2[i1].Replace("\u0022", "").Trim();
                        if (Directory.Exists(path))
                        {
                            string[] files = Directory.GetFiles(path, "*.os");
                            for (int i2 = 0; i2 < files.Length; i2++)
                            {
                                attachByPath.Insert(Path.GetFileName(files[i2]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i2])));
                            }
                        }
                    }
                }
            }
            else
            {
                if (folderName == @"./")
                {
                    string path = @"./Классы/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @"./Модули/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (folderName == @"../")
                {
                    string path = @"../Классы/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                    path = @"../Модули/";
                    if (Directory.Exists(path))
                    {
                        string[] files = Directory.GetFiles(path, "*.os");
                        for (int i1 = 0; i1 < files.Length; i1++)
                        {
                            attachByPath.Insert(Path.GetFileName(files[i1]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i1])));
                        }
                    }
                }
                if (!(folderName.Contains(@"./") || folderName.Contains(@"../")))
                {
                    string[] result2 = folderName.Split(new string[]
                    { ";", "\u000a", "\u000d" }, StringSplitOptions.RemoveEmptyEntries);
                    string path = "";
                    for (int i1 = 0; i1 < result2.Length; i1++)
                    {
                        path = result2[i1].Replace("\u0022", "").Trim();
                        if (Directory.Exists(path))
                        {
                            string[] files = Directory.GetFiles(path, "*.os");
                            for (int i2 = 0; i2 < files.Length; i2++)
                            {
                                attachByPath.Insert(Path.GetFileName(files[i2]).Replace(".os", ""), ValueFactory.Create(Path.GetFullPath(files[i2])));
                            }
                        }
                    }
                }
            }
            foreach (var item in attachByPath)
            {
                IRuntimeContextInstance inst = GlobalContext().LoadScript(item.Value.AsString(), extContext);
                scripts.Insert(item.Key.AsString(), (IValue)inst);
            }

            scriptsIsLoad = true;

            return scripts;
        }

        private IValue sender;
        [ContextProperty("Отправитель", "Sender")]
        public IValue Sender
        {
            get { return sender; }
            set { sender = value; }
        }

        public static void AddToHashtable(dynamic p1, dynamic p2)
        {
            if (!hashtable.ContainsKey(p1))
            {
                hashtable.Add(p1, p2);
            }
            else
            {
                if (!((object)hashtable[p1]).Equals(p2))
                {
                    hashtable[p1] = p2;
                }
            }
        }

        [ContextMethod("НайтиЭлемент", "FindElement")]
        public IValue FindElement(object nameObject)
        {
            try
            {
                return (IValue)hashtable[nameObject];
            }
            catch
            {
                return null;
            }
        }

        [ContextMethod("СообщениеФорме", "MessageToForm")]
        public void Send(string p1)
        {
            if (isWin)
            {
                WebServerSendText(p1);
            }
            else
            {
                SendStrFunc(p1);
            }
        }

        [ContextMethod("ОбработатьСообщение", "ProcessMessage")]
        public void ProcessMessage(string p1)
        {
            string strZapros = p1;
            string[] massiv = strZapros.Split(new string[] { paramDelimiter }, StringSplitOptions.RemoveEmptyEntries);
            //GlobalContext().Echo("Сообщение.Текст = " + p1);
            //GlobalContext().Echo("СтрЗапроса = " + strZapros);
		
            if (strZapros == "formIsLoaded")
            {
                try
                {
                    Execute(((DfForm)FindElement("mainForm")).Loaded);
                }
                catch (Exception)
                {
                    //GlobalContext().Echo("Loaded не задан");
                }
            }
            if (strZapros == "FormClose")
            {
                Exit();
            }		
		
            if (!(massiv.Length < 2))
            {
                string nameElement = massiv[0];
                string nameEvent = massiv[1];
                if (massiv.Length == 2) // Для событий без аргументов.
                {
                    if (nameElement == "mainForm" && nameEvent == "loaded")
                    {
                        return;
                    }
		
                    try
                    {
                        Sender = FindElement(nameElement);
                        if (Sender.GetType() == typeof(osdf.DfMenuItem))
                        {
                            Execute((DfAction)FindElement(nameElement).AsObject().GetPropValue(nameEvent));
                        }
                        else
                        {
                            Execute((DfAction)Sender.GetType().GetProperty(nameEvent).GetValue(Sender));
                        }
                    }
                    catch
                    {
                        if (nameElement == "mainForm" && nameEvent == "loaded")
                        {
                            // Ничего не делаем.
                        }
                        else
                        {
                            if (Sender.GetType() != typeof(osdf.DfMenuItem))
                            {
                                GlobalContext().Echo("Не обработано событие = " + nameEvent);
                            }
                        }
                    }
                }
                else // Для событий с аргументами.
                {
                    try
                    {
                        if (nameEvent.Contains("v5v5v"))
                        {
                            string actionItemKey = nameEvent.Replace("v5v5v", "");
                            Sender = FindElement(nameElement);
                            string nameProperty = "";
                            System.Reflection.PropertyInfo[] myPropertyInfo = Sender.GetType().GetProperties();
                            for (int i = 0; i < myPropertyInfo.Length; i++)
                            {
                                if (myPropertyInfo[i].CustomAttributes.Count() == 1)
                                {
                                    string methodRus1 = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetName();
                                    string methodEn1 = myPropertyInfo[i].GetCustomAttribute<ContextPropertyAttribute>().GetAlias();
                                    if (methodRus1 == massiv[2] || methodEn1 == massiv[2])
                                    {
                                        nameProperty = methodEn1;
                                        break;
                                    }
                                }
                            }

                            string propertyType = Sender.GetType().GetProperty(nameProperty).PropertyType.ToString();
                            IValue propValue;
                            if (propertyType == "System.Int32")
                            {
                                Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                propValue = ValueFactory.Create(Convert.ToInt32(num1));
                            }
                            else if (propertyType == "ScriptEngine.HostedScript.Library.ArrayImpl")
                            {
                                ArrayImpl ArrayImpl1 = new ArrayImpl();
                                string[] s = massiv[3].Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                                for (int i = 0; i < s.Length; i++)
                                {
                                    if (FindElement(s[i]) != null)
                                    {
                                        ArrayImpl1.Add(FindElement(s[i]));
                                    }
                                    else
                                    {
                                        ArrayImpl1.Add(ValueFactory.Create(s[i]));
                                    }
                                }
                                propValue = ArrayImpl1;
                            }		
                            else if (propertyType == "osdf.DfOutcome")
                            {
                                propValue = (DfOutcome)FindElement(massiv[3]);
                            }		
                            else if (propertyType == "osdf.DfTableHeader")
                            {
                                propValue = (DfTableHeader)FindElement(massiv[3]);
                            }		
                            else if (Sender.GetType() == typeof(osdf.DfImage))
                            {
                                propValue = ValueFactory.Create(massiv[3].Replace("#", ""));
                            }		
                            else
                            {
                                propValue = ValueFactory.Create(massiv[3]);
                            }

                            try
                            {
                                // Присваивать значение будем свойству - посреднику.
                                string nameProperty2 = namesRusProps[massiv[2]][2].ToString();
                                if (nameProperty2 == "textAlign")
                                {
                                    nameProperty2 = "horizontalTextAlign";
                                }
                                if (nameProperty2 == "border")
                                {
                                    nameProperty2 = "borders";
                                }
                                if (nameProperty2 == "borderStyle")
                                {
                                    nameProperty2 = "bordersStyle";
                                }
                                if (nameProperty2 == "borderColor")
                                {
                                    nameProperty2 = "bordersColor";
                                }
                                if (nameProperty2 == "color")
                                {
                                    nameProperty2 = "textColor";
                                }
                                if (nameProperty2 == "borderWidth")
                                {
                                    nameProperty2 = "bordersWidth";
                                }		
                                dynamic obj = ((dynamic)Sender);

                                Type type = obj.GetType().GetProperty(nameProperty2).PropertyType;
                                if (type == typeof(string))
                                {
                                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, propValue.AsString());
                                }
                                else if (type == typeof(bool))
                                {
                                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, propValue.AsBoolean());
                                }
                                else if (type == typeof(System.Int32))
                                {
                                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, Convert.ToInt32(propValue.AsNumber()));
                                }
                                else
                                {
                                    if (nameProperty2 == "parent")
                                    {
                                        propValue = FindElement(massiv[3]);
                                    }
                                    if (obj.GetType() == typeof(osdf.DfAudio) && nameProperty2 == "volume")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        string str1 = num1.ToString().TrimEnd('0');
                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
                                    }
                                    if (obj.GetType() == typeof(osdf.DfAudio) && nameProperty2 == "playbackRate")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        string str1 = num1.ToString().TrimEnd('0');
                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
                                    }		
                                    if ((obj.GetType() == typeof(osdf.DfProgress) ||
                                        obj.GetType() == typeof(osdf.DfMeter)
                                        ) && nameProperty2 == "_value")		
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ",")) * 100;
                                        string str1 = num1.ToString().TrimEnd('0');
                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
                                    }
                                    if (obj.GetType() == typeof(osdf.DfRange) && nameProperty2 == "_value")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        propValue = ValueFactory.Create(num1);
                                    }	
                                    if (obj.GetType() == typeof(osdf.DfNumberField) && nameProperty2 == "_value")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        propValue = ValueFactory.Create(num1);
                                    }	
                                    if (obj.GetType() == typeof(osdf.DfNumberField) && nameProperty2 == "step")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        propValue = ValueFactory.Create(num1);
                                    }	
                                    if (obj.GetType() == typeof(osdf.DfRange) && nameProperty2 == "step")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        propValue = ValueFactory.Create(num1);
                                    }		
                                    if (obj.GetType() == typeof(osdf.DfProgress) && nameProperty2 == "max")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ",")) * 100;
                                        string str1 = num1.ToString().TrimEnd('0');
                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
                                    }
                                    if (obj.GetType() == typeof(osdf.DfNumberField) && nameProperty2 == "max")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        propValue = ValueFactory.Create(num1);
                                    }
                                    if (obj.GetType() == typeof(osdf.DfRange) && nameProperty2 == "max")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        propValue = ValueFactory.Create(num1);
                                    }
                                    if (obj.GetType() == typeof(osdf.DfMeter) && nameProperty2 == "max")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ",")) * 100;
                                        string str1 = num1.ToString().TrimEnd('0');
                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
                                    }
                                    if (obj.GetType() == typeof(osdf.DfNumberField) && nameProperty2 == "min")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        propValue = ValueFactory.Create(num1);
                                    }
                                    if (obj.GetType() == typeof(osdf.DfRange) && nameProperty2 == "min")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ","));
                                        propValue = ValueFactory.Create(num1);
                                    }
                                    if (obj.GetType() == typeof(osdf.DfMeter) && nameProperty2 == "min")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ",")) * 100;
                                        string str1 = num1.ToString().TrimEnd('0');
                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
                                    }		
                                    if (obj.GetType() == typeof(osdf.DfMeter) && nameProperty2 == "optimum")
                                    {
                                        Decimal num1 = Decimal.Parse(massiv[3].Replace(".", ",")) * 100;
                                        string str1 = num1.ToString().TrimEnd('0');
                                        propValue = ValueFactory.Create(Decimal.Parse(str1));
                                    }		
                                    if (obj.GetType() == typeof(osdf.DfTableRow) && nameProperty2 == "rowIndex")
                                    {
                                        propValue = ValueFactory.Create(Int32.Parse(massiv[3]));
                                    }
                                    if (obj.GetType() == typeof(osdf.DfTableRow) && nameProperty2 == "sectionRowIndex")
                                    {
                                        propValue = ValueFactory.Create(Int32.Parse(massiv[3]));
                                    }		
                                    if (obj.GetType() == typeof(osdf.DfColorSelection) && nameProperty2 == "_value")
                                    {
                                        string str1 = massiv[3].Replace("#", "");
                                        int r = Convert.ToInt32(str1.Substring(0, 2), 16);
                                        int g = Convert.ToInt32(str1.Substring(2, 2), 16);
                                        int b = Convert.ToInt32(str1.Substring(4, 2), 16);
                                        propValue = ValueFactory.Create("rgb(" + r.ToString() + ", " + g.ToString() + ", " + b.ToString() + ")");
                                    }		
                                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, propValue);
                                }
                            }
                            catch (Exception ex)
                            {
                                GlobalContext().Echo("При присвоении значения свойству - посреднику = " + ex.StackTrace);
                            }
                            if (actionItemKey != "")
                            {
                                Execute((DfAction)FindElement(actionItemKey));
                            }
                            else { }
                        }
                        else
                        {
                            Sender = FindElement(nameElement);
                            DfEventArgs eventArgs = CreateEventArgs(strZapros);
                            Execute((DfAction)FindElement(nameElement).AsObject().GetPropValue(nameEvent), eventArgs);
                        }
                    }
                    catch
                    {
                        if (nameElement == "mainForm")
                        {
                            // Ничего не делаем.
                        }
                        else
                        {
                            GlobalContext().Echo("Не обработан запрос = " + strZapros);
                        }
                    }
                }
            }
            else
            {
                string resTest = "";
                try
                {
                    string[] massiv2 = massiv[0].Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
                    string nameClass = FindElement(massiv2[0]).ToString().Replace("Дф", "");

                    if (namesRusProps.ContainsKey(massiv2[1]))
                    {
                        resTest = strZapros.Replace(massiv2[0], nameClass);
                        if (resTest != "Неопределено")
                        {
                            if (!resTest.Contains("!!!"))
                            {
                                GlobalContext().Echo(resTest);
                            }
                        }
                    }
                }
                catch { }
                if (resTest.Contains("!!!"))
                {
                    GlobalContext().Echo("Ошибка1: " + resTest);
                }
            }
        }

        public DfEventArgs CreateEventArgs(string p1)
        {
            DfEventArgs DfEventArgs1 = new DfEventArgs();
            //СтрЗапроса = d3tfonn3esun|mouseup|Button=right|X=40|Y=54
            //GlobalContext().Echo("p1 = " + p1);
            string[] str1 = p1.Split(new string[] { paramDelimiter }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 2; i < str1.Length; i++)
            {
                string[] str2 = str1[i].Split(new string[] { "=" }, StringSplitOptions.RemoveEmptyEntries);
                //GlobalContext().Echo("str2[0] = " + str2[0]);
                //GlobalContext().Echo("str2[1] = " + str2[1]);

                // Здесь нужно знать какой тип значения у свойства и конвертировать из строки str2[0] в нужный тип.
                string nameProperty = "";
                System.Reflection.PropertyInfo[] myPropertyInfo = DfEventArgs1.GetType().GetProperties();
                for (int i1 = 0; i1 < myPropertyInfo.Length; i1++)
                {
                    if (myPropertyInfo[i1].CustomAttributes.Count() == 1)
                    {
                        string methodRus1 = myPropertyInfo[i1].GetCustomAttribute<ContextPropertyAttribute>().GetName();
                        string methodEn1 = myPropertyInfo[i1].GetCustomAttribute<ContextPropertyAttribute>().GetAlias();

                        if (methodRus1 == str2[0] || methodEn1 == str2[0])
                        {
                            nameProperty = methodEn1;
                            break;
                        }
                    }
                }
                string propertyType;
                try
                {
                    propertyType = ((dynamic)Sender).GetType().GetProperty(nameProperty).PropertyType.ToString();
                }
                catch
                {
                    propertyType = DfEventArgs1.GetType().GetProperty(nameProperty).PropertyType.ToString();
                }

                try
                {
                    IValue propValue;
                    if (propertyType == "System.Int32")
                    {
                        Decimal num1 = Decimal.Parse(str2[1].Replace(".", ","));
                        propValue = ValueFactory.Create(Convert.ToInt32(num1));
                    }
                    else if (propertyType == "ScriptEngine.HostedScript.Library.ArrayImpl")
                    {
                        ArrayImpl ArrayImpl1 = new ArrayImpl();
                        string[] s = str2[1].Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                        for (int i1 = 0; i1 < s.Length; i1++)
                        {
                            if (FindElement(s[i1]) != null)
                            {
                                ArrayImpl1.Add(FindElement(s[i1]));
                            }
                            else
                            {
                                ArrayImpl1.Add(ValueFactory.Create(s[i1]));
                            }
                        }
                        propValue = ArrayImpl1;
                    }		
                    else if (propertyType == "System.Boolean")
                    {
                        propValue = ValueFactory.Create(Boolean.Parse(str2[1]));
                    }		
                    else
                    {
                        propValue = ValueFactory.Create(str2[1]);
                    }

                    // Здесь нужно преобразовать общее для многих свойство АргументыСобытия.Значение (EventArgs.Value)
                    // из типа данных ScriptEngine.Machine.IValue в тип данных свойства Value данного объекта.
                    if (Sender.GetType() == typeof(osdf.DfRange) ||
                        Sender.GetType() == typeof(osdf.DfNumberField)
                        )
                    {
                        Decimal num1 = Decimal.Parse(str2[1].Replace(".", ","));
                        propValue = ValueFactory.Create(num1);
                    }
                    if (Sender.GetType() == typeof(osdf.DfCheckBox))
                    {
                        ((DfCheckBox)Sender)._checked = propValue.AsBoolean();
                        DfEventArgs1.SetPropValue(DfEventArgs1.FindProperty(str2[0]), propValue);
                    }
                    else
                    {
                        DfEventArgs1.SetPropValue(DfEventArgs1.FindProperty(str2[0]), propValue);
                    }
                }
                catch (Exception ex)
                {
                    GlobalContext().Echo("При изменении значения свойства отправителя = " + ex.StackTrace);
                }

                // Изменим и значение свойства объекта.
                try
                {
                    // Присваивать значение будем свойству - посреднику.
                    string nameProperty2 = namesRusProps[str2[0]][2].ToString();
                    dynamic obj = (dynamic)Sender;
                    string propertyType2 = Sender.GetType().GetProperty(nameProperty2).PropertyType.ToString();
                    dynamic propValue2;
                    if (propertyType == "System.Int32")
                    {
                        Decimal num1 = Decimal.Parse(str2[1].Replace(".", ","));
                        propValue2 = Convert.ToInt32(num1);
                    }
                    else if (propertyType == "ScriptEngine.HostedScript.Library.ArrayImpl")
                    {
                        ArrayImpl ArrayImpl1 = new ArrayImpl();
                        string[] s = str2[1].Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
                        for (int i1 = 0; i1 < s.Length; i1++)
                        {
                            if (FindElement(s[i1]) != null)
                            {
                                ArrayImpl1.Add(FindElement(s[i1]));
                            }
                            else
                            {
                                ArrayImpl1.Add(ValueFactory.Create(s[i1]));
                            }
                        }
                        propValue2 = ArrayImpl1;
                    }
                    else if (propertyType == "System.Boolean")
                    {
                        propValue2 = Boolean.Parse(str2[1]);
                    }
                    else if (Sender.GetType() == typeof(osdf.DfRange) ||
                        Sender.GetType() == typeof(osdf.DfNumberField)
                        )
                    {
                        Decimal num1 = Decimal.Parse(str2[1].Replace(".", ","));
                        propValue2 = ValueFactory.Create(num1);
                    }		
                    else if (propertyType == "ScriptEngine.Machine.IValue")
                    {
                        propValue2 = ValueFactory.Create(str2[1]);
                    }
                    else
                    {
                        propValue2 = str2[1];
                    }
                    obj.GetType().GetProperty(nameProperty2).SetValue(obj, propValue2);
                }
                catch (Exception)
                {
                    //GlobalContext().Echo("При изменении значения свойства объекта = " + ex.StackTrace);
                }
            }
            return DfEventArgs1;
        }

        [ContextMethod("Выполнить", "Execute")]
        public IValue Execute(DfAction p1, DfEventArgs p2 = null)
        {
            if (p2 != null)
            {
                eventArgs = p2;
            }
            else
            {
                eventArgs = new DfEventArgs();
            }
            eventArgs.Parameter = p1.Parameter;
            eventArgs.Sender = Sender;

            DfAction Action1 = p1;
            IRuntimeContextInstance script = Action1.Script;
            string method = Action1.MethodName;
            ReflectorContext reflector = new ReflectorContext();
            IValue res = ValueFactory.Create();
            try
            {
                res = reflector.CallMethod(script, method, null);
            }
            catch (Exception ex)
            {
                GlobalContext().Echo("Ошибка2: " + ex.Message);
            }
            return res;
        }
		
        public static void WebServerSendText(string p1)
        {
            osws.WebServerSendDeclarForms.WebServer.SendText(p1);
        }		
		
        [ContextMethod("ПолучитьСвойство", "GetObjectProperty")]
        public void GetObjectProperty(IValue p1, string p2, DfAction p3)
        {
            string itemKeyObj;
            string resObj;
            string function1 = "";
            string enPropName = (string)namesRusProps[p2][2];
            bool notStyle = (bool)namesRusProps[p2][1];
            if ((p1.GetType() == typeof(osdf.DfTimeSelection) ||   
                p1.GetType() == typeof(osdf.DfDateSelection) || 
                p1.GetType() == typeof(osdf.DfDateTimeLocalSelection) || 
                p1.GetType() == typeof(osdf.DfMonthSelection) || 
                p1.GetType() == typeof(osdf.DfWeekSelection) || 
                p1.GetType() == typeof(osdf.DfColorSelection) || 
                p1.GetType() == typeof(osdf.DfProgress) ||	
                p1.GetType() == typeof(osdf.DfTextArea) ||		
                p1.GetType() == typeof(osdf.DfRadio) ||		
                p1.GetType() == typeof(osdf.DfPasswordField) ||		
                p1.GetType() == typeof(osdf.DfSearchField) ||		
                p1.GetType() == typeof(osdf.DfSelect) ||		
                p1.GetType() == typeof(osdf.DfTextField) ||		
                p1.GetType() == typeof(osdf.DfNumberField) ||		
                p1.GetType() == typeof(osdf.DfRange) ||		
                p1.GetType() == typeof(osdf.DfOutput) ||		
                p1.GetType() == typeof(osdf.DfCheckBox) ||		
                p1.GetType() == typeof(osdf.DfMeter) ||		
                p1.GetType() == typeof(osdf.DfSelectItem) ||
                p1.GetType() == typeof(osdf.DfDateTimeSelection)
                ) && p2 == "Значение")
            {
                itemKeyObj = ((dynamic)p1).ItemKey;
                resObj = "el['value'];";
            }
            else if (p1.GetType() == typeof(osdf.DfTextArea) && p2 == "Текст")
            {
                itemKeyObj = ((dynamic)p1).ItemKey;
                resObj = "el['value'];";
            }
            else if ((p1.GetType() == typeof(osdf.DfImage) ||
                p1.GetType() == typeof(osdf.DfArea)
                ) && p2 == "Описание")
            {
                itemKeyObj = ((dynamic)p1).ItemKey;
                resObj = "el['аlt'];";
            }		
            else if ((p1.GetType() == typeof(osdf.DfRadio) ||
                p1.GetType() == typeof(osdf.DfCheckBox)
                ) && p2 == "Помечен")		
            {
                itemKeyObj = ((dynamic)p1).ItemKey;
                resObj = "el['checked'];";
            }		
            else if ((p1.GetType() == typeof(osdf.DfImage) ||
                p1.GetType() == typeof(osdf.DfCanvas)
                ) && p2 == "Высота")
            {
                itemKeyObj = ((dynamic)p1).ItemKey;
                resObj = "el['height'];";
            }
            else if ((p1.GetType() == typeof(osdf.DfImage) ||
                p1.GetType() == typeof(osdf.DfCanvas)
                ) && p2 == "Ширина")
            {
                itemKeyObj = ((dynamic)p1).ItemKey;
                resObj = "el['width'];";
            }		
            else if (p1.GetType() == typeof(osdf.DfStyle) && p2 == "Позиция")
            {
                itemKeyObj = ((dynamic)p1).Owner.ItemKey;
                resObj = "el.style['position'];";
                notStyle = false;
            }		
            else if (notStyle)
            {
                itemKeyObj = ((dynamic)p1).ItemKey;
                resObj = "el['" + enPropName + "'];";
            }
            else
            {
                itemKeyObj = ((dynamic)p1).Owner.ItemKey;
                resObj = "el.style['" + enPropName + "'];";
            }

            if (enPropName == "parent")
            {
                function1 = "" +
                    "let res;" +
                    "let el = mapKeyEl.get('" + itemKeyObj + "');" +
                    "try" +
                    "{" +
                    "    if (el.parentElement == document.body)" +
                    "    {" +
                    "        res = 'mainForm';" +
                    "    }" +
                    "    else" +
                    "    {" +
                    "        res = mapElKey.get(el.parentElement);" +
                    "    }" +
                    "    sendPost(" +
                    "    '" + ((dynamic)p1).ItemKey + "' +" +
                    "    '" + paramDelimiter + "' + 'v5v5v" + p3.ItemKey + "' +" +
                    "    '" + paramDelimiter + "' + '" + p2 + "' +" +
                    "    '" + paramDelimiter + "' + res +" +
                    "    '" + paramDelimiter + "' + '" + notStyle.ToString().ToLower() + "');" +
                    "}" +
                    "catch (err)" +
                    "{" +
                    "    sendPost('!!! Ошибка3:' + err.message);" +
                    "}" +
                    "";
            }
            else if (notStyle)
            {
                if (p1.GetType() == typeof(osdf.DfTextArea) && p2 == "Строки")
                {
                    function1 = "" +
                        "let res;" +
                        "let el = mapKeyEl.get('" + itemKeyObj + "');" +
                        "try" +
                        "{" +
                        "    {" +
                        "        res = " + resObj +
                        "    }" +
                        "    sendPost(" +
                        "    '" + ((dynamic)p1).ItemKey + "' +" +
                        "    '" + paramDelimiter + "' + 'v5v5v" + p3.ItemKey + "' +" +
                        "    '" + paramDelimiter + "' + '" + p2 + "' +" +
                        "    '" + paramDelimiter + "' + res +" +
                        "    '" + paramDelimiter + "' + true);" +
                        "}" +
                        "catch (err)" +
                        "{" +
                        "    sendPost('!!! Ошибка3:' + err.message);" +
                        "}" +
                        "";
                }
                else
                {
                    function1 = "" +
                        "let res;" +
                        "let el = mapKeyEl.get('" + itemKeyObj + "');" +
                        "try" +
                        "{" +

                        "    if ('" + enPropName + "' == 'class')" +
                        "    {" +
                        "        res = el['className'];" +
                        "    }" +
                        "    else if ('" + enPropName + "' == 'tFoot')" +
                        "    {" +
                        "        let tFoot = el['tFoot'];" +
                        "        res = mapElKey.get(tFoot);" +
                        "    }" +
                        "    else if ('" + enPropName + "' == 'tHead')" +
                        "    {" +
                        "        let tHead = el['tHead'];" +
                        "        res = mapElKey.get(tHead);" +
                        "    }" +
                        "    else if ('" + enPropName + "' == 'areas')" +
                        "    {" +
                        "        res = '';" +
                        "        if (el.areas.length > 0)" +
                        "        {" +
                        "            for (var i = 0; i < el.areas.length; i++)" +
                        "            {" +
                        "                res = res + mapElKey.get(el.areas[i]) + ';';" +
                        "            }" +
                        "        }" +
                        "    }" +
                        "    else if ('" + enPropName + "' == 'cells')" +
                        "    {" +
                        "        res = '';" +
                        "        if (el.cells.length > 0)" +
                        "        {" +
                        "            for (var i = 0; i < el.cells.length; i++)" +
                        "            {" +
                        "                res = res + mapElKey.get(el.cells[i]) + ';';" +
                        "            }" +
                        "        }" +
                        "    }" +
                        "    else if ('" + enPropName + "' == 'rows')" +
                        "    {" +
                        "        res = '';" +
                        "        if (el.rows.length > 0)" +
                        "        {" +
                        "            for (var i = 0; i < el.rows.length; i++)" +
                        "            {" +
                        "                res = res + mapElKey.get(el.rows[i]) + ';';" +
                        "            }" +
                        "        }" +
                        "    }" +
                        "    else if ('" + enPropName + "' == 'tBodies')" +
                        "    {" +
                        "        res = '';" +
                        "        if (el.tBodies.length > 0)" +
                        "        {" +
                        "            for (var i = 0; i < el.tBodies.length; i++)" +
                        "            {" +
                        "                res = res + mapElKey.get(el.tBodies[i]) + ';';" +
                        "            }" +
                        "        }" +
                        "    }" +
                        "    else if ('" + enPropName + "' == 'options')" +
                        "    {" +
                        "        res = '';" +
                        "        if (el.options.length > 0)" +
                        "        {" +
                        "            for (var i = 0; i < el.options.length; i++)" +
                        "            {" +
                        "                res = res + mapElKey.get(el.options[i]) + ';';" +
                        "            }" +
                        "        }" +
                        "    }" +
                        "    else" +
                        "    {" +
                        "        res = " + resObj +
                        "    }" +

                        "    sendPost(" +
                        "    '" + ((dynamic)p1).ItemKey + "' +" +
                        "    '" + paramDelimiter + "' + 'v5v5v" + p3.ItemKey + "' +" +
                        "    '" + paramDelimiter + "' + '" + p2 + "' +" +
                        "    '" + paramDelimiter + "' + res +" +
                        "    '" + paramDelimiter + "' + true);" +
                        "}" +
                        "catch (err)" +
                        "{" +
                        "    sendPost('!!! Ошибка3:' + err.message);" +
                        "}" +
                        "";
                }
            }
            else
            {
                function1 = "" +
                    "let res;" +
                    "let el = mapKeyEl.get('" + itemKeyObj + "');" +
                    "try" +
                    "{" +

                    "    res = " + resObj +

                    "    sendPost(" +
                    "    '" + ((dynamic)p1).ItemKey + "' +" +
                    "    '" + paramDelimiter + "' + 'v5v5v" + p3.ItemKey + "' +" +
                    "    '" + paramDelimiter + "' + '" + p2 + "' +" +
                    "    '" + paramDelimiter + "' + res +" +
                    "    '" + paramDelimiter + "' + false);" +
                    "}" +
                    "catch (err)" +
                    "{" +
                    "    sendPost('!!! Ошибка3:' + err.message);" +
                    "}" +
                    "";
            }
            function1 = function1.Replace("    ", " ").Replace("  ", " ");

            if (isWin)
            {
                //WebServerSendText(function1);
                DeclarativeForms.SendStrFunc(function1); // А может так?
                // Здесь поставим задержку для формирования формой ответа.
                System.Threading.Thread.Sleep(100);		
            }
            else
            {
                SendStrFunc(function1);
            }
        }

        public static dynamic DefineTypeIValue(dynamic p1)
        {
            if (p1.GetType() == typeof(ScriptEngine.Machine.Values.StringValue))
            {
                return p1.AsString();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.NumberValue))
            {
                return p1.AsNumber();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.BooleanValue))
            {
                return p1.AsBoolean();
            }
            else if (p1.GetType() == typeof(ScriptEngine.Machine.Values.DateValue))
            {
                return p1.AsDate();
            }
            else
            {
                return p1;
            }
        }

        public static dynamic GetEventParameter(dynamic dll_objEvent)
        {
            if (dll_objEvent != null)
            {
                dynamic eventType = dll_objEvent.GetType();
                if (eventType == typeof(DelegateAction))
                {
                    return null;
                }
                else if (eventType == typeof(DfAction))
                {
                    return ((DfAction)dll_objEvent).Parameter;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        public static string ParseBetween(string p1, string p2 = null, string p3 = null)
        {
            //p1 - исходная строка
            //p2 - подстрока поиска от которой ведем поиск
            //p3 - подстрока поиска до которой ведем поиск
            //возвращает строку, ограниченную p2 и p3
            string str1 = p1;
            int Position1;
            if (p2 != null && p3 == null)
            {
                Position1 = str1.IndexOf(p2);
                if (Position1 >= 0)
                {
                    return str1.Substring(Position1 + p2.Length);
                }
            }
            else if (p2 == null && p3 != null)
            {
                Position1 = str1.IndexOf(p3) + 1;
                if (Position1 > 0)
                {
                    return str1.Substring(0, Position1 - 1);
                }
            }
            else if (p2 != null && p3 != null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    string Стр2;
                    Стр2 = str1.Substring(Position1 + p2.Length);
                    int Position2 = Стр2.IndexOf(p3) + 1;
                    int SumPosition2 = Position2;
                    while (Position2 > 0)
                    {
                        if (Стр2.Substring(0, SumPosition2 - 1).IndexOf(p3) <= -1)
                        {
                            return Стр2.Substring(0, SumPosition2 - 1);
                        }
                        try
                        {
                            Position2 = Стр2.Substring(SumPosition2 + 1).IndexOf(p3) + 1;
                            SumPosition2 = SumPosition2 + Position2 + 1;
                        }
                        catch
                        {
                            break;
                        }
                    }
                    str1 = str1.Substring(Position1 + 1);
                    Position1 = str1.IndexOf(p2);
                }
            }
            return null;
        }

        public static DfArrayList StrFindBetween(string p1, string p2 = null, string p3 = null, bool p4 = true, bool p5 = true)
        {
            //p1 - исходная строка
            //p2 - подстрока поиска от которой ведем поиск
            //p3 - подстрока поиска до которой ведем поиск
            //p4 - не включать p2 и p3 в результат
            //p5 - в результат не будут включены участки, содержащие другие найденные участки, удовлетворяющие переданным параметрам
            //функция возвращает массив строк
            string str1 = p1;
            int Position1;
            DfArrayList DfArrayList1 = new DfArrayList();
            if (p2 != null && p3 == null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    DfArrayList1.Add(ValueFactory.Create("" + ((p4) ? str1.Substring(Position1 + p2.Length) : str1.Substring(Position1))));
                    str1 = str1.Substring(Position1 + 1);
                    Position1 = str1.IndexOf(p2);
                }
            }
            else if (p2 == null && p3 != null)
            {
                Position1 = str1.IndexOf(p3) + 1;
                int SumPosition1 = Position1;
                while (Position1 > 0)
                {
                    DfArrayList1.Add(ValueFactory.Create("" + ((p4) ? str1.Substring(0, SumPosition1 - 1) : str1.Substring(0, SumPosition1 - 1 + p3.Length))));
                    try
                    {
                        Position1 = str1.Substring(SumPosition1 + 1).IndexOf(p3) + 1;
                        SumPosition1 = SumPosition1 + Position1 + 1;
                    }
                    catch
                    {
                        break;
                    }
                }
            }
            else if (p2 != null && p3 != null)
            {
                Position1 = str1.IndexOf(p2);
                while (Position1 >= 0)
                {
                    string Стр2;
                    Стр2 = (p4) ? str1.Substring(Position1 + p2.Length) : str1.Substring(Position1);
                    int Position2 = Стр2.IndexOf(p3) + 1;
                    int SumPosition2 = Position2;
                    while (Position2 > 0)
                    {
                        if (p5)
                        {
                            if (Стр2.Substring(0, SumPosition2 - 1).IndexOf(p3) <= -1)
                            {
                                DfArrayList1.Add(ValueFactory.Create("" + ((p4) ? Стр2.Substring(0, SumPosition2 - 1) : Стр2.Substring(0, SumPosition2 - 1 + p3.Length))));
                            }
                        }
                        else
                        {
                            DfArrayList1.Add(ValueFactory.Create("" + ((p4) ? Стр2.Substring(0, SumPosition2 - 1) : Стр2.Substring(0, SumPosition2 - 1 + p3.Length))));
                        }
                        try
                        {
                            Position2 = Стр2.Substring(SumPosition2 + 1).IndexOf(p3) + 1;
                            SumPosition2 = SumPosition2 + Position2 + 1;
                        }
                        catch
                        {
                            break;
                        }
                    }
                    str1 = str1.Substring(Position1 + 1);
                    Position1 = str1.IndexOf(p2);
                }
            }
            return DfArrayList1;
        }

        // Для метода Добавить класса DfFrames. Имена свойств и атрибутов.
        public static Dictionary<string, object[]> namesStyleProps = new Dictionary<string, object[]>
        {
            //object[0] Имя как в справке - HorizontalTextAlign
            //object[1] Имя как в js (горбатый стиль)- style['textAlign']
            //object[2] Имя скрытого поля в стиле (private string horizontalTextAlign) - horizontalTextAlign
            //object[3] Имя как в css(через тире)- text-align
            {"Анимация", new object[4] { "Animation", "animation", "Animation", "animation" } },
            {"БазоваяДлина", new object[4] { "FlexBasis", "flexBasis", "flexBasis", "flex-basis" } },
            {"ВариантШрифта", new object[4] { "FontVariant", "fontVariant", "fontVariant", "font-variant" } },
            {"ВертикальноеВыравнивание", new object[4] { "VerticalAlign", "verticalAlign", "verticalAlign", "vertical-align" } },
            {"Верх", new object[4] { "Top", "top", "top", "top" } },
            {"ВерхняяГраница", new object[4] { "BorderTop", "borderTop", "borderTop", "border-top" } },
            {"Видимость", new object[4] { "Visibility", "visibility", "visibility", "visibility" } },
            {"ВписываниеОбъекта", new object[4] { "ObjectFit", "objectFit", "objectFit", "object-fit" } },
            {"ВремяПерехода", new object[4] { "TransitionDuration", "transitionDuration", "transitionDuration", "transition-duration" } },
            {"ВыделениеПользователем", new object[4] { "UserSelect", "userSelect", "userSelect", "user-select" } },
            {"ВыравниваниеОтдельных", new object[4] { "AlignSelf", "alignSelf", "alignSelf", "align-self" } },
            {"ВыравниваниеСодержимого", new object[4] { "AlignContent", "alignContent", "alignContent", "align-content" } },
            {"ВыравниваниеЭлементов", new object[4] { "AlignItems", "alignItems", "alignItems", "align-items" } },
            {"Высота", new object[4] { "Height", "height", "height", "height" } },
            {"ВысотаСтроки", new object[4] { "LineHeight", "lineHeight", "lineHeight", "line-height" } },
            {"Гибкость", new object[4] { "Flex", "flex", "flex", "flex" } },
            {"ГоризонтальноеВыравнивание", new object[4] { "CssFloat", "cssFloat", "cssFloat", "css-float" } },
            {"ГоризонтальноеВыравниваниеТекста", new object[4] { "HorizontalTextAlign", "textAlign", "horizontalTextAlign", "text-align" } },/////////////////////////////////////////////////
            {"ГраницаСвернута", new object[4] { "BorderCollapse", "borderCollapse", "borderCollapse", "border-collapse" } },
            {"Границы", new object[4] { "Borders", "border", "borders", "border" } },///////////////////////////////////////////////////////////////////////////////////////////////////////
            {"ДиапазонКолонокЭлемента", new object[4] { "ColumnSpan", "columnSpan", "columnSpan", "column-span" } },
            {"ДлинаТабуляции", new object[4] { "TabSize", "tabSize", "tabSize", "tab-size" } },
            {"ДлительностьАнимации", new object[4] { "AnimationDuration", "animationDuration", "animationDuration", "animation-duration" } },
            {"ЖирностьШрифта", new object[4] { "FontWeight", "fontWeight", "fontWeight", "font-weight" } },
            {"ЗадержкаАнимации", new object[4] { "AnimationDelay", "animationDelay", "animationDelay", "animation-delay" } },
            {"ЗадержкаПерехода", new object[4] { "TransitionDelay", "transitionDelay", "transitionDelay", "transition-delay" } },
            {"ЗаливкаАнимации", new object[4] { "AnimationFillMode", "animationFillMode", "animationFillMode", "animation-fill-mode" } },
            {"Заполнение", new object[4] { "Padding", "padding", "padding", "padding" } },
            {"ЗаполнениеКолонок", new object[4] { "ColumnFill", "columnFill", "columnFill", "column-fill" } },
            {"ЗаполнениеСверху", new object[4] { "PaddingTop", "paddingTop", "paddingTop", "padding-top" } },
            {"ЗаполнениеСлева", new object[4] { "PaddingLeft", "paddingLeft", "paddingLeft", "padding-left" } },
            {"ЗаполнениеСнизу", new object[4] { "PaddingBottom", "paddingBottom", "paddingBottom", "padding-bottom" } },
            {"ЗаполнениеСправа", new object[4] { "PaddingRight", "paddingRight", "paddingRight", "padding-right" } },
            {"Значок", new object[4] { "Icon", "icon", "icon", "icon" } },
            {"ИзменяемыйРазмер", new object[4] { "Resize", "resize", "resize", "resize" } },
            {"ИмяАнимации", new object[4] { "AnimationName", "animationName", "animationName", "animation-name" } },
            {"ИнтервалГраницы", new object[4] { "BorderSpacing", "borderSpacing", "borderSpacing", "border-spacing" } },
            {"ИнтервалКолонок", new object[4] { "ColumnGap", "columnGap", "columnGap", "column-gap" } },
            {"ИнтервалСимволов", new object[4] { "LetterSpacing", "letterSpacing", "letterSpacing", "letter-spacing" } },
            {"ИнтервалСлов", new object[4] { "WordSpacing", "wordSpacing", "wordSpacing", "word-spacing" } },
            {"ИсточникПерспективы", new object[4] { "PerspectiveOrigin", "perspectiveOrigin", "perspectiveOrigin", "perspective-origin" } },
            {"Калибровка", new object[4] { "BoxSizing", "boxSizing", "boxSizing", "box-sizing" } },
            {"КартинкаГраницы", new object[4] { "BorderImage", "borderImage", "borderImage", "border-image" } },
            {"КартинкаСтиляСписка", new object[4] { "ListStyleImage", "listStyleImage", "listStyleImage", "list-style-image" } },
            {"КоличествоКолонок", new object[4] { "ColumnCount", "columnCount", "columnCount", "column-count" } },
            {"КоличествоПовторов", new object[4] { "AnimationIterationCount", "animationIterationCount", "animationIterationCount", "animation-iteration-count" } },
            {"КолонкиЭлемента", new object[4] { "Columns", "columns", "columns", "columns" } },
            {"Контур", new object[4] { "Outline", "outline", "outline", "outline" } },
            {"Курсор", new object[4] { "Cursor", "cursor", "cursor", "cursor" } },
            {"ЛеваяГраница", new object[4] { "BorderLeft", "borderLeft", "borderLeft", "border-left" } },
            {"Лево", new object[4] { "Left", "left", "left", "left" } },
            {"ЛевыйРадиусВерхнейГраницы", new object[4] { "BorderTopLeftRadius", "borderTopLeftRadius", "borderTopLeftRadius", "border-top-left-radius" } },
            {"ЛевыйРадиусНижнейГраницы", new object[4] { "BorderBottomLeftRadius", "borderBottomLeftRadius", "borderBottomLeftRadius", "border-bottom-left-radius" } },
            {"МаксимальнаяВысота", new object[4] { "MaxHeight", "maxHeight", "maxHeight", "max-height" } },
            {"МаксимальнаяШирина", new object[4] { "MaxWidth", "maxWidth", "maxWidth", "max-width" } },
            {"МинимальнаяВысота", new object[4] { "MinHeight", "minHeight", "minHeight", "min-height" } },
            {"МинимальнаяШирина", new object[4] { "MinWidth", "minWidth", "minWidth", "min-width" } },
            {"МозаикаКартинки", new object[4] { "BackgroundRepeat", "backgroundRepeat", "backgroundRepeat", "background-repeat" } },
            {"НаправлениеАнимации", new object[4] { "AnimationDirection", "animationDirection", "animationDirection", "animation-direction" } },
            {"НаправлениеЭлементов", new object[4] { "FlexDirection", "flexDirection", "flexDirection", "flex-direction" } },
            {"Непрозрачность", new object[4] { "Opacity", "opacity", "opacity", "opacity" } },
            {"Несвободно", new object[4] { "Clear", "clear", "clear", "clear" } },
            {"НижняяГраница", new object[4] { "BorderBottom", "borderBottom", "borderBottom", "border-bottom" } },
            {"Низ", new object[4] { "Bottom", "bottom", "bottom", "bottom" } },
            {"ОбластьКартинки", new object[4] { "BackgroundOrigin", "backgroundOrigin", "backgroundOrigin", "background-origin" } },
            {"ОбластьРисования", new object[4] { "BackgroundClip", "backgroundClip", "backgroundClip", "background-clip" } },
            {"Обрезка", new object[4] { "Clip", "clip", "clip", "clip" } },
            {"Отображать", new object[4] { "Display", "display", "display", "display" } },
            {"Отступ", new object[4] { "Margin", "margin", "margin", "margin" } },
            {"ОтступСверху", new object[4] { "MarginTop", "marginTop", "marginTop", "margin-top" } },
            {"ОтступСлева", new object[4] { "MarginLeft", "marginLeft", "marginLeft", "margin-left" } },
            {"ОтступСнизу", new object[4] { "MarginBottom", "marginBottom", "marginBottom", "margin-bottom" } },
            {"ОтступСправа", new object[4] { "MarginRight", "marginRight", "marginRight", "margin-right" } },
            {"ОтступТекста", new object[4] { "TextIndent", "textIndent", "textIndent", "text-indent" } },
            {"ОформлениеТекстаЛиния", new object[4] { "TextDecorationLine", "textDecorationLine", "textDecorationLine", "text-decoration-line" } },
            {"ОформлениеТекстаСтиль", new object[4] { "TextDecorationStyle", "textDecorationStyle", "textDecorationStyle", "text-decoration-style" } },
            {"ОформлениеТекстаЦвет", new object[4] { "TextDecorationColor", "textDecorationColor", "textDecorationColor", "text-decoration-color" } },
            {"ПереносГибких", new object[4] { "FlexWrap", "flexWrap", "flexWrap", "flex-wrap" } },
            {"ПереносСлов", new object[4] { "WordWrap", "wordWrap", "wordWrap", "word-wrap" } },
            {"Переполнение", new object[4] { "Overflow", "overflow", "overflow", "overflow" } },
            {"ПереполнениеИгрек", new object[4] { "OverflowY", "overflowY", "overflowY", "overflow-y" } },
            {"ПереполнениеИкс", new object[4] { "OverflowX", "overflowX", "overflowX", "overflow-x" } },
            {"ПереполнениеТекста", new object[4] { "TextOverflow", "textOverflow", "textOverflow", "text-overflow" } },
            {"Переход", new object[4] { "Transition", "transition", "transition", "transition" } },
            {"Перспектива", new object[4] { "Perspective", "perspective", "perspective", "perspective" } },
            {"Позиция", new object[4] { "Position", "position", "position", "position" } },
            {"ПозицияОбъекта", new object[4] { "ObjectPosition", "objectPosition", "objectPosition", "object-position" } },
            {"ПозицияСтиляСписка", new object[4] { "ListStylePosition", "listStylePosition", "listStylePosition", "list-style-position" } },
            {"ПоложениеЗаголовка", new object[4] { "CaptionSide", "captionSide", "captionSide", "caption-side" } },
            {"ПоложениеКартинки", new object[4] { "BackgroundPosition", "backgroundPosition", "backgroundPosition", "background-position" } },
            {"Порядок", new object[4] { "Order", "order", "order", "order" } },
            {"ПраваяГраница", new object[4] { "BorderRight", "borderRight", "borderRight", "border-right" } },
            {"Право", new object[4] { "Right", "right", "right", "right" } },
            {"ПравыйРадиусВерхнейГраницы", new object[4] { "BorderTopRightRadius", "borderTopRightRadius", "borderTopRightRadius", "border-top-right-radius" } },
            {"ПравыйРадиусНижнейГраницы", new object[4] { "BorderBottomRightRadius", "borderBottomRightRadius", "borderBottomRightRadius", "border-bottom-right-radius" } },
            {"Пробелы", new object[4] { "WhiteSpace", "whiteSpace", "whiteSpace", "white-space" } },
            {"ПрописныеТекста", new object[4] { "TextTransform", "textTransform", "textTransform", "text-transform" } },
            {"ПустыеЯчейки", new object[4] { "EmptyCells", "emptyCells", "emptyCells", "empty-cells" } },
            {"РадиусГраницы", new object[4] { "BorderRadius", "borderRadius", "borderRadius", "border-radius" } },
            {"РазделительКолонок", new object[4] { "ColumnRule", "columnRule", "columnRule", "column-rule" } },
            {"РазмерКартинки", new object[4] { "BackgroundSize", "backgroundSize", "backgroundSize", "background-size" } },
            {"РазмерШрифта", new object[4] { "FontSize", "fontSize", "fontSize", "font-size" } },
            {"РазмещениеВТаблице", new object[4] { "TableLayout", "tableLayout", "tableLayout", "table-layout" } },
            {"РасположениеСодержимого", new object[4] { "JustifyContent", "justifyContent", "justifyContent", "justify-content" } },
            {"СвойствоПерехода", new object[4] { "TransitionProperty", "transitionProperty", "transitionProperty", "transition-property" } },
            {"Сдвиг", new object[4] { "Transform", "transform", "transform", "transform" } },
            {"СемействоШрифтов", new object[4] { "FontFamily", "fontFamily", "fontFamily", "font-family" } },
            {"Смещение", new object[4] { "Offset", "offset", "offset", "offset" } },
            {"СмещениеКонтура", new object[4] { "OutlineOffset", "outlineOffset", "outlineOffset", "outline-offset" } },
            {"Состояние", new object[4] { "AnimationPlayState", "animationPlayState", "animationPlayState", "animation-play-state" } },
            {"СтильВерхнейГраницы", new object[4] { "BorderTopStyle", "borderTopStyle", "borderTopStyle", "border-top-style" } },
            {"СтильГраниц", new object[4] { "BordersStyle", "borderStyle", "bordersStyle", "border-style" } },//////////////////////////////////////////////////////////////////////////
            {"СтильКонтура", new object[4] { "OutlineStyle", "outlineStyle", "outlineStyle", "outline-style" } },
            {"СтильЛевойГраницы", new object[4] { "BorderLeftStyle", "borderLeftStyle", "borderLeftStyle", "border-left-style" } },
            {"СтильНижнейГраницы", new object[4] { "BorderBottomStyle", "borderBottomStyle", "borderBottomStyle", "border-bottom-style" } },
            {"СтильПравойГраницы", new object[4] { "BorderRightStyle", "borderRightStyle", "borderRightStyle", "border-right-style" } },
            {"СтильРазделителяКолонок", new object[4] { "ColumnRuleStyle", "columnRuleStyle", "columnRuleStyle", "column-rule-style" } },
            {"СтильСдвига", new object[4] { "TransformStyle", "transformStyle", "transformStyle", "transform-style" } },
            {"СтильСписка", new object[4] { "ListStyle", "listStyle", "listStyle", "list-style" } },
            {"СтильШрифта", new object[4] { "FontStyle", "fontStyle", "fontStyle", "font-style" } },
            {"Тень", new object[4] { "BoxShadow", "boxShadow", "boxShadow", "box-shadow" } },
            {"ТеньТекста", new object[4] { "TextShadow", "textShadow", "textShadow", "text-shadow" } },
            {"ТипСтиляСписка", new object[4] { "ListStyleType", "listStyleType", "listStyleType", "list-style-type" } },
            {"ТочкаСдвига", new object[4] { "TransformOrigin", "transformOrigin", "transformOrigin", "transform-origin" } },
            {"Увеличение", new object[4] { "FlexGrow", "flexGrow", "flexGrow", "flex-grow" } },
            {"Уменьшение", new object[4] { "FlexShrink", "flexShrink", "flexShrink", "flex-shrink" } },
            {"Фильтр", new object[4] { "Filter", "filter", "filter", "filter" } },
            {"ФоновоеВложение", new object[4] { "BackgroundAttachment", "backgroundAttachment", "backgroundAttachment", "background-attachment" } },
            {"ФоновоеИзображение", new object[4] { "BackgroundImage", "backgroundImage", "backgroundImage", "background-image" } },
            {"ФункцияПерехода", new object[4] { "TransitionTimingFunction", "transitionTimingFunction", "transitionTimingFunction", "transition-timing-function" } },
            {"ФункцияСинхронизации", new object[4] { "AnimationTimingFunction", "animationTimingFunction", "animationTimingFunction", "animation-timing-function" } },
            {"ЦветВерхнейГраницы", new object[4] { "BorderTopColor", "borderTopColor", "borderTopColor", "border-top-color" } },
            {"ЦветГраниц", new object[4] { "BordersColor", "borderColor", "bordersColor", "border-color" } },//////////////////////////////////////////////////////////////////////////
            {"ЦветКонтура", new object[4] { "OutlineColor", "outlineColor", "outlineColor", "outline-color" } },
            {"ЦветКурсора", new object[4] { "CaretColor", "caretColor", "caretColor", "caret-color" } },
            {"ЦветЛевойГраницы", new object[4] { "BorderLeftColor", "borderLeftColor", "borderLeftColor", "border-left-color" } },
            {"ЦветНижнейГраницы", new object[4] { "BorderBottomColor", "borderBottomColor", "borderBottomColor", "border-bottom-color" } },
            {"ЦветПравойГраницы", new object[4] { "BorderRightColor", "borderRightColor", "borderRightColor", "border-right-color" } },
            {"ЦветРазделителяКолонок", new object[4] { "ColumnRuleColor", "columnRuleColor", "columnRuleColor", "column-rule-color" } },
            {"ЦветТекста", new object[4] { "TextColor", "color", "textColor", "color" } }, //////////////////////////////////////////////////////////////////////////////////////////
            {"ЦветФона", new object[4] { "BackgroundColor", "backgroundColor", "backgroundColor", "background-color" } },
            {"Ширина", new object[4] { "Width", "width", "width", "width" } },
            {"ШиринаВерхнейГраницы", new object[4] { "BorderTopWidth", "borderTopWidth", "borderTopWidth", "border-top-width" } },
            {"ШиринаГраниц", new object[4] { "BordersWidth", "borderWidth", "bordersWidth", "border-width" } }, ////////////////////////////////////////////////////////////////////////
            {"ШиринаКартинкиГраницы", new object[4] { "BorderImageWidth", "borderImageWidth", "borderImageWidth", "border-image-width" } },
            {"ШиринаКолонок", new object[4] { "ColumnWidth", "columnWidth", "columnWidth", "column-width" } },
            {"ШиринаКонтура", new object[4] { "OutlineWidth", "outlineWidth", "outlineWidth", "outline-width" } },
            {"ШиринаЛевойГраницы", new object[4] { "BorderLeftWidth", "borderLeftWidth", "borderLeftWidth", "border-left-width" } },
            {"ШиринаНижнейГраницы", new object[4] { "BorderBottomWidth", "borderBottomWidth", "borderBottomWidth", "border-bottom-width" } },
            {"ШиринаПравойГраницы", new object[4] { "BorderRightWidth", "borderRightWidth", "borderRightWidth", "border-right-width" } },
            {"ШиринаРазделителяКолонок", new object[4] { "ColumnRuleWidth", "columnRuleWidth", "columnRuleWidth", "column-rule-width" } },
            {"Шрифт", new object[4] { "Font", "font", "font", "font" } }
        };		
		
        // Для метода ПолучитьСвойство и для установки аргументов событий. Имена свойств.
        public static Dictionary<string, object[]> namesRusProps = new Dictionary<string, object[]>
            {
                // methodRus tail isProperty jsMethodEn
                // tail - хвостик к значению свойства.
                // isProperty - это свойство объекта, иначе, - это свойство стиля.
                // Это для DfEventArgs
                {"ListItem", new object[3] { "", true, "listItem" } },
                {"Y", new object[3] { "", true, "y" } },
                {"X", new object[3] { "", true, "x" } },
                {"Button", new object[3] { "", true, "button" } },
                {"Files", new object[3] { "", true, "files" } },		
                {"Value", new object[3] { "", true, "_value" } },
                // Это для объектов
                {"WindowHeight", new object[3] { "", true, "windowHeight" } },
                {"WindowWidth", new object[3] { "", true, "windowWidth" } },
                {"ЦветФона", new object[3] { "", false, "backgroundColor" } },
                {"Направление", new object[3] { "", true, "dir" } },
                {"ГоризонтальноеПрокручивание", new object[3] { "", true, "scrollLeft" } },
                {"ВертикальноеПрокручивание", new object[3] { "", true, "scrollTop" } },
                {"Длительность", new object[3] { "", true, "duration" } },
                {"НаПаузе", new object[3] { "", true, "paused" } },
                {"Завершено", new object[3] { "", true, "ended" } },
                {"Скорость", new object[3] { "", true, "playbackRate" } },
                {"ИндексЯчейки", new object[3] { "", true, "cellIndex" } },
                {"Индекс", new object[3] { "", true, "index" } },
                {"ДиапазонКолонок", new object[3] { "", true, "colSpan" } },
                {"Заголовки", new object[3] { "", true, "headers" } },
                {"ДиапазонСтрок", new object[3] { "", true, "rowSpan" } },
                {"Класс", new object[3] { "", true, "className" } },
                {"СмещениеЛево", new object[3] { "", true, "offsetLeft" } },
                {"СмещениеВерх", new object[3] { "", true, "offsetTop" } },
                {"СмещениеШирина", new object[3] { "", true, "offsetWidth" } },
                {"СмещениеВысота", new object[3] { "", true, "offsetHeight" } },
                {"Имя", new object[3] { "", true, "name" } },
                {"Загружено", new object[3] { "", true, "complete" } },
                {"Карта", new object[3] { "", true, "isMap" } },
                {"ИсходнаяШирина", new object[3] { "", true, "naturalWidth" } },
                {"ИсходнаяВысота", new object[3] { "", true, "naturalHeight" } },
                {"Области", new object[3] { "", true, "areas" } },
                {"Изображения", new object[3] { "", true, "images" } },
                {"Файлы", new object[3] { "", true, "files" } },
                {"Позиция", new object[3] { "", true, "position" } },		
                {"Количество", new object[3] { "", true, "length" } },
                {"ЭлементыСписка", new object[3] { "", true, "options" } },
                {"Помечен", new object[3] { "", true, "_checked" } },
                {"Ячейки", new object[3] { "", true, "cells" } },
                {"ИндексСтроки", new object[3] { "", true, "rowIndex" } },
                {"ИндексСтрокиВСекции", new object[3] { "", true, "sectionRowIndex" } },
                {"Строки", new object[3] { "", true, "rows" } },
                {"ОбластиТаблицы", new object[3] { "", true, "tBodies" } },
                {"Итоги", new object[3] { "", true, "tFoot" } },
                {"ШапкаТаблицы", new object[3] { "", true, "tHead" } },
                {"Значение", new object[3] { "", true, "_value" } },
                {"БазоваяДлина", new object[3] { "", false, "flexBasis" } },
                {"ВариантШрифта", new object[3] { "", false, "fontVariant" } },
                {"ВертикальноеВыравнивание", new object[3] { "", false, "verticalAlign" } },
                {"Родитель", new object[3] { "", true, "parent" } },
                {"Идентификатор", new object[3] { "", true, "id" } },
                {"Текст", new object[3] { "", true, "innerText" } },
                {"Видимость", new object[3] { "", false, "visibility" } },
                {"ВерхняяГраница", new object[3] { "", false, "borderTop" } },
                {"ВписываниеОбъекта", new object[3] { "", false, "objectFit" } },
                {"ВремяПерехода", new object[3] { "", false, "transitionDuration" } },
                {"ВыделениеПользователем", new object[3] { "", false, "userSelect" } },
                {"ВыравниваниеОтдельных", new object[3] { "", false, "alignSelf" } },
                {"ВыравниваниеСодержимого", new object[3] { "", false, "alignContent" } },
                {"ВыравниваниеЭлементов", new object[3] { "", false, "alignItems" } },
                {"Высота", new object[3] { "", false, "height" } },
                {"ВысотаСтроки", new object[3] { "", false, "lineHeight" } },
                {"ГоризонтальноеВыравнивание", new object[3] { "", false, "cssFloat" } },
                {"ГоризонтальноеВыравниваниеТекста", new object[3] { "", false, "textAlign" } },
                {"ГраницаСвернута", new object[3] { "", false, "borderCollapse" } },
                {"Границы", new object[3] { "", false, "border" } },
                {"ДиапазонКолонокЭлемента", new object[3] { "", false, "columnSpan" } },
                {"ДлинаТабуляции", new object[3] { "", false, "tabSize" } },
                {"ДлительностьАнимации", new object[3] { "", false, "animationDuration" } },
                {"ЖирностьШрифта", new object[3] { "", false, "fontWeight" } },
                {"ЗадержкаАнимации", new object[3] { "", false, "animationDelay" } },
                {"ЗадержкаПерехода", new object[3] { "", false, "transitionDelay" } },
                {"ЗаливкаАнимации", new object[3] { "", false, "animationFillMode" } },
                {"Заполнение", new object[3] { "", false, "padding" } },
                {"ЗаполнениеКолонок", new object[3] { "", false, "columnFill" } },
                {"ЗаполнениеСверху", new object[3] { "", false, "paddingTop" } },
                {"ЗаполнениеСлева", new object[3] { "", false, "paddingLeft" } },
                {"ЗаполнениеСнизу", new object[3] { "", false, "paddingBottom" } },
                {"ЗаполнениеСправа", new object[3] { "", false, "paddingRight" } },
                {"ИзменяемыйРазмер", new object[3] { "", false, "resize" } },
                {"ИмяАнимации", new object[3] { "", false, "animationName" } },
                {"ИнтервалГраницы", new object[3] { "", false, "borderSpacing" } },
                {"ИнтервалКолонок", new object[3] { "", false, "columnGap" } },
                {"ИнтервалСимволов", new object[3] { "", false, "letterSpacing" } },
                {"ИнтервалСлов", new object[3] { "", false, "wordSpacing" } },
                {"ИсточникКартинкиГраницы", new object[3] { "", false, "borderImageSource" } },
                {"ИсточникПерспективы", new object[3] { "", false, "perspectiveOrigin" } },
                {"Калибровка", new object[3] { "", false, "boxSizing" } },
                {"КартинкаГраницы", new object[3] { "", false, "borderImage" } },
                {"КартинкаСтиляСписка", new object[3] { "", false, "listStyleImage" } },
                {"КоличествоКолонок", new object[3] { "", false, "columnCount" } },
                {"КоличествоПовторов", new object[3] { "", false, "animationIterationCount" } },
                {"КолонкиЭлемента", new object[3] { "", false, "columns" } },
                {"Контур", new object[3] { "", false, "outline" } },
                {"Ширина", new object[3] { "", false, "width" } },
                {"Курсор", new object[3] { "", false, "cursor" } },
                {"ЛеваяГраница", new object[3] { "", false, "borderLeft" } },
                {"Лево", new object[3] { "", false, "left" } },
                {"ЛевыйРадиусВерхнейГраницы", new object[3] { "", false, "borderTopLeftRadius" } },
                {"ЛевыйРадиусНижнейГраницы", new object[3] { "", false, "borderBottomLeftRadius" } },
                {"МаксимальнаяВысота", new object[3] { "", false, "maxHeight" } },
                {"МаксимальнаяШирина", new object[3] { "", false, "maxWidth" } },
                {"МинимальнаяВысота", new object[3] { "", false, "minHeight" } },
                {"МинимальнаяШирина", new object[3] { "", false, "minWidth" } },
                {"МозаикаКартинки", new object[3] { "", false, "backgroundRepeat" } },
                {"МозаикаКартинкиГраницы", new object[3] { "", false, "borderImageRepeat" } },
                {"НаправлениеАнимации", new object[3] { "", false, "animationDirection" } },
                {"НаправлениеЭлементов", new object[3] { "", false, "flexDirection" } },
                {"НарезкаКартинкиГраницы", new object[3] { "", false, "borderImageSlice" } },
                {"Непрозрачность", new object[3] { "", false, "opacity" } },
                {"Несвободно", new object[3] { "", false, "clear" } },
                {"НижняяГраница", new object[3] { "", false, "borderBottom" } },
                {"Низ", new object[3] { "", false, "bottom" } },
                {"ОбластьКартинки", new object[3] { "", false, "backgroundOrigin" } },
                {"ОбластьРисования", new object[3] { "", false, "backgroundClip" } },
                {"Обрезка", new object[3] { "", false, "clip" } },
                {"Отображать", new object[3] { "", false, "display" } },
                {"Отступ", new object[3] { "", false, "margin" } },
                {"ОтступСверху", new object[3] { "", false, "marginTop" } },
                {"ОтступСлева", new object[3] { "", false, "marginLeft" } },
                {"ОтступСнизу", new object[3] { "", false, "marginBottom" } },
                {"ОтступСправа", new object[3] { "", false, "marginRight" } },
                {"ОтступТекста", new object[3] { "", false, "textIndent" } },
                {"ОформлениеТекстаЛиния", new object[3] { "", false, "textDecorationLine" } },
                {"ОформлениеТекстаСтиль", new object[3] { "", false, "textDecorationStyle" } },
                {"ОформлениеТекстаЦвет", new object[3] { "", false, "textDecorationColor" } },
                {"ПереносГибких", new object[3] { "", false, "flexWrap" } },
                {"ПереносСлов", new object[3] { "", false, "wordWrap" } },
                {"Переполнение", new object[3] { "", false, "overflow" } },
                {"ПереполнениеИгрек", new object[3] { "", false, "overflowY" } },
                {"ПереполнениеИкс", new object[3] { "", false, "overflowX" } },
                {"ПереполнениеТекста", new object[3] { "", false, "textOverflow" } },
                {"Переход", new object[3] { "", false, "transition" } },
                {"Перспектива", new object[3] { "", false, "perspective" } },	
                {"ПозицияОбъекта", new object[3] { "", false, "objectPosition" } },
                {"ПозицияСтиляСписка", new object[3] { "", false, "listStylePosition" } },
                {"ПоложениеЗаголовка", new object[3] { "", false, "captionSide" } },
                {"ПоложениеКартинки", new object[3] { "", false, "backgroundPosition" } },
                {"Порядок", new object[3] { "", false, "order" } },
                {"ПраваяГраница", new object[3] { "", false, "borderRight" } },
                {"Право", new object[3] { "", false, "right" } },
                {"ПравыйРадиусВерхнейГраницы", new object[3] { "", false, "borderTopRightRadius" } },
                {"ПравыйРадиусНижнейГраницы", new object[3] { "", false, "borderBottomRightRadius" } },
                {"Пробелы", new object[3] { "", false, "whiteSpace" } },
                {"ПрописныеТекста", new object[3] { "", false, "textTransform" } },
                {"ПустыеЯчейки", new object[3] { "", false, "emptyCells" } },
                {"РадиусГраницы", new object[3] { "", false, "borderRadius" } },
                {"РазделительКолонок", new object[3] { "", false, "columnRule" } },
                {"РазмерКартинки", new object[3] { "", false, "backgroundSize" } },
                {"РазмерШрифта", new object[3] { "", false, "fontSize" } },
                {"РазмещениеВТаблице", new object[3] { "", false, "tableLayout" } },
                {"РасположениеСодержимого", new object[3] { "", false, "justifyContent" } },
                {"СвойствоПерехода", new object[3] { "", false, "transitionProperty" } },
                {"СемействоШрифтов", new object[3] { "", false, "fontFamily" } },
                {"СмещениеКартинкиГраницы", new object[3] { "", false, "borderImageOutset" } },
                {"СмещениеКонтура", new object[3] { "", false, "outlineOffset" } },
                {"Состояние", new object[3] { "", false, "animationPlayState" } },
                {"СтильВерхнейГраницы", new object[3] { "", false, "borderTopStyle" } },
                {"СтильГраниц", new object[3] { "", false, "borderStyle" } },
                {"СтильКонтура", new object[3] { "", false, "outlineStyle" } },	
                {"СтильЛевойГраницы", new object[3] { "", false, "borderLeftStyle" } },
                {"СтильНижнейГраницы", new object[3] { "", false, "borderBottomStyle" } },
                {"СтильПравойГраницы", new object[3] { "", false, "borderRightStyle" } },
                {"СтильРазделителяКолонок", new object[3] { "", false, "columnRuleStyle" } },
                {"СтильСдвига", new object[3] { "", false, "transformStyle" } },
                {"СтильСписка", new object[3] { "", false, "listStyle" } },
                {"СтильШрифта", new object[3] { "", false, "fontStyle" } },
                {"Тень", new object[3] { "", false, "boxShadow" } },
                {"ТеньТекста", new object[3] { "", false, "textShadow" } },
                {"ТипСтиляСписка", new object[3] { "", false, "listStyleType" } },
                {"ТочкаСдвига", new object[3] { "", false, "transformOrigin" } },
                {"Увеличение", new object[3] { "", false, "flexGrow" } },
                {"Уменьшение", new object[3] { "", false, "flexShrink" } },
                {"Фильтр", new object[3] { "", false, "filter" } },
                {"Фон", new object[3] { "", false, "background" } },
                {"ФоновоеВложение", new object[3] { "", false, "backgroundAttachment" } },
                {"ФоновоеИзображение", new object[3] { "", false, "backgroundImage" } },
                {"ФункцияПерехода", new object[3] { "", false, "transitionTimingFunction" } },
                {"ФункцияСинхронизации", new object[3] { "", false, "animationTimingFunction" } },
                {"ЦветВерхнейГраницы", new object[3] { "", false, "borderTopColor" } },
                {"ЦветГраниц", new object[3] { "", false, "borderColor" } },
                {"ЦветКонтура", new object[3] { "", false, "outlineColor" } },
                {"ЦветКурсора", new object[3] { "", false, "caretColor" } },
                {"ЦветЛевойГраницы", new object[3] { "", false, "borderLeftColor" } },
                {"ЦветНижнейГраницы", new object[3] { "", false, "borderBottomColor" } },
                {"ЦветПравойГраницы", new object[3] { "", false, "borderRightColor" } },
                {"ЦветРазделителяКолонок", new object[3] { "", false, "columnRuleColor" } },
                {"ЦветТекста", new object[3] { "", false, "color" } },
                {"ШиринаВерхнейГраницы", new object[3] { "", false, "borderTopWidth" } },
                {"ШиринаГраниц", new object[3] { "", false, "borderWidth" } },
                {"ШиринаКартинкиГраницы", new object[3] { "", false, "borderImageWidth" } },
                {"ШиринаКолонок", new object[3] { "", false, "columnWidth" } },
                {"ШиринаКонтура", new object[3] { "", false, "outlineWidth" } },
                {"ШиринаЛевойГраницы", new object[3] { "", false, "borderLeftWidth" } },
                {"ШиринаНижнейГраницы", new object[3] { "", false, "borderBottomWidth" } },
                {"ШиринаПравойГраницы", new object[3] { "", false, "borderRightWidth" } },
                {"ШиринаРазделителяКолонок", new object[3] { "", false, "columnRuleWidth" } },
                {"Шрифт", new object[3] { "", false, "font" } },
                {"ТолькоЧтение", new object[3] { "", true, "readOnly" } },
                {"АвтоФокус", new object[3] { "", true, "autofocus" } },		
                {"Адрес", new object[3] { "", true, "href" } },
                {"Асинхронно", new object[3] { "", true, "async" } },
                {"Беззвучно", new object[3] { "", true, "muted" } },
                {"КлавишаДоступа", new object[3] { "", true, "accessKey" } },
                {"ПорядокОбхода", new object[3] { "", true, "tabIndex" } },
                {"Редактируемый", new object[3] { "", true, "contentEditable" } },		
                {"Отключено", new object[3] { "", true, "disabled" } },		
                {"Шаг", new object[3] { "", true, "step" } },		
                {"Максимум", new object[3] { "", true, "max" } },
                {"Минимум", new object[3] { "", true, "min" } },		
                {"Открыт", new object[3] { "", true, "open" } },		
                {"Заполнитель", new object[3] { "", true, "placeholder" } },		
                {"МаксимальнаяДлина", new object[3] { "", true, "maxLength" } },		
                {"Размер", new object[3] { "", true, "size" } },
                {"Источник", new object[3] { "", true, "src" } },
                {"Разлиновка", new object[3] { "", true, "rules" } },
                {"Громкость", new object[3] { "", true, "volume" } },
                {"Контролы", new object[3] { "", true, "controls" } },
                {"Повтор", new object[3] { "", true, "loop" } },
                {"ТекущаяПозиция", new object[3] { "", true, "currentTime" } },
                {"Оптимум", new object[3] { "", true, "optimum" } },
                {"Диапазон", new object[3] { "", true, "span" } },
                {"Описание", new object[3] { "", true, "_аlt" } },
                {"ИмяКарты", new object[3] { "", true, "useMap" } },
                {"ИндексВыбранного", new object[3] { "", true, "selectedIndex" } },
                {"МножественныйВыбор", new object[3] { "", true, "multiple" } },
                {"Начало", new object[3] { "", true, "start" } },
                {"Обратный", new object[3] { "", true, "reversed" } },
                {"ТипМаркера", new object[3] { "", true, "type" } },		
                {"Выбран", new object[3] { "", true, "selected" } },
                {"Надпись", new object[3] { "", true, "label" } },
                {"ПереносТекста", new object[3] { "", true, "wrap" } },
                {"Колонки", new object[3] { "", true, "cols" } },
                {"Принимаемый", new object[3] { "", true, "accept" } },
                {"Скачать", new object[3] { "", true, "download" } },
                {"Подсказка", new object[3] { "", true, "title" } },
                {"Назначение", new object[3] { "", true, "target" } },
                {"Неопределено", new object[3] { "", true, "indeterminate" } },
                {"Форма", new object[3] { "", true, "form" } },		
                {"Отложено", new object[3] { "", true, "defer" } },
                {"Связь", new object[3] { "", true, "htmlFor" } },		
                {"Гибкость", new object[3] { "", false, "flex" } },

		
        };
    }
}
