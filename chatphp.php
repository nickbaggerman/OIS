<?php
// Check if the input parameter is set in the query string
if (isset($_GET['input'])) {
    // Get the user input from the query parameters
    $userInput = $_GET['input'];

    // Translate the user input
    $inputthroughpy = exec("python chatpy.py $userInput ");

    // Output the translated text
    echo $inputthroughpy;
}
?>