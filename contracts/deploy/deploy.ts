import { Keypair, Connection, Transaction, TransactionInstruction } from '@solana/web3.js';
import * as fs from 'fs';

async function deployContract(): Promise<void> {
    // Load the Solana connection
    const connection = new Connection('https://api.devnet.solana.com');

    // Load program's compiled binary data
    const programData = fs.readFileSync('./path/to/program.so');

    // Load  payer's keypair
    const payerKeypair = Keypair.fromSecretKey(Buffer.from('willbereplaced_PRIVATE_KEY'));

    // Create the transaction instruction to deploy the program
    const transactionInstruction = new TransactionInstruction({
        keys: [],
        programId: payerKeypair.publicKey,
        data: Buffer.from(programData),
    });

    // Create the transaction
    const transaction = new Transaction().add(transactionInstruction);

    // Sign and send the transaction
    const signature = await connection.sendTransaction(transaction, [payerKeypair]);

    console.log('Contract deployed with signature:', signature);
}

deployContract().catch(err => console.error(err));
