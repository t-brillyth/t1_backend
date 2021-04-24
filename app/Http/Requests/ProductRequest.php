<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends FormRequest
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
    
    public function rules()
    {
        return [
            'name'        => 'required|unique:products,name|min:3|max:50',
            'description' => 'required|max:100',
            'brand'       => 'required',
            'price'       => 'required|numeric|min:5000|max:150000',
            'discount'    => 'required|numeric|min:0|max:100',
            'stock'       => 'required|numeric|min:10|max:100000',
            'size'        => 'required|min:1|max:50',
            'code'        => 'required|min:1|max:50|unique:products,code',
            'category_id' => 'required|exists:category,internal_url'
        ];
    }

    public function messages()
    {
        return [
            'name.required'  => 'El nombre de la categoria es requerido',
            'name.unique'    => 'El nombre de la categoria ya fue registrado',
            'name.min'       => 'Solo se permiten 3 caracteres como mínimo',
            'name.max'       => 'Solo se permiten 50 caracteres como máximo',
            'description.required'  => 'La descripción es requerida',
            'description.max'       => 'Solo se permiten 100 caracteres como máximo',
            'brand.required'         => 'La Marca es reuqrida',
            'price.required'  => 'El precio es requerido',
            'price.numeric'   => 'El precio debe ser numerico',
            'price.min'       => 'El presio es mínimo de 5000 pesos',
            'price.max'       => 'El presio es de máximo 150000 pesos',
            'discount.required'  => 'El descuento es requerido',
            'discount.numeric'   => 'El descuento debe ser numerico',
            'discount.min'       => 'El descuento es mínimo de 0 porciento',
            'discount.max'       => 'El descuento es mínimo de 100 porciento',
            'stock.required'  => 'La cantidad de unidades del producto es requerid',
            'stock.numeric'   => 'La cantidad debe ser numerica',
            'stock.min'       => 'La cantidad es mínimo es de 10 unidades',
            'stock.max'       => 'La cantidad es máximo de 100000 unidades',
            'size.required'  => 'El tamaño es requerido',
            'size.string'    => 'El tamaño debe ser texto no numerico',
            'size.min'       => 'El tamaño debe ser de 1 caracteres como mínimo',
            'size.max'       => 'El tamaño debe ser de 50 caracteres como máximo',
            'code.required' => 'El codigo es requerido',
            'code.min'      => 'Solo se permiten 1 caracteres como mínimo',
            'code.max'      => 'Solo se permiten 20 caracteres como máximo',
            'code.unique'   => 'El codigo ya fue registrado',
            'category_id.required' => 'La categoria es requerida',
            'category_id.exists' => 'La categoria debe de existir',
        ];

    }
    
    
    
}   

