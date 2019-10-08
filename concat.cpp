#include <iostream>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

void LogAndDo(string command)
{
    ofstream log("command.log", ios::out | ios::app);
    cout << command << "\n" << endl;
    log << command << endl;
    system(command.c_str());
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
    string command = "ffmpeg -i \"concat:";
    for (string name; getline(file, name, '.'); )
    {
        LogAndDo("ffmpeg -i " + name + ".mp4 -c copy -bsf:v h264_mp4toannexb -f mpegts " + name + ".ts");
        command = command + name + ".ts|";
        getline(file, name);
    }
    command.erase(command.end() - 1);
    command = command + "\" -c copy -bsf:a aac_adtstoasc -f mp4 output.mp4";
    LogAndDo(command);
    cin.get();
    file.close();
    return 0;
}
