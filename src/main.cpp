#include <iostream>
#include "spdlog/spdlog.h"

int main(){
    std::cout << "Hallo" <<std::endl;
    spdlog::warn("Hallo Hallo Hallo");
    return 0;
}