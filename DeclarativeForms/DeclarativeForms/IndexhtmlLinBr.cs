namespace osdf
{
    public class IndexhtmlLinBr
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
    else
    {
        sendPost(mapElKey.get(event.target) + '" + spacer + @"' + event.type);
    }
}
function sendPost(str)
{
    try
    {
	    sendClient.send(str);
    }
    catch
    {
    }
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

var mapKeyEl = new Map();
var mapElKey = new Map();

document.addEventListener('DOMContentLoaded', function (event) { sendPost('mainForm' + '" + spacer + @"' + 'loaded'); });

var sendClient = new WebSocket('ws://127.0.0.1:" + DeclarativeForms.portReceivingServer + @"/');
sendClient.onopen = function(event) { sendClient.send('mainForm' + '" + spacer + @"' + 'loaded'); };
sendClient.onmessage = function (event)
{
    var input = event.data;
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
sendClient.onclose = function (event) {
    setTimeout(function() {
        sendClient = new WebSocket('ws://127.0.0.1:" + DeclarativeForms.portReceivingServer + @"/');
    }, 2);
};
sendClient.onerror = function (error) {
	//alert('websocket error ' + error);
};

window.onbeforeunload = function(){
    let str = 'При обновлении страницы или переходе по ссылке в этом окне программа будет перезапущена или закрыта соответственно. Введенные данные могут не сохраниться.';
    setTimeout(function(){ alert(str); }, 1);
    if (event.target.nodeName.toLowerCase() === 'a')
    {
        return;
    }
    else
    {
        setTimeout(function(){ alert(str); }, 1);
        return false; // отменить действие браузера (переход по ссылке)
    }
};

window.addEventListener('resize', function(event) {
    sendPost('mainForm' + 
    '" + spacer + @"' + 'resize' + 
    '" + spacer + @"WindowWidth=' + window.innerWidth + 
    '" + spacer + @"WindowHeight=' + window.innerHeight);
}, true);

//setTimeout(function(){ alert('Не обновляйте страницу во время работы программы. Это вызовет перезапуск программы. Введенные данные могут не сохраниться.'); }, 1);

var receiveClient = new WebSocket('ws://127.0.0.1:" + DeclarativeForms.portSendServer + @"/');
receiveClient.onopen = function(event) { receiveClient.send('Hello from receiveClient'); };
receiveClient.onmessage = function (event)
{
    var input = event.data;
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
receiveClient.onclose = function (event) {
    setTimeout(function() {
        receiveClient = new WebSocket('ws://127.0.0.1:" + DeclarativeForms.portSendServer + @"/');
    }, 2);
};
receiveClient.onerror = function (error) {
	//alert('websocket error ' + error);
};
function firstStart() {
    sendPost('formIsLoaded');
}

        </script>
	</head>
	<body>

    </body>
</html>
";
    }
}
