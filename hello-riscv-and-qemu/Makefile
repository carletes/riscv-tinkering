LD_SCRIPT = risc64-virt.ld

.PHONY: all clean
.PRECIOUS: out/%.o

KERNELS = $(patsubst %.s,out/%.elf,$(wildcard *.s))

all: out $(KERNELS) out/qemu-riscv64-virt.dts

out/%.elf: out/%.o $(LD_SCRIPT)
	$(LD) -T $(LD_SCRIPT) -o $@ --no-undefined $<

out/%.o: %.s
	$(AS) -g -o $@ $<

out/qemu-riscv64-virt.dts: out/qemu-riscv64-virt.dtb
	dtc $< > $@

out/qemu-riscv64-virt.dtb:
	$$shell qemu-system-riscv64 -machine virt,dumpdtb=$@

out:
	mkdir $@

clean:
	-rm -rf out
