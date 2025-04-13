import subprocess
import os

def test_cuda():
    print("Testing CUDA installation...")

    # Test 1: Check nvcc version
    print("\n1. nvcc version check:")
    nvcc_path = None
    try:
        nvcc_path_bytes = subprocess.check_output(['which', 'nvcc'])
        nvcc_path = nvcc_path_bytes.decode('utf-8').strip()
        print(f"nvcc found at: {nvcc_path}")
        nvcc_version_bytes = subprocess.check_output([nvcc_path, '--version'])
        nvcc_version = nvcc_version_bytes.decode('utf-8')
        print(nvcc_version)
    except (subprocess.CalledProcessError, FileNotFoundError):
        print("nvcc not found in PATH or failed to execute")
        return False
    except Exception as e:
        print(f"Error checking nvcc: {e}")
        return False

    # Test 2: Simple CUDA program compilation and execution
    print("\n2. CUDA program compilation & execution test:")
    test_cu_content = '''
#include <cuda_runtime.h>
#include <stdio.h>

__global__ void hello() {
    // Only print from one thread to avoid spamming
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        printf("Hello from GPU!\\n");
    }
}

int main() {
    int deviceCount = 0;
    cudaError_t error_id = cudaGetDeviceCount(&deviceCount);

    if (error_id != cudaSuccess) {
        printf("cudaGetDeviceCount returned %d -> %s\\n", (int)error_id, cudaGetErrorString(error_id));
        printf("Ensure container was run with GPU support (e.g., --gpus all or docker-compose deploy section)!\\n");
        return 1; // Exit with error
    }

    if (deviceCount == 0) {
        printf("No CUDA devices found. Ensure container was run with GPU support.\\n");
        return 1; // Exit with error
    }

    printf("Found %d CUDA device(s).\\n", deviceCount);
    printf("Attempting kernel launch...\\n");
    hello<<<1,1>>>();
    error_id = cudaGetLastError(); // Check for kernel launch errors immediately
    if (error_id != cudaSuccess) {
        printf("Kernel launch failed: %s\\n", cudaGetErrorString(error_id));
        return 1;
    }

    error_id = cudaDeviceSynchronize(); // Wait for kernel and check sync errors
    if (error_id != cudaSuccess) {
        printf("cudaDeviceSynchronize failed after kernel launch: %s\\n", cudaGetErrorString(error_id));
        return 1;
    }

    printf("CUDA kernel executed successfully.\\n");
    return 0; // Success
}
'''
    compile_success = False
    run_success = False
    test_cu_file = 'test.cu'
    test_exe_file = 'test'

    try:
        # Create a minimal CUDA program
        with open(test_cu_file, 'w') as f:
            f.write(test_cu_content)

        # Compile
        print(f"Compiling {test_cu_file}...")
        compile_cmd = [nvcc_path, test_cu_file, '-o', test_exe_file]
        compile_result = subprocess.run(compile_cmd, capture_output=True, text=True, check=False) # Don't check=True here

        if compile_result.returncode != 0:
            print(f"CUDA compilation failed (return code {compile_result.returncode}):")
            print("--- STDOUT ---")
            print(compile_result.stdout)
            print("--- STDERR ---")
            print(compile_result.stderr)
            print("--------------")
            return False # Stop if compilation fails
        else:
            print("CUDA program compiled successfully.")
            compile_success = True

        # Execute
        if compile_success:
            print(f"Executing compiled program ./{test_exe_file}...")
            run_cmd = [f'./{test_exe_file}']
            # Use check=False to handle non-zero exit codes from the test program itself
            run_result = subprocess.run(run_cmd, capture_output=True, text=True, check=False)

            print("--- Program Output Start ---")
            print(run_result.stdout)
            if run_result.stderr:
                print("--- Program Error Output Start ---")
                print(run_result.stderr)
                print("--- Program Error Output End ---")
            print("--- Program Output End ---")

            if run_result.returncode == 0:
                print(f"CUDA program exited successfully (return code {run_result.returncode}).")
                run_success = True
            else:
                # This is expected if cudaGetDeviceCount fails, etc.
                print(f"CUDA program execution failed (return code {run_result.returncode}). See output above for details.")
                run_success = False

    except FileNotFoundError:
        print(f"Error: Command not found during compilation/execution (nvcc or ./test). Check PATH.")
        return False
    except Exception as e:
        print(f"An unexpected error occurred during compilation/execution: {e}")
        return False
    finally:
        # Clean up
        for f in [test_cu_file, test_exe_file]:
            if os.path.exists(f):
                try:
                    os.remove(f)
                except OSError as e:
                    print(f"Warning: Could not remove temporary file {f}: {e}")

    return compile_success and run_success

if __name__ == "__main__":
    success = test_cuda()
    print("\n--------------------")
    print("Test result:", "SUCCESS" if success else "FAILURE")
    print("--------------------")
    # Exit with appropriate code for automation
    exit(0 if success else 1)
