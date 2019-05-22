#include <Eigen/Sparse>
#include <Eigen/Core>
#include <unsupported/Eigen/SparseExtra>
#include <iostream>
#include <fstream>
#include <chrono>
#include <sys/resource.h>

const static Eigen::IOFormat CSVFormat(Eigen::StreamPrecision, Eigen::DontAlignCols, ", ", "\n");

int main()
{
    int i;
    std::cout << "Attach process while in waiting for standard input" << std::endl;
    std::cin >> i;

    // load sparse matrix
    Eigen::SparseMatrix<double> A;
    Eigen::loadMarket(A, "/home/carloradice/Documents/magistrale/metodi_del_calcolo_scientifico/MCSLinearSystemSolverMatrici/matrici/apache2/apache2.mtx");

    // define xe and b
    Eigen::VectorXd xe = Eigen::VectorXd::Constant(A.rows(), 1);
    Eigen::VectorXd b = A.selfadjointView<Eigen::Lower>() * xe;     // because the matrix isn't full rank

    // Solving
    Eigen::SimplicialLLT<Eigen::SparseMatrix<double>> chol(A);     // performs a Cholesky factorization of A

    // Get starting timepoint
    auto start = std::chrono::high_resolution_clock::now();
    Eigen::VectorXd x = chol.solve(b);                              // use the factorization to solve for the given right hand side
    // Get ending timepoint
    auto stop = std::chrono::high_resolution_clock::now();

    // Get duration
    // To cast it to proper unit use duration cast method
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(stop - start);

    // print to screen duration
    std::cout << "Time taken by function: " << duration.count() << " microseconds" << std::endl;

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
