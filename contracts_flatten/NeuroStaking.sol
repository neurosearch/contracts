// Dependency file: @openzeppelin/contracts/token/ERC20/IERC20.sol

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

// pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}


// Dependency file: @openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol

// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/IERC20Metadata.sol)

// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @dev Interface for the optional metadata functions from the ERC20 standard.
 *
 * _Available since v4.1._
 */
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}


// Dependency file: @openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol

// OpenZeppelin Contracts v4.4.1 (token/ERC20/extensions/draft-IERC20Permit.sol)

// pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 Permit extension allowing approvals to be made via signatures, as defined in
 * https://eips.ethereum.org/EIPS/eip-2612[EIP-2612].
 *
 * Adds the {permit} method, which can be used to change an account's ERC20 allowance (see {IERC20-allowance}) by
 * presenting a message signed by the account. By not relying on {IERC20-approve}, the token holder account doesn't
 * need to send a transaction, and thus is not required to hold Ether at all.
 */
interface IERC20Permit {
    /**
     * @dev Sets `value` as the allowance of `spender` over ``owner``'s tokens,
     * given ``owner``'s signed approval.
     *
     * IMPORTANT: The same issues {IERC20-approve} has related to transaction
     * ordering also apply here.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     * - `deadline` must be a timestamp in the future.
     * - `v`, `r` and `s` must be a valid `secp256k1` signature from `owner`
     * over the EIP712-formatted function arguments.
     * - the signature must use ``owner``'s current nonce (see {nonces}).
     *
     * For more information on the signature format, see the
     * https://eips.ethereum.org/EIPS/eip-2612#specification[relevant EIP
     * section].
     */
    function permit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    /**
     * @dev Returns the current nonce for `owner`. This value must be
     * included whenever a signature is generated for {permit}.
     *
     * Every successful call to {permit} increases ``owner``'s nonce by one. This
     * prevents a signature from being used multiple times.
     */
    function nonces(address owner) external view returns (uint256);

    /**
     * @dev Returns the domain separator used in the encoding of the signature for {permit}, as defined by {EIP712}.
     */
    // solhint-disable-next-line func-name-mixedcase
    function DOMAIN_SEPARATOR() external view returns (bytes32);
}


// Dependency file: @openzeppelin/contracts/utils/Address.sol

// OpenZeppelin Contracts (last updated v4.8.0) (utils/Address.sol)

// pragma solidity ^0.8.1;

/**
 * @dev Collection of functions related to the address type
 */
library Address {
    /**
     * @dev Returns true if `account` is a contract.
     *
     * [IMPORTANT]
     * ====
     * It is unsafe to assume that an address for which this function returns
     * false is an externally-owned account (EOA) and not a contract.
     *
     * Among others, `isContract` will return false for the following
     * types of addresses:
     *
     *  - an externally-owned account
     *  - a contract in construction
     *  - an address where a contract will be created
     *  - an address where a contract lived, but was destroyed
     * ====
     *
     * [IMPORTANT]
     * ====
     * You shouldn't rely on `isContract` to protect against flash loan attacks!
     *
     * Preventing calls from contracts is highly discouraged. It breaks composability, breaks support for smart wallets
     * like Gnosis Safe, and does not provide security since it can be circumvented by calling from a contract
     * constructor.
     * ====
     */
    function isContract(address account) internal view returns (bool) {
        // This method relies on extcodesize/address.code.length, which returns 0
        // for contracts in construction, since the code is only stored at the end
        // of the constructor execution.

        return account.code.length > 0;
    }

    /**
     * @dev Replacement for Solidity's `transfer`: sends `amount` wei to
     * `recipient`, forwarding all available gas and reverting on errors.
     *
     * https://eips.ethereum.org/EIPS/eip-1884[EIP1884] increases the gas cost
     * of certain opcodes, possibly making contracts go over the 2300 gas limit
     * imposed by `transfer`, making them unable to receive funds via
     * `transfer`. {sendValue} removes this limitation.
     *
     * https://diligence.consensys.net/posts/2019/09/stop-using-soliditys-transfer-now/[Learn more].
     *
     * IMPORTANT: because control is transferred to `recipient`, care must be
     * taken to not create reentrancy vulnerabilities. Consider using
     * {ReentrancyGuard} or the
     * https://solidity.readthedocs.io/en/v0.5.11/security-considerations.html#use-the-checks-effects-interactions-pattern[checks-effects-interactions pattern].
     */
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");

        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }

    /**
     * @dev Performs a Solidity function call using a low level `call`. A
     * plain `call` is an unsafe replacement for a function call: use this
     * function instead.
     *
     * If `target` reverts with a revert reason, it is bubbled up by this
     * function (like regular Solidity function calls).
     *
     * Returns the raw returned data. To convert to the expected return value,
     * use https://solidity.readthedocs.io/en/latest/units-and-global-variables.html?highlight=abi.decode#abi-encoding-and-decoding-functions[`abi.decode`].
     *
     * Requirements:
     *
     * - `target` must be a contract.
     * - calling `target` with `data` must not revert.
     *
     * _Available since v3.1._
     */
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, "Address: low-level call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`], but with
     * `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but also transferring `value` wei to `target`.
     *
     * Requirements:
     *
     * - the calling contract must have an ETH balance of at least `value`.
     * - the called Solidity function must be `payable`.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value
    ) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }

    /**
     * @dev Same as {xref-Address-functionCallWithValue-address-bytes-uint256-}[`functionCallWithValue`], but
     * with `errorMessage` as a fallback revert reason when `target` reverts.
     *
     * _Available since v3.1._
     */
    function functionCallWithValue(
        address target,
        bytes memory data,
        uint256 value,
        string memory errorMessage
    ) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        (bool success, bytes memory returndata) = target.call{value: value}(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a static call.
     *
     * _Available since v3.3._
     */
    function functionStaticCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        (bool success, bytes memory returndata) = target.staticcall(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }

    /**
     * @dev Same as {xref-Address-functionCall-address-bytes-string-}[`functionCall`],
     * but performing a delegate call.
     *
     * _Available since v3.4._
     */
    function functionDelegateCall(
        address target,
        bytes memory data,
        string memory errorMessage
    ) internal returns (bytes memory) {
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return verifyCallResultFromTarget(target, success, returndata, errorMessage);
    }

    /**
     * @dev Tool to verify that a low level call to smart-contract was successful, and revert (either by bubbling
     * the revert reason or using the provided one) in case of unsuccessful call or if target was not a contract.
     *
     * _Available since v4.8._
     */
    function verifyCallResultFromTarget(
        address target,
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal view returns (bytes memory) {
        if (success) {
            if (returndata.length == 0) {
                // only check isContract if the call was successful and the return data is empty
                // otherwise we already know that it was a contract
                require(isContract(target), "Address: call to non-contract");
            }
            return returndata;
        } else {
            _revert(returndata, errorMessage);
        }
    }

    /**
     * @dev Tool to verify that a low level call was successful, and revert if it wasn't, either by bubbling the
     * revert reason or using the provided one.
     *
     * _Available since v4.3._
     */
    function verifyCallResult(
        bool success,
        bytes memory returndata,
        string memory errorMessage
    ) internal pure returns (bytes memory) {
        if (success) {
            return returndata;
        } else {
            _revert(returndata, errorMessage);
        }
    }

    function _revert(bytes memory returndata, string memory errorMessage) private pure {
        // Look for revert reason and bubble it up if present
        if (returndata.length > 0) {
            // The easiest way to bubble the revert reason is using memory via assembly
            /// @solidity memory-safe-assembly
            assembly {
                let returndata_size := mload(returndata)
                revert(add(32, returndata), returndata_size)
            }
        } else {
            revert(errorMessage);
        }
    }
}


// Dependency file: @openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol

// OpenZeppelin Contracts (last updated v4.8.0) (token/ERC20/utils/SafeERC20.sol)

// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "@openzeppelin/contracts/token/ERC20/extensions/draft-IERC20Permit.sol";
// import "@openzeppelin/contracts/utils/Address.sol";

/**
 * @title SafeERC20
 * @dev Wrappers around ERC20 operations that throw on failure (when the token
 * contract returns false). Tokens that return no value (and instead revert or
 * throw on failure) are also supported, non-reverting calls are assumed to be
 * successful.
 * To use this library you can add a `using SafeERC20 for IERC20;` statement to your contract,
 * which allows you to call the safe operations as `token.safeTransfer(...)`, etc.
 */
library SafeERC20 {
    using Address for address;

    function safeTransfer(
        IERC20 token,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(
        IERC20 token,
        address from,
        address to,
        uint256 value
    ) internal {
        _callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    /**
     * @dev Deprecated. This function has issues similar to the ones found in
     * {IERC20-approve}, and its usage is discouraged.
     *
     * Whenever possible, use {safeIncreaseAllowance} and
     * {safeDecreaseAllowance} instead.
     */
    function safeApprove(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        // safeApprove should only be called when setting an initial allowance,
        // or when resetting it to zero. To increase and decrease it, use
        // 'safeIncreaseAllowance' and 'safeDecreaseAllowance'
        require(
            (value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }

    function safeIncreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        uint256 newAllowance = token.allowance(address(this), spender) + value;
        _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
    }

    function safeDecreaseAllowance(
        IERC20 token,
        address spender,
        uint256 value
    ) internal {
        unchecked {
            uint256 oldAllowance = token.allowance(address(this), spender);
            require(oldAllowance >= value, "SafeERC20: decreased allowance below zero");
            uint256 newAllowance = oldAllowance - value;
            _callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, newAllowance));
        }
    }

    function safePermit(
        IERC20Permit token,
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) internal {
        uint256 nonceBefore = token.nonces(owner);
        token.permit(owner, spender, value, deadline, v, r, s);
        uint256 nonceAfter = token.nonces(owner);
        require(nonceAfter == nonceBefore + 1, "SafeERC20: permit did not succeed");
    }

    /**
     * @dev Imitates a Solidity high-level call (i.e. a regular function call to a contract), relaxing the requirement
     * on the return value: the return value is optional (but if data is returned, it must not be false).
     * @param token The token targeted by the call.
     * @param data The call data (encoded using abi.encode or one of its variants).
     */
    function _callOptionalReturn(IERC20 token, bytes memory data) private {
        // We need to perform a low level call here, to bypass Solidity's return data size checking mechanism, since
        // we're implementing it ourselves. We use {Address-functionCall} to perform this call, which verifies that
        // the target address contains contract code and also asserts for success in the low-level call.

        bytes memory returndata = address(token).functionCall(data, "SafeERC20: low-level call failed");
        if (returndata.length > 0) {
            // Return data is optional
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}


// Dependency file: @openzeppelin/contracts/utils/math/SafeMath.sol

// OpenZeppelin Contracts (last updated v4.6.0) (utils/math/SafeMath.sol)

// pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}


// Dependency file: @openzeppelin/contracts/security/ReentrancyGuard.sol

// OpenZeppelin Contracts (last updated v4.8.0) (security/ReentrancyGuard.sol)

// pragma solidity ^0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be _NOT_ENTERED
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}


// Dependency file: @openzeppelin/contracts/utils/Context.sol

// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

// pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}


// Dependency file: @openzeppelin/contracts/access/Ownable.sol

// OpenZeppelin Contracts (last updated v4.7.0) (access/Ownable.sol)

// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/utils/Context.sol";

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}


// Root file: contracts/GPTCoinStaking.sol

pragma solidity 0.8.19; 

// import '/Users/webdev/Documents/gpt-N/#smart-contracts/node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol';
// import '/Users/webdev/Documents/gpt-N/#smart-contracts/node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol';
// import '/Users/webdev/Documents/gpt-N/#smart-contracts/node_modules/@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
// import '/Users/webdev/Documents/gpt-N/#smart-contracts/node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol';
// import '/Users/webdev/Documents/gpt-N/#smart-contracts/node_modules/@openzeppelin/contracts/utils/Address.sol';
// import '/Users/webdev/Documents/gpt-N/#smart-contracts/node_modules/@openzeppelin/contracts/security/ReentrancyGuard.sol';
// import '/Users/webdev/Documents/gpt-N/#smart-contracts/node_modules/@openzeppelin/contracts/utils/Context.sol';
// import '/Users/webdev/Documents/gpt-N/#smart-contracts/node_modules/@openzeppelin/contracts/access/Ownable.sol';

uint256 constant MAX_INT = 2 ** 256 - 1;

contract NeuroStaking is ReentrancyGuard, Context, Ownable {
    using SafeMath for uint256;
    using SafeERC20 for IERC20;
    using Address for address payable;

    struct stakingInfo {
        uint256 amount;
        uint256 startDate;
        uint256 releaseDate;
        uint stakingBasePct;
        uint256 stakingDuration;
    }

    struct roundInfo {
        uint256 price;
        uint256 totalCap;
        uint minAmount;
        bool stopped;
        uint256 totalSold;
        uint index;
        uint stakingBasePct;
        uint256 stakingDuration;
    }

    struct purchaseInfo {
        address purchaser;
        address valueToken;
        uint256 value;
        uint256 amount;
        uint round;
    }

    // The token being sold
    IERC20 public NEUROTOKEN;

    address payable public wallet;
    uint256 public start;

    mapping(address => bool) public supportedTokens;
    mapping(address => uint256) public totalsByTokens;
    uint256 public totalsSold;

    bool private _stopped;

    mapping(address => purchaseInfo[]) private _purchases;
    roundInfo[] public rounds;
    mapping(address => stakingInfo) private _stakings;
    uint256 private _totalRewardsRequired;
    uint256 private _totalStakingSupply;

    /**
     * event for staking action
     * @param user address of user
     * @param amount amount of staked tokens
     */
    event Staked(address indexed user, uint256 amount, uint round);

    /**
     * event for staking withdraw
     * @param user address of user
     * @param amount amount of tokens to withdraw
     * @param reward amount of tokens for reward
     * @param round round index
     */
    event Withdrawn(address indexed user, uint256 amount, uint256 reward, uint round);

    /**
     * exiting from staking event
     * @param user address of user
     * @param amount amount of tokens to withdraw
     * @param round round index
     */
    event Exited(address indexed user, uint256 amount, uint round);

    /**
     * event for token purchase logging
     * @param purchaser who paid & got for the tokens
     * @param valueToken address of token for value amount
     * @param value amount paid for purchase
     * @param amount amount of tokens purchased
     * @param round index of round
     */
    event TokenPurchase(
        address indexed purchaser,
        address indexed valueToken,
        uint256 value,
        uint256 amount,
        uint round
    );

    /**
     * event for token Emergency withdrawal
     * @param receiver address of token receiver
     * @param token address of token
     * @param amount amount of tokens purchased
     */
    event EmergencyWithdrawal(address indexed receiver, address indexed token, uint256 amount);

    constructor(address _neurotoken, address payable _wallet, uint256 _start, address[] memory _supportedTokens) {
        require(address(_neurotoken) != address(0));
        require(address(_wallet) != address(0));
        require(_start > 0);

        NEUROTOKEN = IERC20(_neurotoken);

        wallet = _wallet;
        start = _start;

        for (uint256 index = 0; index < _supportedTokens.length; index++) {
            supportedTokens[_supportedTokens[index]] = true;
        }

        //init rounds
        rounds.push(roundInfo(20000000000000000, MAX_INT, 1, false, 0, rounds.length, 88, 15768000)); //0.02$ with no cap and 1$ minimum for buy, staking for 6 month and APY 175%/2
    }

    function add_round_info(
        uint256 price,
        uint256 totalCap,
        uint minAmount,
        uint stakingPct,
        uint256 stakingDuration
    ) external onlyOwner nonReentrant {
        rounds.push(roundInfo(price, totalCap, minAmount, false, 0, rounds.length, stakingPct, stakingDuration));
    }

    function update_round_info(
        uint index,
        uint256 price,
        uint256 totalCap,
        uint minAmount,
        bool stopped,
        uint256 totalSold,
        uint stakingPct,
        uint256 stakingDuration
    ) external onlyOwner nonReentrant {
        rounds[index].price = price;
        rounds[index].totalCap = totalCap;
        rounds[index].minAmount = minAmount;
        rounds[index].stopped = stopped;
        rounds[index].totalSold = totalSold;
        rounds[index].stakingBasePct = stakingPct;
        rounds[index].stakingDuration = stakingDuration;
    }

    function remove_round_info(uint index) external onlyOwner nonReentrant {
        delete rounds[index];
    }

    function getCurrentRound() public view returns (roundInfo memory) {
        if (block.timestamp < start) {
            return rounds[0];
        }
        uint256 idx; //=block.timestamp.sub(start).div(33 days);
        for (; idx < rounds.length; idx++) {
            if (rounds[idx].price > 0 && !rounds[idx].stopped && rounds[idx].totalSold < rounds[idx].totalCap) {
                break;
            }
        }
        if (idx >= rounds.length) {
            idx = rounds.length - 1;
        }
        return rounds[idx];
    }

    function getCurrentRate() public view returns (uint256) {
        return getCurrentRound().price;
    }

    function availableBalance() public view returns (uint256 balance) {
        balance = NEUROTOKEN.balanceOf(address(this));
    }

    function getUserTotalPaid(address user) public view returns (uint256 balance) {
        purchaseInfo memory info;
        uint256 dec = uint256(10) ** uint256(18);
        for (uint256 i = 0; i < _purchases[user].length; i++) {
            info = _purchases[user][i];
            IERC20Metadata token = IERC20Metadata(info.valueToken);
            balance += info.value.div(uint256(10) ** uint256(token.decimals())).mul(dec);
        }
    }

    function getUserTotalSold(address user) public view returns (uint256 balance) {
        purchaseInfo memory info;
        for (uint256 i = 0; i < _purchases[user].length; i++) {
            info = _purchases[user][i];
            balance += info.amount;
        }
    }

    function totalRewardsRequired() external view returns (uint256) {
        return _totalRewardsRequired;
    }

    function amountToContractRequired() external view returns (uint256) {
        uint256 balance = NEUROTOKEN.balanceOf(address(this));
        return
            (_totalRewardsRequired > 0 && _totalRewardsRequired > balance.sub(_totalStakingSupply))
                ? _totalRewardsRequired.sub(balance.sub(_totalStakingSupply))
                : 0;
    }

    function balanceOf(address account) external view returns (uint256) {
        return _stakings[account].amount;
    }

    function canWithdraw(address account) external view returns (bool) {
        return _stakings[account].amount > 0 && block.timestamp > _stakings[account].releaseDate;
    }

    function canStake(address account) external view returns (bool) {
        return _stakings[account].releaseDate == 0;
    }

    function endStakingTime(address account) external view returns (uint256) {
        return _stakings[account].releaseDate;
    }

    function currentReward(address account) external view returns (uint256) {
        uint256 amount = _stakings[account].amount;
        uint basePct = _stakings[account].stakingBasePct;
        bool finished = _stakings[account].amount > 0 && block.timestamp > _stakings[account].releaseDate;
        uint duration = block.timestamp - _stakings[account].startDate;
        if (finished) {
            duration = _stakings[account].releaseDate - _stakings[account].startDate;
        }
        uint256 individualAPY = basePct.mul(1 ether);
        return ((amount.mul(individualAPY).div(365 days)).mul(duration)).div(100 * 1 ether);
    }

    function _validatePurchase(uint256 _value, address _token) internal view returns (uint256) {
        require(block.timestamp > start, 'not started');
        require(supportedTokens[_token], 'not supported token');
        IERC20Metadata token_meta = IERC20Metadata(_token);
        uint256 token_dec = uint256(10) ** uint256(token_meta.decimals());

        roundInfo memory round = getCurrentRound();
        require(round.totalCap > 0, 'no active round');
        require(_value >= round.minAmount.mul(token_dec), 'wrong value amount');

        uint256 dec = uint256(10) ** uint256(IERC20Metadata(address(NEUROTOKEN)).decimals());

        uint256 amount = _value.div(token_dec).mul(dec).div(round.price).mul(dec);
        require(availableBalance() >= amount, 'insufficient sell tokens balance');
        require(round.totalSold.add(amount) <= round.totalCap, 'round totalCap overflow');
        return amount;
    }

    function _buy(uint256 _value, address _token, address sender, bool doTransfer) internal returns (uint256) {
        uint256 amount = _validatePurchase(_value, _token);
        totalsByTokens[_token] = totalsByTokens[_token].add(_value);
        uint index = getCurrentRound().index;
        rounds[index].totalSold = rounds[index].totalSold.add(amount);
        totalsSold = totalsSold.add(amount);
        if (doTransfer) {
            IERC20(_token).safeTransferFrom(sender, wallet, _value);
        }
        return amount;
    }

    function _round_purchase(uint256 _value, address _token, address sender, uint256 amount, bool doTransfer) internal {
        roundInfo memory round = getCurrentRound();
        _purchases[sender].push(purchaseInfo(sender, _token, _value, amount, round.index));
        if (doTransfer) {
            NEUROTOKEN.safeTransfer(sender, amount);
        }
        emit TokenPurchase(sender, _token, _value, amount, round.index);
        if (round.totalSold >= round.totalCap) {
            rounds[round.index].stopped = true;
        }
    }

    function _getRewardsAmount(address addr, uint basePct, uint256 duration) private view returns (uint256) {
        uint256 amount = _stakings[addr].amount;
        uint256 individualAPY = basePct.mul(1 ether);
        return ((amount.mul(individualAPY).div(365 days)).mul(duration)).div(100 * 1 ether);
    }

    function buyAndStake(uint256 _value, address _token) external nonReentrant {
        address sender = _msgSender();
        require(_stopped == false, 'stopped');
        require(_value > 0, 'value cannot be zero');
        require(_stakings[sender].releaseDate == 0, 'user already have deposit');

        uint256 neuro_amount = _value;
        if (_token != address(NEUROTOKEN)) {
            neuro_amount = _buy(_value, _token, sender, true);
            _round_purchase(_value, _token, sender, neuro_amount, false);
        }
        else {
            NEUROTOKEN.safeTransferFrom(sender, address(this), neuro_amount);
        }
        
        roundInfo memory round = getCurrentRound();
        _stakings[sender].amount = neuro_amount;
        _stakings[sender].startDate = block.timestamp;
        _stakings[sender].releaseDate = block.timestamp + round.stakingDuration;
        _stakings[sender].stakingBasePct = round.stakingBasePct;
        _stakings[sender].stakingDuration = round.stakingDuration;

        _totalStakingSupply = _totalStakingSupply.add(neuro_amount);
        _totalRewardsRequired = _totalRewardsRequired.add(
            _getRewardsAmount(sender, round.stakingBasePct, round.stakingDuration)
        );
        emit Staked(sender, neuro_amount, round.index);
    }

    function withdraw() public nonReentrant {
        require(_stakings[msg.sender].amount > 0, 'Cannot withdraw 0');
        require(block.timestamp > _stakings[msg.sender].releaseDate, 'staking period is active');
        address sender = _msgSender();
        uint256 amount = _stakings[sender].amount;
        uint256 individualAPYReward = _getRewardsAmount(
            sender,
            _stakings[sender].stakingBasePct,
            _stakings[sender].stakingDuration
        );
        roundInfo memory round = getCurrentRound();
        _totalStakingSupply = _totalStakingSupply.sub(amount);
        _totalRewardsRequired = _totalRewardsRequired.sub(individualAPYReward);
        _stakings[sender].amount = 0;
        _stakings[sender].startDate = 0;
        _stakings[sender].releaseDate = 0;
        _stakings[sender].stakingBasePct = 0;
        _stakings[sender].stakingDuration = 0;
        NEUROTOKEN.safeTransfer(sender, amount.add(individualAPYReward));
        emit Withdrawn(msg.sender, amount, individualAPYReward, round.index);
    }

    function updateStart(uint256 _start) external onlyOwner {
        require(_start > 0);
        start = _start;
    }

    function stop() external onlyOwner {
        require(_stopped == false, 'already stopped');
        _stopped = true;
    }

    function unstop() external onlyOwner {
        require(_stopped == true, 'already started');
        _stopped = false;
    }

    function finish_round(uint index) external onlyOwner {
        require(rounds[index].stopped == false, 'already finished');
        rounds[index].stopped = true;
    }

    function emergencyWithdraw(address _token) external onlyOwner nonReentrant {
        uint256 balance = IERC20(_token).balanceOf(address(this));
        address recv = owner();
        IERC20(_token).safeTransfer(recv, balance);
        emit EmergencyWithdrawal(recv, _token, balance);
    }
}
