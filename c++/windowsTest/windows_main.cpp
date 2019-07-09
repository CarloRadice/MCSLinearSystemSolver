/*
 * Carlo Radice 807159
 * Metodi del Calcolo Scientifico
 * A.A 2018/2019
*/

#include <Eigen/Sparse>
#include <Eigen/Core>
#include <unsupported/Eigen/SparseExtra>
#include <iostream>
#include <fstream>
#include <chrono>
#include <windows.h>
#include <psapi.h>

/*
 * WINDOWS VERSION
*/


int main()
{
    // Virtual/Pysical memory
    PROCESS_MEMORY_COUNTERS_EX pmc_before;
    PROCESS_MEMORY_COUNTERS_EX pmc_after;
    PROCESS_MEMORY_COUNTERS_EX pmc_max;
    GetProcessMemoryInfo(GetCurrentProcess(), (PROCESS_MEMORY_COUNTERS*)&pmc_before, sizeof(pmc_before));

    // load sparse matrix
    Eigen::SparseMatrix<double> A;

    std::cout << "Physical memory before loading matrix in KB: " << pmc_before.WorkingSetSize/1024.0 << std::endl;
    std::cout << "Virtual memory before loading matrix in KB: " << pmc_before.PrivateUsage/1024.0 << std::endl;

    //load from windows
    Eigen::loadMarket(A, "C:\\Users\\carloradice\\Documents\\MCSLinearSystemSolverMatrici\\matrici\\ex15\\ex15.mtx");

    GetProcessMemoryInfo(GetCurrentProcess(), (PROCESS_MEMORY_COUNTERS*)&pmc_after, sizeof(pmc_after));
    std::cout << "Physical memory after loading matrix in KB: " << pmc_after.WorkingSetSize/1024.0 << std::endl;
    std::cout << "Virtual memory after loading matrix in KB: " << pmc_after.PrivateUsage/1024.0 << std::endl;

    // define xe and b
    Eigen::VectorXd xe = Eigen::VectorXd::Constant(A.rows(), 1);
    Eigen::VectorXd b = A.selfadjointView<Eigen::Lower>() * xe;     // because the matrix isn't full rank

    // Get starting timepoint
    auto start = std::chrono::high_resolution_clock::now();

    // Solving
    Eigen::SimplicialLLT<Eigen::SparseMatrix<double>> chol(A);      // performs a Cholesky factorization of A
    Eigen::VectorXd x = chol.solve(b);                              // use the factorization to solve for the given right hand side

    // Get ending timepoint
    auto stop = std::chrono::high_resolution_clock::now();

    // Get duration
    // To cast it to proper unit use duration cast method
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
    // print to screen duration
    std::cout << "Time taken by function: " << duration.count() << " microseconds" << std::endl;

    GetProcessMemoryInfo(GetCurrentProcess(), (PROCESS_MEMORY_COUNTERS*)&pmc_max, sizeof(pmc_max));
    std::cout << "Max physical memory in KB: " << pmc_max.WorkingSetSize/1024.0 << std::endl;
    std::cout << "Max virtual memory in KB: " << pmc_max.PrivateUsage/1024.0 << std::endl;

    double relativeError = (x-xe).norm()/(xe).norm();
    // print to screen relative error
    std::cout << "Relative error: " << relativeError << "\n" << std::endl;

    return 0;
}
