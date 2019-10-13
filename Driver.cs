using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Test
{
    class Driver
    {
        static void Main(string[] args)
        {
            /*using (var qsim = new QuantumSimulator()) // Only for hello quantum
            {
                HelloQ.Run(qsim).Wait();
            }*/
            using (var qsim = new QuantumSimulator())
            {
                Entanglement.Run(qsim).Wait();
            }
        }
    }
}
