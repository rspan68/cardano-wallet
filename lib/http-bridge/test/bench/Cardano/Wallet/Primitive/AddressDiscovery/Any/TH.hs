{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}


-- |
-- Copyright: © 2018-2019 IOHK
-- License: MIT
--
-- Automatically generated code via Template-Haskell. Contains necessary
-- database rows and columns declaration to work with 'AnyAddressState'.

module Cardano.Wallet.Primitive.AddressDiscovery.Any.TH where

import Prelude

import Cardano.Wallet.DB.Sqlite.Types
    ( sqlSettings' )
import Database.Persist.TH
    ( mkDeleteCascade, mkMigrate, mkPersist, persistLowerCase, share )
import GHC.Generics
    ( Generic )

import qualified Cardano.Wallet.Primitive.Types as W

share
    [ mkPersist sqlSettings'
    , mkDeleteCascade sqlSettings'
    , mkMigrate "migrateAll"
    ]
    [persistLowerCase|
AnyAddressState
    anyAddressStateTableWalletId        W.WalletId  sql=wallet_id
    anyAddressStateTableCheckpointSlot  W.SlotId    sql=slot
    anyAddressStateTableProportion      Double      sql=proportion

    UniqueAnyAddressState anyAddressStateTableWalletId anyAddressStateTableCheckpointSlot
    -- Foreign Checkpoint fk_checkpoint_any_address_state anyAddressStateTableWalletId anyAddressStateTableCheckpointSlot
    deriving Show Generic
|]