const express = require('express');
const bodyParser = require('body-parser');
const { exec } = require('child_process');
const cors = require('cors');
const fs = require('fs');
const path = require('path');
require("dotenv").config();

const app = express();
const port = process.env.PORT;
console.log("your port = "+port);

app.use(bodyParser.json());
app.use(cors());

app.post('/compile', (req, res) => {
    const { sourceCode, userInput } = req.body;

    const filePath = path.join(__dirname, 'temp.c');
    const inputFile = path.join(__dirname, 'input.txt');
    const llvmIRFile = path.join(__dirname, 'intermediate.ll');
    const lexerFile = path.join(__dirname, 'lexer.l');
    const parserFile = path.join(__dirname, 'parser.y');
    const execCommand = `clang -o parserOutput ${filePath}`;
    const llvmCommand = `clang -S -emit-llvm -o ${llvmIRFile} ${filePath}`;
    const assembly = `llc -filetype=asm ${llvmIRFile}`;
    const generateOut = `parserOutput.exe < ${inputFile}`;
    const flexCommand = `flex ${lexerFile}`;
    const bisonCommand = `bison -d -v ${parserFile}`;
    
    fs.writeFileSync(filePath, sourceCode, 'utf8');
    fs.writeFileSync(inputFile, userInput, 'utf8');

    exec(flexCommand, (flexError, flexStdout, flexStderr) => {
        if (flexError) {
            console.log("Error in flexCommand:", flexStderr || flexError.message);
            res.json({ stderr: flexStderr || flexError.message });
            return;
        }

        exec(bisonCommand, (bisonError, bisonStdout, bisonStderr) => {
            if (bisonError) {
                console.log("Error in bisonCommand:", bisonStderr || bisonError.message);
                res.json({ stderr: bisonStderr || bisonError.message });
                return;
            }
                exec(execCommand, (error, execStdout, execStderr) => {
                    if (error) {
                        console.log("Error in execCommand:", execStderr || error.message);
                        res.json({ stderr: execStderr || error.message });
                        return;
                    }

                    exec(llvmCommand, (llvmError, llvmStdout, llvmStderr) => {
                        if (llvmError) {
                            console.log("Error in llvmCommand:", llvmStderr || llvmError.message);
                            res.json({ stderr: llvmStderr || llvmError.message });
                            return;
                        }

                        exec(assembly, (runError, runStdout, runStderr) => {
                            if (runError) {
                                console.log("Error in assembly command:", runStderr || runError.message);
                                res.json({ stderr: runStderr || runError.message });
                                return;
                            }

                            exec(generateOut, (outError, outStdout, outStderr) => {
                                if (outStderr) {
                                    console.log("Error in generateOut command:", outStderr || outError.message);
                                    res.json({ stderr: outStderr || outError.message });
                                    return;
                                }

                                res.json({
                                    output: outStdout,
                                    llvmOutput: llvmStdout,
                                    asmOutput: runStdout
                                });
                            });
                        });
                    });
                });
            });
        // });
    });
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
