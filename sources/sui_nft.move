/*
/// Module: sui_nft
module sui_nft::sui_nft;
*/
module sui_nft::sui_nft{
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use std::string::String;

    struct NFT has key, store {
        id: UID, 
        name: String, 
        description: String,
        // numberOfSales: u64,
        // currentOwner: address
  }

    

    public entry fun mint (name: String, description: String, ctx: &mut TxContext){
        //create the NFT
        let nft : NFT = NFT {
            id : object::new(ctx),
            name : name,
            description : description,
        };

        //mint and send the NFT to the caller
        let sender = tx_context::sender(ctx);

        //transfer the nft to the caller
        transfer::public_transfer(nft, sender)
    }  

    //transfer the NFT to another address
    public entry fun transfer(nft: NFT, recipient: address){
        transfer::transfer(nft, recipient);
    }
}