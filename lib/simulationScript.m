function simulationScript()
    
    empiricalNumClusProbs(8000, 2.58, [109, 91, 109], 3, 9.2, 1:90);
    hold on;
    empiricalNumPeaks(8000, 2.58, [109, 91, 109], 3, 9.2, 1:90);
    theoreticalNumClusProbs(2.58, [109, 91, 109], 3, 9.2, 1:90);
    
    legend('Empirical Clusters','Empirical Peaks', 'Theoretical Approximation')
    
    saveas(gcf, 'ClusVsPeaks.png')
    
end
    
    