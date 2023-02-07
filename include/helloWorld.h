#include<iostream>
#include<thread>

class HelloWorld
{
public:
	static void hello()
	{
		std::cout << "Hello World in Concurrent Fashion\n";

	}

	static void MAIN()
	{
		std::thread t(hello);
		t.join();
	}

};