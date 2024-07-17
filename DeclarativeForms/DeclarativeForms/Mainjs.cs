namespace osdf
{
    public class Mainjs
    {
        public static string mainjs = @"
function onLoadDOM(event)
{
    sendPost('mainForm' + '|||' + 'loaded');
    sendPost('ПриЗагрузке');
	//верстаем

}
function funFromString(func)
{
    let func2 = Function(func);
    func2();
}
function setEventListener(nameElement, nameEvent)
{
    const el = map.get(nameElement);
    el.addEventListener(nameEvent, doEvent);
}
function setMenuItemClick(nameMenuItem)
{
    let menuItem = map.get(nameMenuItem);
    menuItem.click = function()
    {
        sendPost(nameMenuItem + '|||' + 'click');
    };
}
function doEvent(event)
{
    if (event.type == 'mouseup')
    {
        let button;
        let eventButton = event.button;
        if (eventButton == 0)
        {
            button = 'left';
        }
        else if (eventButton == 1)
        {
            button = 'middle';
        }
        else if (eventButton == 2)
        {
            button = 'right';
        }

        sendPost(
        event.target.name + 
        '|||' + event.type + 
        '|||Button=' + button + 
        '|||X=' + event.clientX + 
        '|||Y=' + event.clientY);
    }
    else
    {
        sendPost(event.target.name + '|||' + event.type);
    }
}
function createElement(typeElement, nameElement)
{
    const el = document.createElement(typeElement);
    el.name = nameElement;
    map.set(nameElement, el);
}
function setParent(nameElement, nameparent)
{
    const el = map.get(nameElement);
    if (nameparent == 'mainForm')
    {
        document.body.appendChild(el);
    }
    else
    {
        const elParent = map.get(nameparent);
        elParent.appendChild(el);
    }
}
function sendPost(str)
{
	var req = new XMLHttpRequest();
	req.onload = function(){
        var input = req.responseText;
        var fields = input.split(';');
        for (var i = 0; i < fields.length; i++)
        {
            var item = fields[i];
            if (item != '')
            {
                funFromString(item);
            }
        }
    };  
	req.onerror = function() {
      alert('!!! Ошибка соединения');
    };  

	req.open('POST', 'http://127.0.0.1:" + DeclarativeForms.port + @"');
    try
    {
        req.send(str);
    }
    catch (err)
    {
        // для отлова ошибок используем конструкцию try...catch вместо onerror
        alert('Запрос не удался');
    }
}
function setMenuItemLabel(name, label)
{
    let menuItem = map.get(name);
    menuItem.label = label;
}
function doMenuAppend(name, submenuName)
{
    let menu = map.get(name);
    let menu2 = map.get(submenuName);
    menu.append(menu2);
}
function doMenuRemove(name, submenuName)
{
    let menu = map.get(name);
    let menu2 = map.get(submenuName);
    menu.remove(menu2);
}
function doMenuRemoveAt(name, num)
{
    let menu = map.get(name);
    menu.removeAt(parseInt(num));
}
function doMenuInsert(name, submenuName, num)
{
    let menu = map.get(name);
    let menu2 = map.get(submenuName);
    menu.insert(menu2, parseInt(num));
}
function doMenuPopup(name, x, y)
{
    let menu = map.get(name);
    menu.popup(parseInt(x), parseInt(y));
}
function setMenuItemSubmenu(nameElement, nameSubmenu)
{
    let el = map.get(nameElement);
    let submenu = map.get(nameSubmenu);
    el.submenu = submenu;

}
function createMenuItem1(name, label, typeMenuItem)
{
    let menuItem = new gui.MenuItem({ label: label, type: typeMenuItem });
    map.set(name, menuItem);
    return menuItem;
}
function createMenuItem2(name, label, typeMenuItem, key)
{
    let menuItem = new gui.MenuItem({ label: label, type: typeMenuItem, key: key });
    map.set(name, menuItem);
    return menuItem;
}
function createMenuItem3(name, label, typeMenuItem, key, modifiers)
{
    let menuItem = new gui.MenuItem({ label: label, type: typeMenuItem, key: key, modifiers: modifiers });
    map.set(name, menuItem);
    return menuItem;
}
function createMenuItem4(name, label, typeMenuItem, submenuName)
{
    let menuItems = map.get(submenuName);
    let menuItem = new gui.MenuItem({ label: label, type: typeMenuItem, submenu: menuItems });
    map.set(name, menuItem);
    return menuItem;
}
function createMenuItem5(name, label, typeMenuItem, submenuName, key)
{
    let menuItems = map.get(submenuName);
    let menuItem = new gui.MenuItem({ label: label, type: typeMenuItem, submenu: menuItems, key: key });
    map.set(name, menuItem);
    return menuItem;
}
function createMenuItem6(name, label, typeMenuItem, submenuName, key, modifiers)
{
    let menuItems = map.get(submenuName);
    let menuItem = new gui.MenuItem({ label: label, type: typeMenuItem, submenu: menuItems, key: key, modifiers: modifiers });
    map.set(name, menuItem);
    return menuItem;
}
function createMenu(name, typeMenu)
{
    let menu;
    if (typeMenu == 'contextmenu')
    {
        menu = new gui.Menu({ type: 'contextmenu' });
    }
    else if (typeMenu == 'menubar')
    {
        menu = new gui.Menu({ type: 'menubar' });
    }
    else if (typeMenu == 'none')
    {
        menu = new gui.Menu();
    }
    map.set(name, menu);
    return menu;
}
function setMenu(name)
{
    let menu = map.get(name);
    gui.Window.get().menu = menu;
}
function setProperty(nameElement, nameProperty, valueProperty)
{
    if (valueProperty == 'false')
    {
        map.get(nameElement)[nameProperty] = false;
    }
    else if (valueProperty == 'true')
    {
        map.get(nameElement)[nameProperty] = true;
    }
    else
    {
        map.get(nameElement)[nameProperty] = valueProperty;
    }
}
function setAttribute(nameElement, nameAttribute, valueAttribute)
{
    map.get(nameElement).style[nameAttribute] = valueAttribute;
}
function showDialog(nameElement)
{
    let el = map.get(nameElement);
    el.show();
}
function closeDialog(nameElement)
{
    let el = map.get(nameElement);
    el.close();
}
function doTestAttribute(nameElement, method, answer, objRus, methodRus)
{
    let res;
    let el = map.get(nameElement);
    try
    {
        if (method == 'parent')
        {
            if (el.parentElement == document.body)
            {
                res = 'mainForm';
            }
            else
            {
                res = el.parentElement.name;
            }
        }
        else
        {
            res = el.style.getPropertyValue(method)
        }
        if (answer == objRus + '.' + methodRus + '=' + res)
        {
            sendPost(nameElement + ' ' + methodRus + ' = ' + res);
        }
        else
        {
            sendPost(nameElement + ' ' + methodRus + ' !!!');
        }
    }
    catch (err)
    {
        sendPost('!!! Ошибка:' + err.message);
    }    
}
function doTestProperty(nameElement, method, answer, objRus, methodRus)
{
    let res;
    let el = map.get(nameElement);
    try
    {
        if (method == 'parent')
        {
            if (el.parentElement == document.body)
            {
                res = 'mainForm';
            }
            else
            {
                res = el.parentElement.name;
            }
        }
        else
        {
            res = el[method];
        }
        if (answer == objRus + '.' + methodRus + '=' + res)
        {
            sendPost(nameElement + ' ' + methodRus + ' = ' + res);
        }
        else
        {
            sendPost(nameElement + ' ' + methodRus + ' !!!');
        }
    }
    catch (err)
    {
        sendPost('!!! Ошибка:' + err.message);
    }    
}

//функции

//////var win = nw.Window.get();
var map = new Map();
var gui = require('nw.gui');
document.addEventListener('DOMContentLoaded', onLoadDOM);
//код

";

    }
}
