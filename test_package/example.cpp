#include <iostream>
#include <cli/cli.h>

using namespace cli;
using namespace std;

int main()
{
    // setup cli

    auto rootMenu = make_unique< Menu >( "cli" );
    rootMenu->Add(
        "hello",
        [](std::ostream& out){ out << "Hello, world\n"; },
        "Print hello world" );
    return 0;
}
