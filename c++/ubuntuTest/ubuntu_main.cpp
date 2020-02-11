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
#include "stdlib.h"
#include "stdio.h"
#include "string.h"

/*
 * GNU/LINUX VERSION
*/

int parseLine(char* line){
    // this assumes that a digit will be found and the line ends in " Kb".
    int i = strlen(line);
    const char* p = line;
    while (*p <'0' || *p > '9') p++;
    line[i-3] = '\0';
    i = atoi(p);
    return i;
}

// Get virtual memory value
int getValueVirtual(){ // Note: this value is in KB!
    FILE* file = fopen("/proc/self/status", "r");
    int result = -1;
    char line[128];

    while (fgets(line, 128, file) != NULL){
        if (strncmp(line, "VmSize:", 7) == 0){
            result = parseLine(line);
            break;
        }
    }
    fclose(file);
    return result;
}

// Get physical memory value
int getValuePhysical(){ // Note: this value is in KB!
    FILE* file = fopen("/proc/self/status", "r");
    int result = -1;
    char line[128];

#pragma warning( disable : 4101)
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
    // load sparse matrix
    Eigen::SparseMatrix<double> A;

    std::cout << "Physical memory before loading matrix in KB: " << getValuePhysical() << std::endl;
    std::cout << "Virtual memory before loading matrix in KB: " << getValueVirtual() << std::endl;

    // load from ubuntu
    Eigen::loadMarket(A, "/home/carloradice/Documents/magistrale/metodi_del_calcolo_scientifico/MCSLinearSystemSolverMatrici/matrici/cfd2/cfd2.mtx");

    std::cout << "Physical memory after loading matrix in KB: " << getValuePhysical() << std::endl;
    std::cout << "Virtual memory after loading matrix in KB: " << getValueVirtual() << std::endl;

    // define xe and b
    Eigen::VectorXd xe = Eigen::VectorXd::Constant(A.rows(), 1);
    Eigen::VectorXd b = A.selfadjointView<Eigen::Lower>() * xe;     // because the matrix isn't full rank

    // get starting timepoint
    auto start = std::chrono::high_resolution_clock::now();

    // solving
    Eigen::SimplicialLLT<Eigen::SparseMatrix<double>> chol(A);      // performs a Cholesky factorization of A
    Eigen::VectorXd x = chol.solve(b);                              // use the factorization to solve for the given right hand side

    // get ending timepoint
    auto stop = std::chrono::high_resolution_clock::now();

    // get duration
    // cast it to proper unit use duration cast method
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);
    // print to screen duration
    std::cout << "Time taken by function: " << duration.count() << " microseconds" << std::endl;

    std::cout << "Max physical memory in KB: " << getValuePhysical() << std::endl;
    std::cout << "Max virtual memory in KB: " << getValueVirtual() << std::endl;

    // calculate relative error
    double relativeError = (x-xe).norm()/(xe).norm();
    // print to screen relative error
    std::cout << "Relative error: " << relativeError << "\n" << std::endl;

    return 0;
}
