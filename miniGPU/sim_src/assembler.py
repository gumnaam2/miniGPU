import sys
from init_matrices import init_matrices
def assemble(progfile):
    ops = {
        "NOP":   "0000",
        "BRNZP": "0001",
        "CMP":   "0010",
        "ADD":   "0011",
        "SUB":   "0100",
        "MUL":   "0101",
        "DIV":   "0110",
        "LDR":   "0111",
        "STR":   "1000",
        "CONST": "1001",
        "BAND":  "1010",
        "BOR":   "1011",
        "BXOR":  "1100",
        "BNOT":  "1101",
        "RET":   "1111"
    }
    with open(progfile, "r") as prog:
        lines = [[x.upper() for x in line.split()] for line in prog.readlines()]
        outlines = []
        for line in lines:
            print(line)
            outline = []
            outline.append(ops[line[0]])
            if line[0] == "NOP":
                outline.append("0"*8)
            elif line[0] == "BRNZP":
                outline.append(line[1] + "0")
                outline.append(format(int(line[2], 10), '08b'))
            elif line[0] == "CMP":
                outline.append("0"*4)
                outline.append(format(int(line[1], 10), "04b"))
                outline.append(format(int(line[2], 10), "04b"))
            elif line[0] in ["ADD", "SUB", "MUL", "DIV", "BAND", "BOR", "BXOR"]:
                outline.append(format(int(line[1], 10), "04b"))
                outline.append(format(int(line[2], 10), "04b"))
                outline.append(format(int(line[3], 10), "04b"))
            elif line[0] in ["LDR", "BNOT"]:
                outline.append(format(int(line[1], 10), "04b"))
                outline.append(format(int(line[2], 10), "04b"))
                outline.append("0"*4)
            elif line[0] == "STR":
                outline.append("0"*4)
                outline.append(format(int(line[1], 10), "04b"))
                outline.append(format(int(line[2], 10), "04b"))
            elif line[0] == "CONST":
                outline.append(format(int(line[1], 10), "04b"))
                outline.append(format(int(line[2], 10), "08b"))
            elif line[0] == "RET":
                outline.append("0"*12)
            print(outline)
            outlines.append(''.join(outline))
    with open("program.txt", "w") as outf:
        for line in outlines:
            outf.write(''.join(line) + "\n") 
    init_matrices("data.txt")
    return outlines
#print(assemble("test_prog.txt", "program.txt"))
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python assembler.py <input_progfile>")
        sys.exit(1)
    assemble(sys.argv[1])