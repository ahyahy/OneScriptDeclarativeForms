using System;
using System.IO;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using ScriptEngine.Machine.Contexts;
using ScriptEngine.Machine;
using System.Reflection;
using System.Runtime.InteropServices;
using ScriptEngine.HostedScript.Library;
using ScriptEngine.HostedScript.Library.Binary;
using System.Collections.Concurrent;

namespace osdf
{
    [ContextClass("ДекларативныеФормы", "DeclarativeForms")]
    public class DeclarativeForms : AutoContext<DeclarativeForms>
    {
        private static string separator = Path.DirectorySeparatorChar.ToString();
        private static StructureImpl shareStructure = new StructureImpl();
        public DfEventArgs eventArgs;
        public static DeclarativeForms instance;
        private static object syncRoot = new Object();
        public static string _oscriptPath = "";
        public static string _nw = "";
        public static string strFunctions = "";
        public static int port = 3333;
        public static Hashtable hashtable = new Hashtable();
        private static DfForm form = new DfForm();
        public static System.Diagnostics.Process process;

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
            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Source")).AsString();
            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Path")).AsString();
            _nw = pathStartupScript + separator + "nwjs" + separator + "nw.exe";
            _oscriptPath = pathStartupScript + separator + "oscript" + separator + "bin" + separator + "oscript.exe";

            DeclarativeForms inst = getInstance();
            inst.InjectGlobalProperty(shareStructure, "ОбщаяСтруктура", false);
            shareStructure.Insert("ДФ", inst);
            return inst;
        }

        [ContextProperty("НоваяСтрока", "NewLine")]
        public string NewLine
        {
            get
            {
                if (Environment.OSVersion.Platform == PlatformID.Unix)
                {
                    return "\u000a"; // \n
                }
                else if (Environment.OSVersion.Platform == PlatformID.MacOSX)
                {
                    return "\u000d"; // \r
                }
                return "\u000d\u000a";
            }
        }

        public static SystemGlobalContext GlobalContext()
        {
            return GlobalsManager.GetGlobalContext<SystemGlobalContext>();
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
        [ContextProperty("Пауза", "AnimationPlayState")]
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

        private static DfScrollBehavior df_ScrollBehavior = new DfScrollBehavior();
        [ContextProperty("ПоведениеПрокрутки", "ScrollBehavior")]
        public DfScrollBehavior ScrollBehavior
        {
            get { return df_ScrollBehavior; }
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

        private static DfPageBreakInside df_PageBreakInside = new DfPageBreakInside();
        [ContextProperty("РазрывСтраницыВнутри", "PageBreakInside")]
        public DfPageBreakInside PageBreakInside
        {
            get { return df_PageBreakInside; }
        }

        private static DfPageBreakBefore df_PageBreakBefore = new DfPageBreakBefore();
        [ContextProperty("РазрывСтраницыДо", "PageBreakBefore")]
        public DfPageBreakBefore PageBreakBefore
        {
            get { return df_PageBreakBefore; }
        }

        private static DfPageBreakAfter df_PageBreakAfter = new DfPageBreakAfter();
        [ContextProperty("РазрывСтраницыПосле", "PageBreakAfter")]
        public DfPageBreakAfter PageBreakAfter
        {
            get { return df_PageBreakAfter; }
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

        private static DfVideoType df_VideoType = new DfVideoType();
        [ContextProperty("ТипВидео", "VideoType")]
        public DfVideoType VideoType
        {
            get { return df_VideoType; }
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

        [ContextMethod("Видео", "Video")]
        public DfVideo Video()
        {
            return new DfVideo();
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

        [ContextMethod("ЗаголовочнаяЯчейка", "HeaderCell")]
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

        [ContextMethod("СписокДанных", "Datalist")]
        public DfDatalist Datalist()
        {
            return new DfDatalist();
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
        public DfBorderRadius BorderRadius(IValue p1 = null, IValue p2 = null, IValue p3 = null, IValue p4 = null)
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
            process.Kill();
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

        [ContextProperty("Порт", "Port")]
        public int Port
        {
            get { return port; }
            set { port = value; }
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

        [ContextMethod("ЗагрузитьСценарии", "LoadScripts")]
        public StructureImpl LoadScripts(string folderName)
        {
            StructureImpl scripts = new StructureImpl();
            StructureImpl attachByPath = new StructureImpl();
            StructureImpl extContext = new StructureImpl();
            IRuntimeContextInstance startupScript = GlobalContext().StartupScript();
            string fullPathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Source")).AsString();
            string pathStartupScript = startupScript.GetPropValue(startupScript.FindProperty("Path")).AsString();
            string nameStartupScript = fullPathStartupScript.Replace(pathStartupScript, "").Replace(".os", "").Replace(separator, "");
            shareStructure.Insert("Сценарии", scripts);
            extContext.Insert(nameStartupScript, ValueFactory.Create(startupScript));
            extContext.Insert("ОбщаяСтруктура", shareStructure);

            // Создаем файл startserver.os
            File.WriteAllText(pathStartupScript + separator + "Классы" + separator + "startserver.os", Startserver.startserver, System.Text.Encoding.UTF8);

            // Создаем файл server
            File.WriteAllText(pathStartupScript + separator + "Классы" + separator + "server", Server.server, System.Text.Encoding.UTF8);

            // Создаем файл package.json
            System.IO.File.WriteAllText(pathStartupScript + separator + "package.json", Packagejson.packagejson, System.Text.Encoding.UTF8);

            // Создаем файл index.html
            System.IO.File.WriteAllText(pathStartupScript + separator + "index.html", Indexhtml.indexhtml, System.Text.Encoding.UTF8);

            // Создаем файл main.js
            System.IO.File.WriteAllText(pathStartupScript + separator + "main.js", Mainjs.mainjs, System.Text.Encoding.UTF8);

            // Создаем в этом каталоге файл стиля (имя_скрипта).css
            // ...

            bool isWin = System.Environment.OSVersion.VersionString.Contains("Microsoft");
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
            if (!DeclarativeForms.hashtable.ContainsKey(p1))
            {
                DeclarativeForms.hashtable.Add(p1, p2);
            }
            else
            {
                if (!((object)DeclarativeForms.hashtable[p1]).Equals(p2))
                {
                    DeclarativeForms.hashtable[p1] = p2;
                }
            }
        }

        [ContextMethod("НайтиЭлемент", "FindElement")]
        public IValue FindElement(object nameObject)
        {
            try
            {
                return (IValue)DeclarativeForms.hashtable[nameObject];
            }
            catch
            {
                return null;
            }
        }

        [ContextMethod("СообщениеФорме", "MessageToForm")]
        public void Send(string p1)
        {
            int num = shareStructure.FindProperty("Клиент");
            dynamic val1 = shareStructure.GetPropValue(num);
            int num2 = shareStructure.FindProperty("КС");
            dynamic val2 = shareStructure.GetPropValue(num2);

            val1.SendMessage(val2.TextMessage(p1));
            strFunctions = "";
        }

        public DfAction gettingProperty;
        [ContextProperty("ПриПолученииСвойства", "GettingProperty")]
        public DfAction GettingProperty
        {
            get { return gettingProperty; }
            set { gettingProperty = value; }
        }		

        [ContextMethod("ОбработатьСообщение", "ProcessMessage")]
        public void ProcessMessage(string p1)
        {
            string[] zapros = p1.Split(new string[] { "\u000a", "\u000d" }, StringSplitOptions.RemoveEmptyEntries);
            string strZapros = zapros[zapros.Length - 1];
            string[] massiv = strZapros.Split(new string[] { "|||" }, StringSplitOptions.RemoveEmptyEntries);
            //GlobalContext().Echo("Сообщение.Текст = " + p1);
            //GlobalContext().Echo("СтрЗапроса = " + strZapros);
            if (!(massiv.Length < 2))
            {
                string nameElement = massiv[0];
                string nameEvent = massiv[1];
                if (massiv.Length == 2) // Для событий без аргументов.
                {
                    try
                    {
                        Sender = FindElement(nameElement);
                        Execute((DfAction)FindElement(nameElement).AsObject().GetPropValue(nameEvent));
                    }
                    catch
                    {
                        if (nameElement == "mainForm" && nameEvent == "loaded")
                        {
                            // Ничего не делаем.
                        }
                        else
                        {
                            GlobalContext().Echo("Не обработано событие = " + nameEvent);
                        }
                    }
                }
                else // Для событий с аргументами.
                {
                    try
                    {
                        if (nameEvent =="dgj3rqq550w4")
                        {
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
                            else
                            {
                                propValue = ValueFactory.Create(massiv[3]);
                            }
                            ((dynamic)Sender).SetPropValue(((dynamic)Sender).FindProperty(nameProperty), propValue);
                            System.Threading.Thread.Sleep(7);
                            Execute(GettingProperty);
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
                        GlobalContext().Echo("Не найден = " + nameElement);
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
                    GlobalContext().Echo("Ошибка: " + resTest);
                }
            }
        }

        public DfEventArgs CreateEventArgs(string p1)
        {
            DfEventArgs DfEventArgs1 = new DfEventArgs();
            //СтрЗапроса = d3tfonn3esun|||mouseup|||Button=right|||X=40|||Y=54
            //GlobalContext().Echo("p1 = " + p1);
            string[] str1 = p1.Split(new string[] { "|||" }, StringSplitOptions.RemoveEmptyEntries);
            for (int i = 2; i < str1.Length; i++)
            {
                try
                {
                    string[] str2 = str1[i].Split(new string[] { "=" }, StringSplitOptions.RemoveEmptyEntries);
                    //GlobalContext().Echo("str2[i] = " + str2[0]);
                    //GlobalContext().Echo("str2[i] = " + str2[1]);

                    // Здесь нужно знать какой тип значения у свойства и конвертировать из строки str2[0] в нужный тип.
                    string nameProperty = "";
                    System.Reflection.PropertyInfo[] myPropertyInfo = Sender.GetType().GetProperties();
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
                    string propertyType = Sender.GetType().GetProperty(nameProperty).PropertyType.ToString();
                    IValue propValue;
                    if (propertyType == "System.Int32")
                    {
                        Decimal num1 = Decimal.Parse(str2[1].Replace(".", ","));
                        propValue = ValueFactory.Create(Convert.ToInt32(num1));
                    }
                    else
                    {
                        propValue = ValueFactory.Create(str2[1]);
                    }
                    DfEventArgs1.SetPropValue(DfEventArgs1.FindProperty(str2[0]), propValue);
                    // Изменим и значение свойства объекта.
                    ((dynamic)Sender).SetPropValue(((dynamic)Sender).FindProperty(str2[0]), propValue);
                }
                catch { }
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
                GlobalContext().Echo("Ошибка: " + ex.Message);
            }
            return res;
        }

        [ContextMethod("ПолучитьСвойство", "GetObjectProperty")]
        public void GetObjectProperty(IValue p1, string p2)
        {
            string function1;		
            //getProperty(nameElement, namePropertyObj, namePropertyElement, notStyleProperty)
            if ((bool)namesRusProps[p2][1])
            {
                function1 = "getProperty(\u0022" + ((dynamic)p1).Name + "\u0022, \u0022" + p2 + "\u0022, \u0022" + namesRusProps[p2][2] + "\u0022, \u0022" + namesRusProps[p2][1].ToString().ToLower() + "\u0022)";
            }
            else
            {
                function1 = "getProperty(\u0022" + ((dynamic)p1).Owner.Name + "\u0022, \u0022" + p2 + "\u0022, \u0022" + namesRusProps[p2][2] + "\u0022, \u0022" + namesRusProps[p2][1].ToString().ToLower() + "\u0022)";
            }
            int num = DeclarativeForms.shareStructure.FindProperty("Клиент");
            dynamic val1 = DeclarativeForms.shareStructure.GetPropValue(num);
            int num2 = DeclarativeForms.shareStructure.FindProperty("КС");
            dynamic val2 = DeclarativeForms.shareStructure.GetPropValue(num2);
            val1.SendMessage(val2.TextMessage(function1));
            DeclarativeForms.strFunctions = "";
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

        // Для метода ПолучитьСвойство. Имена свойств.
        public static Dictionary<string, object[]> namesRusProps = new Dictionary<string, object[]>
            {
                // methodRus tail isProperty jsMethodEn
                // tail - хвостик к значению свойства.
                // isProperty - это свойство объекта, иначе, - это свойство стиля.
                // {"Ширина", new object[3] { "px", true, "offsetWidth" } },
                // {"Высота", new object[3] { "px", true, "offsetHeight" } },
                // {"ДвойноеНажатие", new object[3] { "", true, "dblclick" } },
                // {"Нажатие", new object[3] { "", true, "click" } },
                // {"ПриОтпусканииМыши", new object[3] { "", true, "mouseup" } },
                {"ЦветФона", new object[3] { "", false, "background-color" } },
                // {"Текст", new object[3] { "", true, "innerText" } },
                // {"Родитель", new object[3] { "", true, "parent" } },
                // {"Загружена", new object[3] { "", true, "loaded" } },
                // {"КлавишаДоступа", new object[3] { "", true, "accessKey" } },
                // {"Редактируемый", new object[3] { "", true, "contenteditable" } },
                {"Направление", new object[3] { "", true, "dir" } },
                // {"Лево", new object[3] { "", true, "offsetLeft" } },
                {"ГоризонтальноеПрокручивание", new object[3] { "", true, "scrollLeft" } },
                {"ВертикальноеПрокручивание", new object[3] { "", true, "scrollTop" } },


            };

    }
}
