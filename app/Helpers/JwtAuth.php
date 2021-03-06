<?php

namespace App\Helpers;

use Firebase\JWT\JWT;
use DB;
use App\User;
use Illuminate\Support\Facades\Auth;

class JwtAuth{

    public $sKey;

    public function __construct()
    {
        $this->sKey = '91012202364DKfrostJeronimo';
    }

    public function signup($sEmail,$sPassword,$sGetToken=null){
       
        $oUser = null;
        if (Auth::attempt(['email' => $sEmail, 'password' => $sPassword])) {
            // Authentication passed...
            $oUser = User::where(
                [
                    'email' => $sEmail
                   
                ]
            )->first();
        }
   
        $bSignup = false;
        if(is_object($oUser)){
            $bSignup = true;
        }
       
        if(true === $bSignup){
            $aToken = [
                'sub'   => $oUser->internal_url,
                'name'  => $oUser->name,
                'role'  => $oUser->roles_id,
                'iat'      => time(),
                'exp'      => time() + (7*24*60*60)
            ];

            $sJwt = JWT::encode($aToken,$this->sKey,'HS256');
            $oDecodeJwt = JWT::decode($sJwt,$this->sKey,['HS256']);

            if(is_null($sGetToken)){
                return $sJwt;
            }else{
                
                return $oDecodeJwt;
            }

        }else{

            return [
                'status'  => 'error',
                'message' => 'Email o contraseña invalida'
            ];

        }


    }

    public function checkToken($sJwt,$bGetIdentity = false){
        $bAuth = false;
        $oDecoded = JWT::decode($sJwt,$this->sKey,['HS256']);
        
        try{
            $oDecoded = JWT::decode($sJwt,$this->sKey,['HS256']);
            
        }catch (\UnexpectedValueException $e){
            $bAuth = false;
        }catch (\DomainException $e){
            $bAuth = false;
        }

        if(isset($oDecoded) && is_object($oDecoded) && isset($oDecoded->sub)){
            $bAuth = true;
        }else{
            $bAuth = false;
        }

        if($bGetIdentity){
            return $oDecoded;
        }

        return $bAuth;

    }
    
    public function checkIdentity($sJwt,$bGetIdentity = false){
        $bAuth = false;
        try{
            $oDecoded = JWT::decode($sJwt,$this->sKey,['HS256']);
        }catch (\UnexpectedValueException $e){
            $bAuth = false;
        }catch (\DomainException $e){
            $bAuth = false;
        }

        if(isset($oDecoded) && is_object($oDecoded)){
            $bAuth = true;
        }else{
            $bAuth = false;
        }

        if($bGetIdentity){
            return $oDecoded;
        }

        return $bAuth;
        
    }
}