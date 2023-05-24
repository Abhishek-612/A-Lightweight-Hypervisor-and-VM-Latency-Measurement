#ifndef __VMM_API_H__
#define __VMM_API_H__

#include "types.h"

typedef struct vmpage {
        char *p;
        uintptr_t pa;

    struct page *page;
} vmpage_t;


typedef unsigned long irq_flags_t;


#ifdef __cplusplus
extern "C" {
#endif

int allocate_vmpage(vmpage_t *p);
void free_vmpage(vmpage_t *p);

void vmlatency_preempt_disable(irq_flags_t *irq_flags);
void vmlatency_preempt_enable(irq_flags_t *irq_flags);

void vmlatency_printm(const char *fmt, ...);

#ifdef __cplusplus
}
#endif

#define vmlatency_printk(...) vmlatency_printm("[vmlatency] " __VA_ARGS__)

#endif /* __VMM_API_H__*/