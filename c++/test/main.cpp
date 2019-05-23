#include <Eigen/Sparse>
#include <Eigen/Core>
#include <unsupported/Eigen/SparseExtra>
#include <iostream>
#include <fstream>
#include <chrono>

#include "stdlib.h"
#include "stdio.h"
#include "string.h"

//const static Eigen::IOFormat CSVFormat(Eigen::StreamPrecision, Eigen::DontAlignCols, ", ", "\n");

/*
 * UBUNTU LINUX VERSION
 * Methods which are needed to compute the values of the memory before, after loading the matrix and
 * the max memory usage.
 * (comment these two methods if using windows)
*/

int parseLine(char* line){
    // This assumes that a digit will be found and the line ends in " Kb".
    int i = strlen(line);
    const char* p = line;
    while (*p <'0' || *p > '9') p++;
    line[i-3] = '\0';
    i = atoi(p);
    return i;
}

int getValue(){ //Note: this value is in KB!
    FILE* file = fopen("/proc/self/status", "r");
    int result = -1;
    char line[128];

    while (fgets(line, 128, file) != NULL){
        if (strncmp(line, "VmRSS:", 6) == 0){
            result = parseLine(line);
            break;
        }
    }
    fclose(file);
    return result;
}

int main()
{
    int i;
    std::cout << "Attach process while in waiting for standard input" << std::endl;
    std::cin >> i;

    // load sparse matrix
    Eigen::SparseMatrix<double> A;

    std::cout << "Memory before loading matrix in KB: " << getValue() << std::endl;

    //load from ubuntu
    Eigen::loadMarket(A, "/home/carloradice/Documents/magistrale/metodi_del_calcolo_scientifico/MCSLinearSystemSolverMatrici/matrici/apache2/apache2.mtx");

    std::cout << "Memory after loading matrix in KB: " << getValue() << std::endl;

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

    std::cout << "Max Memory in KB: " << getValue() << std::endl;

    double relativeError = (x-xe).norm()/(xe).norm();
    // print to screen relative error
    std::cout << "Relative error: " << relativeError << "\n" << std::endl;

//    // print to file x (for check)
//    std::ofstream file;
//    file.open("test.txt");
//    if (file.is_open()) {
//        file << x.format(CSVFormat);
//    }
//    file.close();

    return 0;
}
