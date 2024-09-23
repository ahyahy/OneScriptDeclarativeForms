namespace osdf
{
    public class Mainjs
    {
        public static string mainjs = @"
function funFromString(func)
{
    let func2 = Function(func);
    func2();
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
    else if (event.type == 'input')
    {
        let value = event.target.value;
        sendPost(
        event.target.name + 
        '|||' + event.type + 
        '|||Value=' + value);
    }
    else
    {
        sendPost(event.target.name + '|||' + event.type);
    }
}
function createElement(typeElement, nameElement)
{
    var el;
    if (typeElement == 'body')
    {
        el = document.getElementsByTagName('body')[0];
    }
    else
    {
        el = document.createElement(typeElement);
    }
    el.name = nameElement;
    map.set(nameElement, el);
}
function setInputType(nameElement, typeElement)
{
    var el = map.get(nameElement);
    el.type = typeElement;
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
function getProperty(nameElement, namePropertyObj, namePropertyElement, notStyleProperty)
{
    let res;
    let el = map.get(nameElement);
    try
    {
        if (namePropertyObj == 'parent')
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
			if (notStyleProperty == 'true')
			{
				res = el[namePropertyElement];
			}
			else
			{
				res = el.style.getPropertyValue(namePropertyElement);
			}
        }
		sendPost(
		nameElement + 
		'|||' + 'dgj3rqq550w4' + 
		'|||' + namePropertyObj + 
		'|||' + res + 
		'|||' + notStyleProperty);
	}
	catch (err)
    {
        sendPost('!!! Ошибка:' + err.message);
    }    
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
// Начало блока постоянного клиента.
function processData(data)
{
	let fragment1 = 'HTTP/1.1 200 OK';
	let fragment2 = 'Server: OneScriptDeclarativeForms';
	let fragment3 = 'Content-Type: text/html; charset=utf-8';
	var input = data.replace(fragment1, '').replace(fragment2, '').replace(fragment3, '').trim();
	// alert('input = ' + input);
	var fields = input.split(';');
	for (var i = 0; i < fields.length; i++)
	{
		var item = fields[i];
		if (item != '')
		{
			try
			{
				funFromString(item);
			}
			catch
			{
				return;
			}    
		}
	}
}
var net = require('net'); // Импортируем сетевой модуль.
function getConn() // Создаем TCP-клиент.
{
    var option = {host:'127.0.0.1', port: " + DeclarativeForms.port + @"}
    // Создайте TCP-клиент.
    var client = net.createConnection(option, function () {
        // alert('Локальный адрес подключения : ' + client.localAddress + ':' + client.localPort);
        // alert('Удаленный адрес подключения : ' + client.remoteAddress + ':' + client.remotePort);
    });
    // client.setTimeout(1000); // Отключение по таймауту нам не нужно. Один клиент должен быть постоянно на связи.
    client.setEncoding('utf8');
    // При получении сервер отправляет обратно данные.
    client.on('data', function (data) {
        // alert('Данные возврата сервера : ' + data);
		processData(data);
    });
    // Если постоянный клиент почему то отключился, мы его снова подключим.
    client.on('close',function () {
        // alert('Сервер закрыл соединение.');
		var nodeClient = getConn();
		nodeClient.write('ConstantClient5du4fsjiwixxf');
    });
    client.on('end',function () {
        // alert('Окончание передачи.');
    });
    client.on('timeout', function () {
        // alert('Таймаут подключения клиента.');
    });
    client.on('error', function (err) {
        // alert(JSON.stringify(err));
    });
    return client;
}
// Создадим одного постоянно подключенного клиента.
// По этому каналу мы в любом месте сможем послать команду форме из сценария.
// Остальные клиенты создаются  только во время возникновения события.
// При возникновении события посылается POST запрос серверу и по получении ответа соединение разрывается.
// это же соединение будет постоянным и в случае разрыва произойдет переподключение.
var nodeClient = getConn();
nodeClient.write('ConstantClient5du4fsjiwixxf');
// Конец блока постоянного клиента.

var map = new Map();
var gui = require('nw.gui');
document.addEventListener('DOMContentLoaded', function (event) { sendPost('mainForm' + '|||' + 'loaded'); });
";
    }
}
