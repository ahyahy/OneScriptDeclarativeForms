namespace osdf
{
    public class MesBoxhtml
    {
        public static string mesboxhtml = @"<!DOCTYPE html>
<html>
	<head>
		<meta content='text/html; charset=utf-8' http-equiv='Content-Type'>
		<link rel='stylesheet' href='" + DeclarativeForms.CSSPath + @"' />

		<script type='text/javascript'>
            window.addEventListener('error', function (event) { alert(event.message + '\n' + event.filename); });
        </script>
	</head>

    <body style=""-webkit-app-region: drag; padding-top: 0px; margin-top: 0; margin-right: 0; margin-left: 0; overflow: hidden;"">

    </body>
</html>
";
    }
}
