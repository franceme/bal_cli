import ballerina/io;


//Paramenters and default values
//https://ballerina.io/learn/by-example/function-pointers

//CLI Help
//> //1) https://ballerina.io/learn/by-example/configuring-via-cli
//> //2) https://ballerina.io/learn/provide-values-to-configurable-variables/#provide-via-command-line-arguments
//3) https://ballerina.io/learn/by-example/main-function
//*) https://central.ballerina.io

//> //Default value with John
//> configurable string name = "John";

public function main(string[] values=[]) {
    string keyname="";
    string keyvalue="";
    string keyprefix="=";

    map<string> arguments = {};

    foreach string value in values {
        if value.startsWith(keyprefix) && keyname == "" {
            io:println(value);
            keyname=value.substring(1,value.length());
            io:println(keyname);
        }
        else if keyname != "" {
            arguments[keyname] = value;
            io:println(value);
            keyname="";
        }
    }
    io:println(arguments);
}
