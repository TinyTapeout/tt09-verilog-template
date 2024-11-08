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
    assert(dut.uo_out[7] == 0)
    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 1)  # Stabilize after reset

    dut._log.info("PWM enabled")
    dut.ui_in.value = (1 << 7)
    await ClockCycles(dut.clk, 50)  # Wait 5000 µs

    # Test different duty cycle settings as per VHDL testbench
    for duty, wait_time in [(1, 50), (2, 50), (16, 50), (32, 50), (62, 50), (63, 50)]:
        # Update ui_in[5:0] by clearing lower bits and setting duty cycle
        dut.ui_in.value = duty + (1 << 7)
        dut._log.info(f"Setting ui_in[5:0] to {duty:06b}")
        await ClockCycles(dut.clk, int(wait_time * 10))  # Convert µs to clock cycles at 100 KHz

        # Test different duty cycle settings as per VHDL testbench
    for duty, wait_time in [(1, 50), (2, 50), (16, 50), (32, 50), (62, 50), (63, 50)]:
        # Update ui_in[5:0] by clearing lower bits and setting duty cycle
        dut.ui_in.value = duty + (1 << 7) + (1 << 6)
        dut._log.info(f"Setting ui_in[5:0] to {duty:06b}")
        await ClockCycles(dut.clk, int(wait_time * 100))  # Convert µs to clock cycles at 100 KHz

    dut._log.info("Test completed successfully.")
