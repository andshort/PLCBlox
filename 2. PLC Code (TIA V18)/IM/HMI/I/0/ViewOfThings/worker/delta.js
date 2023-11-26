// Stoasy (Synchronous to asynchronous)
// Copyright (c) 2020, Siemens AG
//
// Author: Roland Eckl, DI TI SYA
//
// Updates (e.g. i++) need special handling.
//

async function δ(member, identifier, operator, prefix) {
    let value = await α(member[identifier], true);
    let nvalue = value + (operator == '++' ? 1 : -1);
    await α(member[identifier] = nvalue);
    return prefix ? nvalue : value;
}