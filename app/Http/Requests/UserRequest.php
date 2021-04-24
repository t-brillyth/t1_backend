<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
   /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'email'    => 'required|email|unique:users,email|confirmed|max:55',
            'email_confirmation' => 'required|max:55',
            'name'     => 'required|min:3|max:150',
            'username' => 'required|min:3|unique:users,username|max:150',
            'password' => 'required|min:10|max:25|confirmed',
            'address'  => 'required',
            'password_confirmation' => 'required|min:10|max:25',
            'identification' => 'required|numeric|min:100000|max:9999999999',
            'lastname' => 'required',
            'phone' => 'required|numeric|min:2000000|max:3999999999',
        ];
    }

    public function messages()
    {
        return [
            'email.required'    => 'El Correo electrónico es requerido',
            'email.email'    => 'El Correo electrónico es invalido',
            'email.unique'    => 'El Correo electrónico ya fue registrado',
            'email.confirmed'  => 'La confirmación del Correo electrónico es erronea',
            'email.max'  => 'Solo se permiten 55 caracteres como máximo',
            'email_confirmation.required' => 'La confirmación del Correo electrónico es requerida',
            'email_confirmation.max' => 'Solo se permiten 55 caracteres como máximo',
            'name.required'     => 'El nombre es requerido',
            'name.min'     => 'El nombre es de minímo 3 caracteres',
            'name.max'     => 'El nombre es de máximo 150 caracteres',
            'name.alpha_num'     => 'El nombre es alfa-numerico',
            'username.required' => 'El username es requerido',
            'username.min' => 'El username es de mínimo 3 caracteres',
            'username.unique' => 'El username ya fue registrado',
            'username.max' => 'El username es de máximo 150 caracteres',
            'password.required' => 'La contraseña es requerida',
            'password.min' => 'La contraseña es mínimo de 10 caracteres',
            'password.max' => 'La contraseña es máximo de 25 caracteres',
            'password.confirmed' => 'La confirmación de la contraseña es erronea',
            'address.required' => 'La dirección es requerida',
            'password_confirmation.required' => 'La confirmacion de la contraseña es requerida',
            'password_confirmation.min' => 'La confirmacion del correo electrónico es mínimo de 10 caracteres',
            'password_confirmation.max' => 'La confirmacion del correo electrónico es máximo de 25 caracteres',
            'identification.required' => 'La cédula es requerida',
            'identification.numeric' => 'La cédula debe ser numerica',
            'identification.min' => 'El valor mínimo de la cédula es 100000',
            'identification.max' => 'El valor máximo de la cédula es 9999999999',
            'lastname.required' => 'Los apellidos son requeridos',
            'phone.required' => 'El teléfono es requerida',
            'phone.numeric' => 'El teléfono debe ser numerica',
            'phone.min' => 'El valor mínimo del teléfono es 2000000',
            'phone.max' => 'El valor máximo del teléfono es 3999999999',
        ];

    }
}
