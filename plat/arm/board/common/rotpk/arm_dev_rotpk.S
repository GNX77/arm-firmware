/*
 * Copyright (c) 2021-2022, ARM Limited. All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/* corstone1000 platform provides custom values for the macros defined in
 * arm_def.h , so only platform_def.h needs to be included
 */
#if !defined(TARGET_PLATFORM_FVP) && !defined(TARGET_PLATFORM_FPGA)
#include "plat/arm/common/arm_def.h"
#else
#include <platform_def.h>
#endif

	.global arm_rotpk_header
	.section .rodata.arm_rotpk_hash, "a"

arm_rotpk_header:
	.byte 0x30, 0x31, 0x30, 0x0D, 0x06, 0x09, 0x60, 0x86, 0x48
	.byte 0x01, 0x65, 0x03, 0x04, 0x02, 0x01, 0x05, 0x00, 0x04, 0x20
arm_rotpk_header_len:

#ifdef ARM_ROTPK_HASH
	.global arm_rotpk_hash_end
	.incbin ARM_ROTPK_HASH
arm_rotpk_hash_end:
#endif

.if ARM_ROTPK_HEADER_LEN != arm_rotpk_header_len - arm_rotpk_header
.error "Invalid ROTPK header length."
.endif
