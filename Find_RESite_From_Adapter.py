# coding=utf-8
# usage ` python adapter中的酶切位点信息统计.py adapter序列 酶切序列`
# adapter序列和酶切序列文件包含两列，名称和序列
# 结果包含3列，adapter名称 含有的酶切位点 存在的位置
import sys

def find():
    adapter_file = sys.argv[1]
    eny_file = sys.argv[2]
    one = open(adapter_file, mode="r")
    two = open(eny_file, mode="r")
    list_o = []
    list_t = []
    for o_line in one:
        os_sample = o_line.strip("\r\n").split("\t")
        list_o.append(os_sample)
    for t_line in two:
        ts_sample = t_line.strip("\r\n").split("\t")
        if len(ts_sample[1]) <= 8:
            list_t.append(ts_sample)
    for o in list_o:
        for t in list_t:
            if t[1] in o[1]:
                loca = int(o[1].find(t[1])) + 1
                print(o[0], t[0], loca, sep="\t")

if __name__ == "__main__":
    find()
