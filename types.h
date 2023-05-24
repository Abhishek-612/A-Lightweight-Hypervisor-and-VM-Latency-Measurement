#ifndef __TYPES_H__
#define __TYPES_H__

#ifdef __linux__
#include <linux/types.h>
#include <linux/version.h>

typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

#endif

#endif 