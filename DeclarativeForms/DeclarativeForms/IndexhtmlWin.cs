namespace osdf
{
    public class IndexhtmlWin
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
var gui = require('nw.gui');
//document.addEventListener('DOMContentLoaded', function (event) { sleep(1000); sendPost('mainForm' + '" + spacer + @"' + 'loaded'); });

function getReceiveClient()
{
    var receiveClient1 = new WebSocket('ws://127.0.0.1:" + DeclarativeForms.portSendServer + @"/');
    receiveClient1.onopen = function(event) { receiveClient1.send('Hello from receiveClient'); };
    receiveClient1.onmessage = function (event)
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
    receiveClient1.onclose = function (event) {
        setTimeout(function() {
            receiveClient1 = new WebSocket('ws://127.0.0.1:" + DeclarativeForms.portSendServer + @"/');
        }, 2);
    };
    receiveClient1.onerror = function (error) {
	    //alert('websocket error ' + error);
    };
    return receiveClient1;
}
function getSendClient()
{
    var sendClient1 = new WebSocket('ws://127.0.0.1:" + DeclarativeForms.portReceivingServer + @"/');
    sendClient1.onopen = function(event) { 
        sendClient1.send('mainForm' + '" + spacer + @"' + 'loaded'); 
    };
    sendClient1.onmessage = function (event)
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
    sendClient1.onclose = function (event) {
        setTimeout(function() {
            sendClient1 = new WebSocket('ws://127.0.0.1:" + DeclarativeForms.portReceivingServer + @"/');
        }, 2);
    };
    sendClient1.onerror = function (error) {
	    alert('websocket error ' + error);
    };
    return sendClient1;
}
function sleep(milliseconds) {
    const date = Date.now();
    let currentDate = null;
    do {
        currentDate = Date.now();
    } while (currentDate - date < milliseconds);
}
nw.Window.get().on('close', function () {
    gui.App.quit();
});
function firstStart() {
    sendPost('formIsLoaded');
}

var sendClient = getSendClient();
var receiveClient = getReceiveClient();

        </script>
	</head>
	<body>

    </body>
</html>
";
    }
}
