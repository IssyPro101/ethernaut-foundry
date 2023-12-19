-include .env

fallback-test:
	@forge script script/FallbackSolution.sol:FallbackSolution --fork-url $(SEPOLIA_RPC_URL)

fallback-real:
	@forge script script/FallbackSolution.sol:FallbackSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

fallout-test:
	@forge script script/FalloutSolution.sol:FalloutSolution --fork-url $(SEPOLIA_RPC_URL)

fallout-real:
	@forge script script/FalloutSolution.sol:FalloutSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

coinflip-test:
	@forge script script/CoinFlipSolution.sol:CoinFlipSolution --fork-url $(SEPOLIA_RPC_URL)

coinflip-real:
	@forge script script/CoinFlipSolution.sol:CoinFlipSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

telephone-test:
	@forge script script/TelephoneSolution.sol:TelephoneSolution --fork-url $(SEPOLIA_RPC_URL)

telephone-real:
	@forge script script/TelephoneSolution.sol:TelephoneSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

token-test:
	@forge script script/TokenSolution.sol:TokenSolution --fork-url $(SEPOLIA_RPC_URL)

token-real:
	@forge script script/TokenSolution.sol:TokenSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

delegation-test:
	@forge script script/DelegationSolution.sol:DelegationSolution --fork-url $(SEPOLIA_RPC_URL)

delegation-real:
	@forge script script/DelegationSolution.sol:DelegationSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

force-test:
	@forge script script/ForceSolution.sol:ForceSolution --fork-url $(SEPOLIA_RPC_URL)

force-real:
	@forge script script/ForceSolution.sol:ForceSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

vault-test:
	@forge script script/VaultSolution.sol:VaultSolution --fork-url $(SEPOLIA_RPC_URL)

vault-real:
	@forge script script/VaultSolution.sol:VaultSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

king-test:
	@forge script script/KingSolution.sol:KingSolution --fork-url $(SEPOLIA_RPC_URL)

king-real:
	@forge script script/KingSolution.sol:KingSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

reentrance-test:
	@forge script script/ReentranceSolution.sol:ReentranceSolution --fork-url $(SEPOLIA_RPC_URL)

reentrance-real:
	@forge script script/ReentranceSolution.sol:ReentranceSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

elevator-test:
	@forge script script/ElevatorSolution.sol:ElevatorSolution --fork-url $(SEPOLIA_RPC_URL)

elevator-real:
	@forge script script/ElevatorSolution.sol:ElevatorSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

privacy-test:
	@forge script script/PrivacySolution.sol:PrivacySolution --fork-url $(SEPOLIA_RPC_URL)

privacy-real:
	@forge script script/PrivacySolution.sol:PrivacySolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

gatekeeperone-test:
	@forge script script/GatekeeperOneSolution.sol:GatekeeperOneSolution --fork-url $(SEPOLIA_RPC_URL)

gatekeeperone-real:
	@forge script script/GatekeeperOneSolution.sol:GatekeeperOneSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

gatekeepertwo-test:
	@forge script script/GatekeeperTwoSolution.sol:GatekeeperTwoSolution --fork-url $(SEPOLIA_RPC_URL)

gatekeepertwo-real:
	@forge script script/GatekeeperTwoSolution.sol:GatekeeperTwoSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

naughtcoin-test:
	@forge script script/NaughtCoinSolution.sol:NaughtCoinSolution --fork-url $(SEPOLIA_RPC_URL)

naughtcoin-real:
	@forge script script/NaughtCoinSolution.sol:NaughtCoinSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

preservation-test:
	@forge script script/PreservationSolution.sol:PreservationSolution --fork-url $(SEPOLIA_RPC_URL)

preservation-real:
	@forge script script/PreservationSolution.sol:PreservationSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

recovery-test:
	@forge script script/RecoverySolution.sol:RecoverySolution --fork-url $(SEPOLIA_RPC_URL)

recovery-real:
	@forge script script/RecoverySolution.sol:RecoverySolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

magicnum-test:
	@forge script script/MagicNumberSolution.sol:MagicNumberSolution --fork-url $(SEPOLIA_RPC_URL)

magicnum-real:
	@forge script script/MagicNumberSolution.sol:MagicNumberSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

aliencodex-test:
	@forge script script/AlienCodexSolution.sol:AlienCodexSolution --fork-url $(SEPOLIA_RPC_URL)

aliencodex-real:
	@forge script script/AlienCodexSolution.sol:AlienCodexSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

denial-test:
	@forge script script/DenialSolution.sol:DenialSolution --fork-url $(SEPOLIA_RPC_URL)

denial-real:
	@forge script script/DenialSolution.sol:DenialSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

shop-test:
	@forge script script/ShopSolution.sol:ShopSolution --fork-url $(SEPOLIA_RPC_URL)

shop-real:
	@forge script script/ShopSolution.sol:ShopSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

dex-test:
	@forge script script/DexSolution.sol:DexSolution --fork-url $(SEPOLIA_RPC_URL)

dex-real:
	@forge script script/DexSolution.sol:DexSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

dextwo-test:
	@forge script script/DexTwoSolution.sol:DexTwoSolution --fork-url $(SEPOLIA_RPC_URL)

dextwo-real:
	@forge script script/DexTwoSolution.sol:DexTwoSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

puzzlewallet-test:
	@forge script script/PuzzleWalletSolution.sol:PuzzleWalletSolution --fork-url $(SEPOLIA_RPC_URL)

puzzlewallet-real:
	@forge script script/PuzzleWalletSolution.sol:PuzzleWalletSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

motorbike-test:
	@forge script script/MotorbikeSolution.sol:MotorbikeSolution --fork-url $(SEPOLIA_RPC_URL)

motorbike-real:
	@forge script script/MotorbikeSolution.sol:MotorbikeSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

doubleentrypoint-test:
	@forge script script/DoubleEntryPointSolution.sol:DoubleEntryPointSolution --fork-url $(SEPOLIA_RPC_URL)

doubleentrypoint-real:
	@forge script script/DoubleEntryPointSolution.sol:DoubleEntryPointSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

goodsamaritan-test:
	@forge script script/GoodSamaritanSolution.sol:GoodSamaritanSolution --fork-url $(SEPOLIA_RPC_URL)

goodsamaritan-real:
	@forge script script/GoodSamaritanSolution.sol:GoodSamaritanSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

gatekeeperthree-test:
	@forge script script/GatekeeperThreeSolution.sol:GatekeeperThreeSolution --fork-url $(SEPOLIA_RPC_URL)

gatekeeperthree-real:
	@forge script script/GatekeeperThreeSolution.sol:GatekeeperThreeSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast

switch-test:
	@forge script script/SwitchSolution.sol:SwitchSolution --fork-url $(SEPOLIA_RPC_URL)

switch-real:
	@forge script script/SwitchSolution.sol:SwitchSolution --rpc-url $(SEPOLIA_RPC_URL) --broadcast