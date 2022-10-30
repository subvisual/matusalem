%lang starknet
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.math import assert_not_zero
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.bool import TRUE
from starkware.starknet.common.syscalls import get_contract_address, get_caller_address
from starkware.starknet.common.messages import send_message_to_l1

from openzeppelin.token.erc20.library import ERC20
from openzeppelin.token.erc20.IERC20 import IERC20

const MESSAGE_DEPOSIT = 0;
const MESSAGE_SET_STRATEGY = 1;
const MESSAGE_START_STRATEGY = 2;

struct Proposal {
    strategy_id: felt,
    finished: felt,
    vote_list: (felt, felt, felt, felt, felt, felt, felt, felt),
}

@storage_var
func active_strategy() -> (res: felt) {
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

@storage_var
func proposal_counter() -> (res: felt) {
}

@event
func deposited(depositor_address: felt, amount: Uint256) {
}

@event
func new_proposal(proposal_id: felt, depositor_address: felt, amount: Uint256) {
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
    let (prop_counter) = proposal_counter.read();
    let proposal = Proposal(strategy_id=strategy_id, finished=0, vote_list=(0, 0, 0, 0, 0, 0, 0, 0));
    let proposal_id = prop_counter + 1;

    proposal_list.write(proposal_id, proposal);
    proposal_counter.write(proposal_id);

    return ();
}

@external
func vote{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr} (
  prop_id: felt, decision: felt
) {
  alloc_locals;
  let (prop_before) = get_proposal(prop_id);

  // proposal is no longer accepting votes
  if (prop_before.finished == 1) {
    assert 0 = 1;
  }

  // let proposal = Proposal(strategy_id=prop_before.strategy_id, finished=1, vote_list=(1, 0, 0, 1, 0, 1, 0, 1));
  // proposal_list.write(prop_id, proposal);


  let (l1) = l1_address.read();

  let (message_payload_deposit: felt*) = alloc();
  assert message_payload_deposit[0] = MESSAGE_DEPOSIT;
  assert message_payload_deposit[1] = 1;
  send_message_to_l1(
      to_address=l1,
      payload_size=2,
      payload=message_payload_deposit
  );

  let (message_payload_set_strategy: felt*) = alloc();
  assert message_payload_set_strategy[0] = MESSAGE_SET_STRATEGY;
  assert message_payload_set_strategy[1] = prop_before.strategy_id;
  send_message_to_l1(
      to_address=l1,
      payload_size=2,
      payload=message_payload_deposit
  );

  let (message_payload_start_strategy: felt*) = alloc();
  assert message_payload_start_strategy[0] = MESSAGE_START_STRATEGY;
  send_message_to_l1(
      to_address=l1,
      payload_size=1,
      payload=message_payload_deposit
  );

  // let (caller_address) = get_caller_address();
  // check already voted

  // vote
  // assign vote decision

  // check majority reached

  // if majority and vote passes
    //send_message_to_l1()
    // return


  // if majority and vote rejected
    // send_message_to_l1()
    // return

  return ();
}

@external
func close_vote{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr} (
  prop_id: felt
) {
  return ();
}

@external
func withdraw{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr} () {
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
    prop_id: felt
) -> (prop: Proposal) {
    let (proposal) = proposal_list.read(prop_id);
    return (proposal,);
}

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    token_address: felt
) {
    ethereum_token.write(value=token_address);
    return ();
}
