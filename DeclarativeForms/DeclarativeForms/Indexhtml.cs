namespace osdf
{
    public class Indexhtml
    {
        public static string indexhtml = @"<!DOCTYPE html>
<html>
	<head>
		<meta content=""text/html; charset=utf-8"" http-equiv=""Content-Type"">

		<script type=""text/javascript"">
            window.addEventListener(""error"", function (event) { alert(event.message + '\n' + event.filename); });
        </script>

		<script type=""text/javascript"" src=""main.js""></script>
	</head>
	<body>

    </body>
</html>
";
	}
}
