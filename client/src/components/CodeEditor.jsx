import { useRef, useState } from "react";
import { Box, HStack, Text } from "@chakra-ui/react";
import { Editor } from "@monaco-editor/react";
import Output from "./Output";

const CodeEditor = () => {
    const editorRef = useRef();
    const [value, setValue] = useState("");
    const codeSnippet = `#include <stdio.h>

int main() {
  // Your code goes here
  
  return 0;
}`;
    const [language, setLanguage] = useState("c");

    const onMount = (editor) => {
        editorRef.current = editor;
        editor.focus();
    };

    return (
        <Box>
            <HStack spacing={4}>
                <Box w="50%">
                    <Text mb={2} fontSize="lg">
                        Language
                    </Text>
                    <Text mb={2} fontSize="lg">
                        C
                    </Text>
                    <Editor
                        options={{
                            minimap: {
                                enabled: false,
                            },
                        }}
                        height="75vh"
                        theme="vs-dark"
                        language={language}
                        defaultValue={codeSnippet}
                        onMount={onMount}
                        value={value}
                        onChange={(value) => setValue(value)}
                    />
                </Box>
                <Output editorRef={editorRef} language={language} />
            </HStack>
        </Box>
    );
};
export default CodeEditor;