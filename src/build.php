<?php

/**
 * Loads files from the given paths and processes them.
 *
 * @param array $paths Array of file paths to load.
 * @return array Processed file contents.
 */
function loadAndProcessFiles(array $paths): array {
    $processedFiles = [];

    foreach ($paths as $path) {
        $fileContent = file_get_contents(__DIR__ . "/{$path}");
        if ($fileContent === false) {
            throw new Exception("Failed to read file: {$path}");
        }

        $fileParts = explode('<?php', $fileContent);
        if (empty($fileParts[0])) {
            unset($fileParts[0]);
        }

        $processedFiles[] = implode('<?php', $fileParts);
    }

    return $processedFiles;
}

try {
    $files = include __DIR__ . '/files.php';

    $additionalFiles = loadAndProcessFiles($files['additional']);
    $globalFiles = loadAndProcessFiles($files['global']);

    $loaderContent = file_get_contents(__DIR__ . '/loader.sh');
    if ($loaderContent === false) {
        throw new Exception("Failed to read loader.sh");
    }

    $data = $loaderContent . "\n\n<?php\n" . implode("\n\n", $additionalFiles) . "\n\nnamespace { " . implode("\n\n", $globalFiles) . "\n}";

    $startFilePath = dirname(__DIR__) . '/start';
    if (file_put_contents($startFilePath, $data) === false) {
        throw new Exception("Failed to write to start file: {$startFilePath}");
    }

    $testStartFilePath = '/home/JohncenaPenguinJizz/RumNotDead/test/start';
    if (file_put_contents($testStartFilePath, $data) === false) {
        throw new Exception("Failed to write to test start file: {$testStartFilePath}");
    }

    echo "Files processed and saved successfully.";
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
