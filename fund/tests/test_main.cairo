%lang starknet
from src.main import l1_address, set_l1_address
from starkware.cairo.common.cairo_builtins import HashBuiltin

@external
func test_set_l1_address{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    let (result_before) = l1_address.read();
    assert result_before = 0;

    set_l1_address(0x123);

    let (result_after) = l1_address.read();
    assert result_after = 0x123;
    return ();
}

@external
func test_cannot_set_null_l1_address{
    syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*
}() {
    let (result_before) = l1_address.read();
    assert result_before = 0;

    %{ expect_revert(error_message="L1 address cannot be null") %}
    set_l1_address(0);

    return ();
}
