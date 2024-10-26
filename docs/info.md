<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

A basic PWM controller. ui[5:0] control the reference, ui[6] changes from manual reference to a sinusoidal reference, and ui[7] enables output when high. PWM is output on uo[7].

## How to test

Set ui[7] to high. Measure the output on uo[7]. FLip the other inpt switches and see what happens!

## External hardware

None, but an LED would be nice.
