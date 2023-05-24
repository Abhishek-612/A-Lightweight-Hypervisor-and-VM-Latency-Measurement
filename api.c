#include <linux/slab.h>
#include <linux/types.h>
#include <linux/highmem.h>
#include <asm/io.h>

#include "api.h"

int
allocate_vmpage(vmpage_t *p)
{
        p->page = alloc_page(GFP_KERNEL | __GFP_ZERO);
        if (!p->page)
                return -1;

        p->p = kmap(p->page);
        p->pa = page_to_phys(p->page);
        return 0;
}

void free_vmpage(vmpage_t *p)
{
        kunmap(p->page);
        __free_page(p->page);
        p->page = NULL;
        p->p = NULL;
        p->pa = 0;
}

void
vmlatency_printm(const char *fmt, ...)
{
        va_list va;
        va_start(va, fmt);
        vprintk(fmt, va);
        va_end(va);
}

void
vmlatency_preempt_disable(unsigned long *irq_flags)
{
        preempt_disable();
        local_irq_save(*irq_flags);
}

void
vmlatency_preempt_enable(unsigned long *irq_flags)
{
        local_irq_restore(*irq_flags);
        preempt_enable();
}