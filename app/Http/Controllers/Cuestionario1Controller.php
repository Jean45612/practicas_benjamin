<?php

namespace App\Http\Controllers;

use App\Models\Cuestionario1;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use TCG\Voyager\Facades\Voyager;

class Cuestionario1Controller extends \TCG\Voyager\Http\Controllers\VoyagerBaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $slug = $this->getSlug($request);
        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (Auth::user()->role_id == 3) {

            // Check permission
            $this->authorize('add', app($dataType->model_name));

            $dataTypeContent = (strlen($dataType->model_name) != 0)
                ? new $dataType->model_name()
                : false;

            foreach ($dataType->addRows as $key => $row) {
                $dataType->addRows[$key]['col_width'] = $row->details->width ?? 100;
            }

            // If a column has a relationship associated with it, we do not want to show that field
            $this->removeRelationshipField($dataType, 'add');

            // Check if BREAD is Translatable
            $isModelTranslatable = is_bread_translatable($dataTypeContent);

            // Eagerload Relations
            $this->eagerLoadRelations($dataTypeContent, $dataType, 'add', $isModelTranslatable);

            $view = 'voyager::bread.edit-add';

            if (view()->exists("voyager::$slug.edit-add")) {
                $view = "voyager::$slug.edit-add";
            }

            return Voyager::view($view, compact('dataType', 'dataTypeContent', 'isModelTranslatable'));
        } else {

            // Check permission
            $this->authorize('browse', app($dataType->model_name));

            $getter = $dataType->server_side ? 'paginate' : 'get';

            $search = (object) ['value' => $request->get('s'), 'key' => $request->get('key'), 'filter' => $request->get('filter')];

            $searchNames = [];
            if ($dataType->server_side) {
                $searchable = SchemaManager::describeTable(app($dataType->model_name)->getTable())->pluck('name')->toArray();
                $dataRow = Voyager::model('DataRow')->whereDataTypeId($dataType->id)->get();
                foreach ($searchable as $key => $value) {
                    $field = $dataRow->where('field', $value)->first();
                    $displayName = ucwords(str_replace('_', ' ', $value));
                    if ($field !== null) {
                        $displayName = $field->getTranslatedAttribute('display_name');
                    }
                    $searchNames[$value] = $displayName;
                }
            }

            $orderBy = $request->get('order_by', $dataType->order_column);
            $sortOrder = $request->get('sort_order', $dataType->order_direction);
            $usesSoftDeletes = false;
            $showSoftDeleted = false;

            // Next Get or Paginate the actual content from the MODEL that corresponds to the slug DataType
            if (strlen($dataType->model_name) != 0) {
                $model = app($dataType->model_name);

                if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope' . ucfirst($dataType->scope))) {
                    $query = $model->{$dataType->scope}();
                } else {
                    $query = $model::select('*');
                }

                // Use withTrashed() if model uses SoftDeletes and if toggle is selected
                if ($model && in_array(SoftDeletes::class, class_uses_recursive($model)) && Auth::user()->can('delete', app($dataType->model_name))) {
                    $usesSoftDeletes = true;

                    if ($request->get('showSoftDeleted')) {
                        $showSoftDeleted = true;
                        $query = $query->withTrashed();
                    }
                }

                // If a column has a relationship associated with it, we do not want to show that field
                $this->removeRelationshipField($dataType, 'browse');

                if ($search->value != '' && $search->key && $search->filter) {
                    $search_filter = ($search->filter == 'equals') ? '=' : 'LIKE';
                    $search_value = ($search->filter == 'equals') ? $search->value : '%' . $search->value . '%';
                    $query->where($search->key, $search_filter, $search_value);
                }

                if ($orderBy && in_array($orderBy, $dataType->fields())) {
                    $querySortOrder = (!empty($sortOrder)) ? $sortOrder : 'desc';
                    $dataTypeContent = call_user_func([
                        $query->orderBy($orderBy, $querySortOrder),
                        $getter,
                    ]);
                } elseif ($model->timestamps) {
                    $dataTypeContent = call_user_func([$query->latest($model::CREATED_AT), $getter]);
                } else {
                    $dataTypeContent = call_user_func([$query->orderBy($model->getKeyName(), 'DESC'), $getter]);
                }

                // Replace relationships' keys for labels and create READ links if a slug is provided.
                $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType);
            } else {
                // If Model doesn't exist, get data from table name
                $dataTypeContent = call_user_func([DB::table($dataType->name), $getter]);
                $model = false;
            }

            // Check if BREAD is Translatable
            $isModelTranslatable = is_bread_translatable($model);

            // Eagerload Relations
            $this->eagerLoadRelations($dataTypeContent, $dataType, 'browse', $isModelTranslatable);

            // Check if server side pagination is enabled
            $isServerSide = isset($dataType->server_side) && $dataType->server_side;

            // Check if a default search key is set
            $defaultSearchKey = $dataType->default_search_key ?? null;

            // Actions
            $actions = [];
            if (!empty($dataTypeContent->first())) {
                foreach (Voyager::actions() as $action) {
                    $action = new $action($dataType, $dataTypeContent->first());

                    if ($action->shouldActionDisplayOnDataType()) {
                        $actions[] = $action;
                    }
                }
            }

            // Define showCheckboxColumn
            $showCheckboxColumn = false;
            if (Auth::user()->can('delete', app($dataType->model_name))) {
                $showCheckboxColumn = true;
            } else {
                foreach ($actions as $action) {
                    if (method_exists($action, 'massAction')) {
                        $showCheckboxColumn = true;
                    }
                }
            }

            // Define orderColumn
            $orderColumn = [];
            if ($orderBy) {
                $index = $dataType->browseRows->where('field', $orderBy)->keys()->first() + ($showCheckboxColumn ? 1 : 0);
                $orderColumn = [[$index, $sortOrder ?? 'desc']];
            }

            $view = 'voyager::bread.browse';

            if (view()->exists("voyager::$slug.browse")) {
                $view = "voyager::$slug.browse";
            }

            return Voyager::view($view, compact(
                'actions',
                'dataType',
                'dataTypeContent',
                'isModelTranslatable',
                'search',
                'orderBy',
                'orderColumn',
                'sortOrder',
                'searchNames',
                'isServerSide',
                'defaultSearchKey',
                'usesSoftDeletes',
                'showSoftDeleted',
                'showCheckboxColumn'
            ));
        }
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    // public function create(Request $request)
    // {
    //     //
    // }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        $slug = $this->getSlug($request);

        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $val = $this->validateBread($request->all(), $dataType->addRows)->validate();

        $redirect = redirect()->route("voyager.{$dataType->slug}.index");

        $validar = Cuestionario1::where('alumno_id', Auth::user()->estudiante->id)->first();

        if (!$validar) {
            Cuestionario1::create(array_merge($data, ['alumno_id' => Auth::user()->estudiante->id]));
            $message = __('voyager::generic.successfully_added_new') . " {$dataType->getTranslatedAttribute('display_name_singular')}";
            $alert = "success";
        } else {
            $message = "Usted ya registró el cuestionario.";
            $alert = "warning";
        }

        return $redirect->with([
            'message'    => $message,
            'alert-type' => $alert,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function show($id)
    // {
    //     //
    // }

    // /**
    //  * Show the form for editing the specified resource.
    //  *
    //  * @param  int  $id
    //  * @return \Illuminate\Http\Response
    //  */
    // public function edit($id)
    // {
    //     //
    // }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function update(Request $request, $id)
    // {
    //     //
    // }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    // public function destroy($id)
    // {
    //     //
    // }
}
