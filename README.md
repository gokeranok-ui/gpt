# MATLAB-generated fuzzy inference on STM32F469

This repository contains the STM32F469 firmware studied in Goker ARIYAK’s paper, *Reusable MATLAB-Generated Fuzzy Inference for Embedded Electronics: Integration in C and C++*. Section 6 and Table 10 identify the project at [commit 65209fe](https://github.com/gokeranok-ui/gpt/tree/65209fef3511e48a088f6ba5c06afdf459537119). The paper and its public supporting files are also available through the [article reading page](https://gokeranok-ui.github.io/prey-predator/) and [prey–predator repository](https://github.com/gokeranok-ui/prey-predator).

## Follow the inference call

The generated C entry point, `opkene`, accepts a model filename and a vector of numeric inputs, then writes the inferred values to an output vector. At the cited commit, the board adapter recognizes the filename `fismat.fis` and serves an embedded copy of that model from memory. This lets the generated parser read the model through a file interface on the board.

| Where to look | What you will find |
| --- | --- |
| [opkene.c](gpt/Core/Src/opkene.c) and [opkene.h](gpt/Core/Inc/opkene.h) | The generated inference entry point and its C declaration. |
| [Model parser](gpt/Core/Src/readFISAsHomogenousStructure.c) and [evaluator](gpt/Core/Src/evaluateFIS.c) | How the runtime reads the fuzzy inference system and evaluates it. |
| [File adapter](gpt/Core/Src/fis_virtual_fs.c) and [embedded model](gpt/Core/Src/fis_blob.c) | How the filename resolves to model bytes in memory. |
| [main.c](gpt/Core/Src/main.c), [STM32Cube configuration](gpt/gpt.ioc), and [FatFs](gpt/FATFS/) | Board initialization, peripheral configuration, and the filesystem integration directory. |

## Original generated code and later firmware

The paper compares the original MATLAB Coder output with a later STM32F469 working version. Both are in the [public source ZIP](https://github.com/gokeranok-ui/prey-predator/raw/refs/heads/main/Fuzzy_Inference_Source.zip).

- Open `02_original_core/` for the 107 generated C source and header files used as the comparison baseline.
- Open `03_stm32f469/Core/Src/fis_virtual_fs.c` for the later adapter that loads a `.fis` file from an SD card through FatFs. The adjacent `main.c` shows the board application that uses it.

## Citation and contact

If you use the firmware, generated code, or comparison in your work, please cite the accompanying paper. Thank you for acknowledging this research.

Goker Ariyak. “Reusable MATLAB-Generated Fuzzy Inference for Embedded Electronics: Integration in C and C++.” *Electronics* 15(22), 5297 (2026). [DOI 10.3390/electronics15225297](https://doi.org/10.3390/electronics15225297)

[Email Goker ARIYAK](https://gokeranok-ui.github.io/prey-predator/#contact)
