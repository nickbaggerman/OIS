<!DOCTYPE HTML>
<!-- Gemaakt door Benjamin copyright 2023 -->
<html lang=en>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="chatbotcss.css">
</head>
<body>

<div id="container">
    <div id="left">
        <img id="logo" src="Logo.png" alt="OpenAI Logo" width="100%" height="75%">
        <h1 id="logotext"></h1>
    </div>
    <div id="right" s>
        <div id="output">
            <div class="answer"><p style="padding: 10px">Bericht ChatGPT...</p></div>
        </div>
        <input type="text" id="userInput" style="font-size: 20px" placeholder="Typ je bericht...">
        <button onclick="inputPython()" style="font-size: 20px; background-color: rgb(0,128,0, 0.4)">Stuur bericht</button>
    </div>
</div>  

<script>
    function inputPython() {
        // Change Gif
        var imgElement = document.getElementById("logotext");
        //gifElement.src = "guydenkt.gif";
        imgElement.innerHTML += "Antwoord aan het genereren...";

        // Get the user input from the text field
        var userInput = document.getElementById("userInput").value;
        //var userInput2 = document.getElementById("userInput").value;

        // Send the user input to the PHP script using AJAX
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Append the user input and translated text to the "output" div
                var outputDiv = document.getElementById("output");
                console.log(xhr.responseText);
                outputDiv.innerHTML += "<div class=\"question\"><p style=\"padding: 10px\">" + userInput + "</div><div class=\"answer\"><p style=\"padding: 10px\">" + xhr.responseText + "</div>";
                // Clear the input field
                document.getElementById("userInput").value = "";
                //gifElement.src = "guy.gif";
                imgElement.innerHTML = "";
            }
        };
        xhr.open("GET", "chatphp.php?input=" + encodeURIComponent(userInput), true);
        xhr.send();
    }
</script>

<!-- Deze PHP code werkt niet!!!! 
</?php
// Check if the input parameter is set in the query string
if (isset($_GET['input'])) {
    // Get the user input from the query parameters
    $userInput = $_GET['input'];

    // Translate the user input
    $inputthroughpy = exec("python OpenAI.py $userInput ");

    // Output the translated text
    echo $inputthroughpy;
}
?>
-->

</body>
</html>