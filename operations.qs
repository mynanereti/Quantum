namespace Test
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation HelloQ () : Unit 
    {
        Message("Hello quantum world!");
    }
    operation Entanglement () : Unit
    {
        body
        {
            using (qubit1 = Qubit[1])
            {
                H(qubit1[0]);
                mutable value = M(qubit1[0]);
                Message($"{value}");
                ResetAll(qubit1);
            }

            using (qubit2 = Qubit[1])
            {
                mutable count1 = 0;
                for (i in 1 .. 1000)
                {
                    H(qubit2[0]);
                    mutable value = M(qubit2[0]);
                    if (value == One)
                    {
                        set count1 = count1 + 1;
                    }
                }
                Message($"Number of One's {count1}");
                ResetAll(qubit2);
            }

            using (qubit3 = Qubit[2])
            {
                mutable count00 = 0;
                mutable count01 = 0;
                mutable count10 = 0;
                mutable count11 = 0;

                for (i in 1 .. 1000)
                {
                    H(qubit3[0]);
                    H(qubit3[1]);
                    mutable value1 = M(qubit3[0]);
                    mutable value2 = M(qubit3[1]);

                    if (value1 == Zero and value2 == Zero)
                    {
                        set count00 = count00 + 1;
                    }

                    if (value1 == Zero and value2 == One)
                    {
                        set count01 = count01 + 1;
                    }

                    if (value1 == One and value2 == Zero)
                    {
                        set count10 = count10 + 1;
                    }

                    if (value1 == One and value2 == One)
                    {
                        set count11 = count11 + 1;
                    }
                }
                Message($"Number of |00>'s {count00}");
                Message($"Number of |01>'s {count01}");
                Message($"Number of |10>'s {count10}");
                Message($"Number of |11>'s {count11}");
                ResetAll(qubit3);
            }

            using (qubit4 = Qubit[2])
            {
                mutable count00 = 0;
                mutable count01 = 0;
                mutable count10 = 0;
                mutable count11 = 0;

                for (i in 1 .. 1000)
                {
                    H(qubit4[0]);
                    CNOT(qubit4[0], qubit4[1]);
                    mutable value1 = M(qubit4[0]);
                    mutable value2 = M(qubit4[1]);

                    if (value1 == Zero and value2 == Zero)
                    {
                        set count00 = count00 + 1;
                    }

                    if (value1 == Zero and value2 == One)
                    {
                        set count01 = count01 + 1;
                    }

                    if (value1 == One and value2 == Zero)
                    {
                        set count10 = count10 + 1;
                    }

                    if (value1 == One and value2 == One)
                    {
                        set count11 = count11 + 1;
                    }
                    ResetAll(qubit4);
                }
                Message($"Entanglement Number of |00>'s {count00}");
                Message($"Entanglement Number of |01>'s {count01}");
                Message($"Entanglement Number of |10>'s {count10}");
                Message($"Entanglement Number of |11>'s {count11}");
            }
        }
    }
}
