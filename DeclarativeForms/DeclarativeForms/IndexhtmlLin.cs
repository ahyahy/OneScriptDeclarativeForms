namespace osdf
{
    public class IndexhtmlLin
    {
        public static string spacer = DeclarativeForms.paramDelimiter;
        public static string Indexhtml = @"<!DOCTYPE html>
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
    event.stopPropagation();
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
        '" + spacer + @"' + event.type + 
        '" + spacer + @"Button=' + button + 
        '" + spacer + @"X=' + event.clientX + 
        '" + spacer + @"Y=' + event.clientY);
    }
    else if (event.type == 'mousemove')
    {
        sendPost(
        mapElKey.get(event.target) + 
        '" + spacer + @"' + event.type + 
        '" + spacer + @"ScreenX=' + event.screenX + 
        '" + spacer + @"ScreenY=' + event.screenY + 
        '" + spacer + @"OffsetX=' + event.offsetX + 
        '" + spacer + @"OffsetY=' + event.offsetY + 
        '" + spacer + @"MovementX=' + event.movementX + 
        '" + spacer + @"MovementY=' + event.movementY + 
        '" + spacer + @"PageX=' + event.pageX + 
        '" + spacer + @"PageY=' + event.pageY);
    }
    else if (event.type == 'mousedown')
    {
        sendPost(
        mapElKey.get(event.target) + 
        '" + spacer + @"' + event.type + 
        '" + spacer + @"ScreenX=' + event.screenX + 
        '" + spacer + @"ScreenY=' + event.screenY + 
        '" + spacer + @"OffsetX=' + event.offsetX + 
        '" + spacer + @"OffsetY=' + event.offsetY + 
        '" + spacer + @"PageX=' + event.pageX + 
        '" + spacer + @"PageY=' + event.pageY);
    }
    else if (event.type == 'input')
    {
        let value = event.target.value;
        sendPost(
        mapElKey.get(event.target) + 
        '" + spacer + @"' + event.type + 
        '" + spacer + @"Value=' + value);
    }
    else if (event.type == 'change')
    {
        let x = mapKeyEl.get(mapElKey.get(event.target));
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
                '" + spacer + @"' + event.type + 
                '" + spacer + @"Files=' + txt);
            }
            else if (event.target.type == 'checkbox')
            {
                let _checked = event.target.checked;
                sendPost(
                mapElKey.get(event.target) + 
                '" + spacer + @"' + event.type + 
                '" + spacer + @"Checked=' + _checked);
            }
            else if (event.target.type == 'color')
            {
                let value = event.target.value;
                let r = parseInt(value[1] + value[2], 16);
                let g = parseInt(value[3] + value[4], 16);
                let b = parseInt(value[5] + value[6], 16);
                let value2 = 'rgb(' + r + ', ' + g + ', ' + b + ')';
                sendPost(
                mapElKey.get(event.target) + 
                '" + spacer + @"' + event.type + 
                '" + spacer + @"Value=' + value2);
            }
            else
            {
                let value = event.target.value;
                sendPost(
                mapElKey.get(event.target) + 
                '" + spacer + @"' + event.type + 
                '" + spacer + @"Value=' + value);
            }
        }
        else if (event.target == 'SELECT')
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
            '" + spacer + @"' + event.type + 
            '" + spacer + @"ListItem=' + txt);
        }
        else
        {
            let value = event.target.value;
            sendPost(
            mapElKey.get(event.target) + 
            '" + spacer + @"' + event.type + 
            '" + spacer + @"Value=' + value);
        }
    }
    else if (event.type == 'dragover')
    {
        event.preventDefault();
    }
    else
    {
        sendPost(mapElKey.get(event.target) + '" + spacer + @"' + event.type);
    }
}
function sendPost(str)
{
    nodeClientSend = getConnSend();
    nodeClientSend.write(str);
}
function startTimer(nameEl, interval) {
    window.TimerId = window.setInterval(function(){
            sendPost(nameEl + '" + spacer + @"tick');
        }, interval);
    mapKeyEl.set(nameEl, window.TimerId);
    mapElKey.set(mapKeyEl.get(nameEl), nameEl);
}
function stopTimer(nameEl) {
   window.clearInterval(mapKeyEl.get(nameEl));
}
		
// Начало блока клиентов.
function processData(data)
{
	var input = data;
    //alert('input = ' + input);
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
function getConnSend() // Создаем TCP-клиент для отправки сообщений.
{
    var option = {host:'127.0.0.1', port: " + DeclarativeForms.portReceivingServer + @"}
    // Создайте TCP-клиент.
    var client = net.createConnection(option, function () {
        // alert('Локальный адрес подключения : ' + client.localAddress + ':' + client.localPort);
    });
    // client.setTimeout(1000); // Отключение по таймауту нам не нужно. Отключение сделает сервер.
    client.setEncoding('utf8');
    // При получении сообщения сервер отправляет обратно данные.
    client.on('data', function (data) {
        //alert('Данные возврата сервера : ' + data);
		processData(data);
    });
    client.on('close',function () {
         //alert('Сервер закрыл соединение.');
    });
    client.on('end',function () {
         //alert('Окончание передачи.');
    });
    client.on('timeout', function () {
        // alert('Таймаут подключения клиента.');
    });
    client.on('error', function (err) {
         //alert(JSON.stringify(err));
    });
    return client;
}
function getConnReceiving() // Создаем TCP-клиент для приема сообщений.
{
    var option = {host:'127.0.0.1', port: " + DeclarativeForms.portReceivingServer + @"}
    // Создайте TCP-клиент.
    var client = net.createConnection(option, function () {
        // alert('Локальный адрес подключения : ' + client.localAddress + ':' + client.localPort);
    });
    // client.setTimeout(1000); // Отключение по таймауту нам не нужно. getConnReceiving должен быть постоянно на связи.
    client.setEncoding('utf8');
    // При получении сообщения или в произвольном порядке сервер отправляет данные.
    client.on('data', function (data) {
        //alert('Данные возврата сервера : ' + data);
		processData(data);
    });
    // Если постоянный клиент почему то отключился, мы его снова подключим.
    client.on('close',function () {
         //alert('Сервер закрыл соединение.');
        var nodeClientReceiving = getConnReceiving();
		nodeClientReceiving.write('ConstantClient5du4fsjiwixxf');
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

// Создадим клиенты.
// По nodeClientReceiving мы в любом месте сможем послать команду форме из сценария.
// Соединение nodeClientReceiving будет постоянным и в случае разрыва произойдет переподключение.
// Клиент nodeClientSend создается только во время возникновения события.
// При возникновении события nodeClientSend посылает сообщение серверу и после отправки ответа сервер разрывает соединение.
var nodeClientSend = getConnSend();
var nodeClientReceiving = getConnReceiving();
nodeClientReceiving.write('ConstantClient5du4fsjiwixxf');
// Конец блока клиентов.

var mapKeyEl = new Map();
var mapElKey = new Map();
var mapKeyDraggableEl = new Map();
var gui = require('nw.gui');
document.addEventListener('DOMContentLoaded', function (event) { nodeClientSend.write('mainForm' + '" + spacer + @"' + 'loaded'); });

function firstStart() {
    sendPost('formIsLoaded');
}

nw.Window.get().on('close', function () {
    //alert('Форма закрывается.');
    sendPost('FormClose');
});
		
        </script>
	</head>
	<body>

    </body>
</html>
";
    }
}
