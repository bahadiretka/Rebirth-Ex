#include<iostream>
#include<fstream>
#include<vector>
#include<string>

using namespace std;

int main(){

    string fileName = "your-message-text-file-name.txt";
    
    string line;
    string token;

    string firstPerson = "first-person-name";
    string secondPerson = "second-person-name"; 
    string currentPerson;

    vector<string> firstPersonQueue;
    vector<string>secondPersonQueue;

    string person;
    string messageText;
    
    int iterateCounter = 0;
    int changes = 0;

    fstream file(fileName,ios::in);

    string str = fileName.substr(0,fileName.find("."));

    string outFileName = "formatted_" + str + ".csv";
    
    fstream outFile(outFileName,ios::out);
    if(file.is_open()){
        while(getline(file,line)){

            token = line.substr(line.find("-")+2); // date is ignored.
             
            person = token.substr(0,token.find(":"));
            
            messageText = token.substr(token.find(":")+2);
            if(iterateCounter == 0){
                currentPerson = person;
            }else{
                if(currentPerson != person){
                    changes++;
                    currentPerson = person;
                }
                if(changes > 1){ 
                   for(auto i: firstPersonQueue)
                        outFile << i << " ";
                    outFile << ",";
                    for(auto i: secondPersonQueue)
                        outFile << i << " ";
                    outFile << "\n";
                    firstPersonQueue.clear();
                    secondPersonQueue.clear();
                    changes = 0;
                }
            }
            if(person == firstPerson){
               firstPersonQueue.push_back(messageText);
            }else{
                secondPersonQueue.push_back(messageText);
            }
            iterateCounter++;
        }
        
    }
    else{
        cerr << fileName << " could not opened successfully!\n";
    }
    file.close();
    outFile.close();

    return 0;
}