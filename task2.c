#include <stdio.h>
#include <unistd.h>


int main(int argc, char **argv) 
{
    for (int i = 0; i < 10; i++) 
	{
		pid_t child_pid = fork();
		if (child_pid == 0) 
		{
			sleep(5);
			return 0;
		} 
		printf("PID_Child = %d\n", child_pid);
	}
	execl("/bin/ps", "ls", "-a", NULL);
	
}