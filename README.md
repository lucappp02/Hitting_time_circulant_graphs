# Strategies to reduce hitting time on circulant graphs

Continuous-time quantum walks (CTQW) are the quantum analog of classical
random walks and play a central role in quantum information processing (see [1]
for a review). In recent years, CTQWs have been the focus of intense theoretical
and experimental efforts.
Particularly interesting and practically important is the so-called hitting time
problem, i.e., determining the time required for a particle to reach a given destination. It is evident that the above definition is at least ill-defined for a quantum
system since it is impossible to obtain a complete record of a quantum trajectory.
To address this issue, Dhar et al. [2, 3, 4] developed a protocol aimed at defining the mean time required for a quantum particle to be detected at a specific site.
In this protocol, the system is prepared at t = 0 in an initial state, and a detector
performs projective measurements stroboscopically at a fixed frequency 1/τ during the evolution governed by a given Hamiltonian. Most of the results derived
so far within this framework pertain to localized initial states and projective measurements on single sites, including experimental implementations [5]. Notably,
dark states—states that cannot be reached by the evolution—naturally arise in
this protocol and have a non-trivial effect on the total probability of detection [6].
However, it is natural to inquire what would happen if we were able to measure
multiple sites simultaneously. The purpose of this work is to address this question,
which might seem trivial since the most straightforward strategy appears to be
measuring all accessible sites at the same time. Nevertheless, we will show that
different measurement strategies can perform better in certain situations.
In particular, we implement CTQWs on a class of circulant graphs using a
quantum computer [7] and the Qiskit framework. This choice is motivated by the
fact that the adjacency matrices of these graphs can be efficiently diagonalized by
a discrete Fourier transform [8], and, under mild conditions, a diagonal Hamiltonian can be implemented with polynomial complexity [9]. We demonstrate that
mixed single-site measurement strategies can improve the total detection probability compared to strategies that measure all sites simultaneously.
Finally, we address scenarios where the degeneracy of the Hamiltonian is lifted,
for example, due to the presence of a magnetic field [10]. In such cases, dark
states disappear, resulting in a total detection probability of unity. However, the
mean number of measurements required to detect the particle can still be reduced
through single-site measurement strategies.


[1] Oliver M¨ulken and Alexander Blumen. “Continuous-time quantum walks:
Models for coherent transport on complex networks”. In: Physics Reports
502.2-3 (2011), pp. 37–87.

[2] Shrabanti Dhar et al. “Detection of a quantum particle on a lattice under repeated projective measurements”. In: Physical Review A 91.6 (2015),
p. 062115.

[3] Shrabanti Dhar, Subinay Dasgupta, and Abhishek Dhar. “Quantum time
of arrival distribution in a simple lattice model”. In: Journal of Physics A:
Mathematical and Theoretical 48.11 (2015), p. 115304.

[4] Harel Friedman, David A Kessler, and Eli Barkai. “Quantum walks: The
first detected passage time problem”. In: Physical Review E 95.3 (2017),
p. 032141.

[5] Qingyuan Wang et al. “First Hitting Times on a Quantum Computer: Topological Effects and Dark States”. In: arXiv preprint arXiv:2402.15843 (2024).

[6] Felix Thiel et al. “Dark states of quantum search cause imperfect detection”.
In: Physical Review Research 2.4 (2020), p. 043107.

[7] Xiaogang Qiang et al. “Efficient quantum walk on a quantum processor”.
In: Nature communications 7.1 (2016), p. 11511.

[8] Bassam Bamieh. “Discovering transforms: A tutorial on circulant matrices,
circular convolution, and the discrete fourier transform”. In: arXiv preprint
arXiv:1805.05533 (2018).

[9] Andrew MacGregor Childs. “Quantum information processing in continuous
time”. PhD thesis. Massachusetts Institute of Technology, 2004.

[10] M Frigerio. “Perspectives and applications of chiral quantum walks”. In: IL
NUOVO CIMENTO 100.72 (2022), p. 45.
