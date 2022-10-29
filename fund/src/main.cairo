%lang starknet
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.math import assert_not_zero
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.bool import TRUE
from starkware.starknet.common.syscalls import get_contract_address, get_caller_address

from openzeppelin.token.erc20.library import ERC20
from openzeppelin.token.erc20.IERC20 import IERC20

struct Proposal {
    strategy_id: felt,
    vote_list: (felt, felt, felt, felt, felt, felt, felt, felt),
}

@storage_var
func ethereum_token() -> (res: felt) {
}

@storage_var
func l1_address() -> (res: felt) {
}

@storage_var
func allow_list() -> (res: felt) {
}

@storage_var
func proposal_list(strategy_id: felt) -> (proposal: Proposal) {
}

@event
func deposited(depositor_address: felt, amount: Uint256) {
}

@external
func monthly_deposit{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    amount: Uint256
) -> (success: felt) {
    let (ethereum_token_address) = ethereum_token.read();
    let (contract_address) = get_contract_address();
    let (caller_address) = get_caller_address();

    IERC20.transfer(
        contract_address=ethereum_token_address, recipient=contract_address, amount=amount
    );

    deposited.emit(caller_address, amount);
    return (TRUE,);
}

@external
func create_proposal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    strategy_id: felt
) {
    let proposal = Proposal(strategy_id=strategy_id, vote_list=(0, 0, 0, 0, 0, 0, 0, 0));
    proposal_list.write(strategy_id, proposal);
    return ();
}

@external
func set_l1_address{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    address: felt
) {
    with_attr error_message("L1 address cannot be null") {
        assert_not_zero(address);
    }

    l1_address.write(address);
    return ();
}

@view
func get_l1_address{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (
    res: felt
) {
    let (res) = l1_address.read();
    return (res,);
}

@view
func get_ethereum_token_address{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    ) -> (res: felt) {
    let (res) = ethereum_token.read();
    return (res,);
}

@view
func get_proposal{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}(
    strat_id: felt
) -> (prop: Proposal) {
    let (proposal) = proposal_list.read(strat_id);
    return (proposal,);
}

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    token_address: felt
) {
    ethereum_token.write(value=token_address);
    return ();
}
