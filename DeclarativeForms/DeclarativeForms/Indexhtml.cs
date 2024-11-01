namespace osdf
{
    public class Indexhtml
    {
        public static string indexhtml = @"<!DOCTYPE html>
<html>
	<head>
		<meta content='text/html; charset=utf-8' http-equiv='Content-Type'>
		<link rel='stylesheet' href='" + DeclarativeForms.CSSPath + @"' />

		<script type='text/javascript'>
            window.addEventListener('error', function (event) { alert(event.message + '\n' + event.filename); });
        </script>

		<script type='text/javascript'>
function funFromString(func)
{
    let func2 = Function(func);
    func2();
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
        mapElKey.get(event.target) + 
        '|||' + event.type + 
        '|||Button=' + button + 
        '|||X=' + event.clientX + 
        '|||Y=' + event.clientY);
    }
    else if (event.type == 'input')
    {
        let value = event.target.value;
        sendPost(
        mapElKey.get(event.target) + 
        '|||' + event.type + 
        '|||Value=' + value);
    }
    else if (event.type == 'change')
    {
        let x = mapKeyEl.get(mapElKey.get(event.target));
        //alert('nodeName = ' + event.target.nodeName + ' type = ' + event.target.type);
        if (event.target.nodeName == 'INPUT')
        {
            if (event.target.type == 'file')
            {
                let txt = '';
                if (x.files.length > 0)
                {
                    for (var i = 0; i < x.files.length; i++)
                    {
                        txt = txt + x.files[i].name + ';';
                    }
                } 
                else
                {
                    x.value = null;
                    txt = 'null';
                }
                sendPost(
                mapElKey.get(event.target) + 
                '|||' + event.type + 
                '|||Files=' + txt);
            }
            else if (event.target.type == 'checkbox')
            {
                let _checked = event.target.checked;
                sendPost(
                mapElKey.get(event.target) + 
                '|||' + event.type + 
                '|||Checked=' + _checked);
            }		
        }
        else if (event.target.nodeName == 'SELECT')
        {
            let txt = '';
            var opt = event.target.options;
            if (opt.length > 0)
            {
                for (var i = 0; i < opt.length; i++)
                {
                    if (opt[i].selected)
                    {
                        txt = txt + mapElKey.get(opt[i]) + ';';
                    }
                }
            }
            else
            {
                txt = 'null';
            }
            sendPost(
            mapElKey.get(event.target) + 
            '|||' + event.type + 
            '|||ListItem=' + txt);
        }
    }
    else
    {
        sendPost(mapElKey.get(event.target) + '|||' + event.type);
    }
}
function sendPost(str)
{
	var req = new XMLHttpRequest();
	req.onload = function(){
        var input = req.responseText;
        var fields = input.split('" + DeclarativeForms.funDelimiter + @"');
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
nw.Window.get().on('resize', function(width, height)
{
    sendPost('mainForm' + 
    '|||' + 'resize' + 
    '|||WindowWidth=' + width + 
    '|||WindowHeight=' + height);
});
// Начало блока постоянного клиента.
function processData(data)
{
	let fragment1 = 'HTTP/1.1 200 OK';
	let fragment2 = 'Server: OneScriptDeclarativeForms';
	let fragment3 = 'Content-Type: text/html; charset=utf-8';
	var input = data.replace(fragment1, '').replace(fragment2, '').replace(fragment3, '').trim();
	// alert('input = ' + input);
	var fields = input.split('" + DeclarativeForms.funDelimiter + @"');
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

var mapKeyEl = new Map();
var mapElKey = new Map();
var gui = require('nw.gui');
document.addEventListener('DOMContentLoaded', function (event) { sendPost('mainForm' + '|||' + 'loaded'); });
//////var net = require('os1'); // Пример импорта модуля. os1.js в этом случае должен лежать рядом с package.json

		</script>
	</head>
	<body>

    </body>
</html>
";
	}
}
