# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge


@cocotb.test()
async def test_project(dut):
    dut._log.info("Starting test_project")

    # Set the clock period to 10 µs (100 KHz)
    clock = Clock(dut.clk, 100, units="ns")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Applying reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 50)  # Reset for 500 µs
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 1)  # Stabilize after reset

    # Set initial inputs as per VHDL testbench
    dut.ui_in.value = 0b00000110  # ui_in[5:0] = 6 (~10% duty cycle), ui_in[6] = 0, ui_in[7] = 0
    dut._log.info("Initial input applied: PWM disabled")

    # Test 1: Disable the system and observe initial output
    await ClockCycles(dut.clk, 1)  # Wait 1000 µs

    # Enable PWM by setting bit 7 of ui_in
    dut.ui_in.value |= 1 << 7
    await ClockCycles(dut.clk, 50)  # Wait 5000 µs
    dut._log.info("PWM enabled")

    # Test different duty cycle settings as per VHDL testbench
    for duty, wait_time in [(1, 50), (2, 50), (16, 50), (32, 50), (63, 50)]:
        # Update ui_in[5:0] by clearing lower bits and setting duty cycle
        dut.ui_in.value = (dut.ui_in.value & ~0b00111111) | duty
        dut._log.info(f"Setting ui_in[5:0] to {duty:06b}")
        await ClockCycles(dut.clk, int(wait_time * 10))  # Convert µs to clock cycles at 100 KHz

    # Additional tests from VHDL sequence
    # Disable bit 6
    dut.ui_in.value |= (1 << 6)
    await ClockCycles(dut.clk, 50000)  # Wait 50000 µs
    # Set ui_in[5:0] to 32
    dut.ui_in.value = (dut.ui_in.value & ~0b00111111) | 32
    await ClockCycles(dut.clk, 50000)  # Wait 50000 µs
    # Set ui_in[5:0] to 48
    dut.ui_in.value = (dut.ui_in.value & ~0b00111111) | 48
    await ClockCycles(dut.clk, 50000)  # Wait 50000 µs
    # Set ui_in[5:0] to 1
    dut.ui_in.value = (dut.ui_in.value & ~0b00111111) | 1
    await ClockCycles(dut.clk, 50000)  # Wait 500 µs

    # Test 3: Disable PWM and observe output
    dut.ui_in.value &= ~(1 << 7)  # Disable PWM by clearing bit 7
    await ClockCycles(dut.clk, 5)  # Wait 500 µs
    dut._log.info("Test completed successfully.")
