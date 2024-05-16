import { useState } from "react";
import { Box, Button, Text, useToast, Textarea } from "@chakra-ui/react";
import axios from "axios";

const Output = ({ editorRef, language }) => {
    const toast = useToast();
    const [output, setOutput] = useState(null);
    const [userInput, setUserInput] = useState('');
    const [isLoading, setIsLoading] = useState(false);
    const [isError, setIsError] = useState(false);

    const runCode = async () => {
        const sourceCode = editorRef.current.getValue();
        if (!sourceCode) return;
        try {
            setIsLoading(true);
            const response = await axios.post(`${import.meta.env.VITE_BACKEND_URL}/compile`, { sourceCode, userInput });

            if (response.data.stderr) {
                setOutput(response.data.stderr);
            }
            else {
                setOutput(response.data.output);
            }
            response.data.stderr ? setIsError(true) : setIsError(false);
        } catch (error) {
            console.log(error);
            toast({
                title: "An error occurred.",
                description: error.message || "Unable to run code",
                status: "error",
                duration: 6000,
            });
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <Box w="50%">
            <Text mb={2} fontSize="lg">
                Input
            </Text>
            <Textarea
                value={userInput}
                onChange={(e) => setUserInput(e.target.value)}
                placeholder="Enter input for the program here..."
                mb={4}
            />
            <Button
                variant="outline"
                colorScheme="green"
                mb={4}
                isLoading={isLoading}
                onClick={runCode}
            >
                Run Code
            </Button>

            <Text mb={2} fontSize="lg">
                Output
            </Text>
            <Box
                height="50vh"
                p={2}
                color={isError ? "red.400" : ""}
                border="1px solid"
                borderRadius={4}
                borderColor={isError ? "red.500" : "#333"}
            >
                {output
                    ? output.split("\n").map((line, i) => <Text key={i}>{line}</Text>)
                    : 'Click "Run Code" to see the output'}
            </Box>
        </Box>
    );
};

export default Output;
