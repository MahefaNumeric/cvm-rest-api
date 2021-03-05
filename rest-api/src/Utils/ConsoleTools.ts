
export const consoleReset = () => {
    process.stdout.write('\x1Bc');
}