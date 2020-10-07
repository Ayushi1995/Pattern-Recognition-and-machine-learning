# Pattern-Recognition-and-machine-learning

The goal of this  project is to design and build a pattern recognition system capable of recognizing  simple melodies, using hidden Markov models (HMMs).  Within the project, I have developed and tested a MatLab
pattern recognition toolbox based on HMMs. 

The exercise project consists of  following five steps 

[A1. HMM signal](#a1-hmm-signal-Source)

[A2. Feature extraction](#a2-feature-extraction)

[A3. Algorithm implementation](#a3-algorithm-implementation)

[A4. Code verification and signal database](#a4-code-verification-and-signal-database)

[A5. System demonstration](#a5-system-demonstration)

## Required Software

MATLAB R2019b

## Installations

`$ git clone https://github.com/Ayushi1995/Pattern-Recognition-and-machine-learning.git`

## A1 HMM Signal Source

In this first project assignment we discover how an HMM can generate a sequence with a kind of structured randomness that is typical of many real-life signals.

Task is to code and verify MatLab methods to generate an output sequence of random real numbers x = (x1 . . . xt . . . xT ) from an HMM with scalar Gaussian output distributions.

In **All Classes** code package three different functions are involved in the process:

1. @DiscreteD/rand 
2. @MarkovChain/rand 
3. @HMM/rand .

Further information is documented in the Folder **A1 HMM Signal Source** 

## A2 Feature extraction

This project assignment is on feature extraction for the recognizer. A system capable of recognizing short hummed, played, or sung melodies designed. Code and the detail feature extraction Design is explained in the the folder **A2 Feature Extraction**

## A3 Algorithm implementation

Implementation of HMM algorithm: The Forward Algorithm

In the **All Classes** folder the Forward Algorithm is a method of the MarkovChain class (@MarkovChain/forward). Results and code explanation are documented in the folder **A3 Algorithm Implementation**.

## A4 Code verification and signal database

Implementation of HMM Algorithm: The Backward Algorithm

In the **All Classes** folder the backward Algorithm is a method of the MarkovChain class (@MarkovChain/backward). Results and code explanation are documented in the folder **A4 Code Verification and Signal Database/Backward Algorithm**.

The next step is to assemble a database of example signals for training and testing final pattern
recognition system. Most fun is probably to design a recognizer that responds well to your
own voice or instrument and performance style. To do this reliably I have recorded my own humming of 10 different songs. Then used audio editing software ([audacity](https://www.audacityteam.org/download/)) to reduce noise and data augmentation by varying pitch, semitones and different parameters. Data is available in the older **A4 Code Verification and Signal Database/classes**.

## A5 System Demonstration

Now that I have verified my toolbox, the final project assignment is to use it to implement a classification system for hummed melodies. Results and code explanation are documented in the folder **System Demonstration**.