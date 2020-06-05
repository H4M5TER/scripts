#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

void LogAndDo(string cmd)
{
    ofstream log("cmd.log", ios::out | ios::app);
    cout << cmd << "\n" << endl;
    log << cmd << endl;
    system(cmd.c_str());
    log.close();
    return ;
}

int main()
{
    setlocale(LC_ALL, "");
    ifstream file("filelist.txt", ios::in);
    if (!file.is_open())
    {
        cout << "在同目录下新建filelist.txt, 按顺序输入拼接的文件名以使用本程序\n";
        cin.get();
        return 0;
    }        
    string cmd = "ffmpeg -i \"concat:";
    for (string name; getline(file, name, '.'); )
    {
        LogAndDo("ffmpeg -i " + name + ".mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts " + name + ".ts");
        cmd = cmd + name + ".ts|";
        getline(file, name);
    }
    cmd.erase(cmd.end() - 1);
    cmd = cmd + "\" -c copy -bsf:a aac_adtstoasc -f mp4 output.mp4";
    LogAndDo(cmd);
    cin.get();
    file.close();
    return 0;
}
