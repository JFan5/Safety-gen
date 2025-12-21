(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_06 obj_08 obj_01 obj_10 - type_2
obj_07 obj_03 obj_13 obj_09 - type_3
obj_11 obj_05 obj_04 - object)
(:init
(pred_1 obj_02 obj_09)
(pred_3 obj_02 obj_06)
(pred_3 obj_02 obj_08)
(pred_1 obj_12 obj_03)
(pred_3 obj_12 obj_01)
(pred_3 obj_12 obj_10)
(pred_2 obj_11 obj_13)
(pred_2 obj_05 obj_07)
(pred_2 obj_04 obj_13)
)
(:goal
(and
(pred_2 obj_11 obj_09)
(pred_2 obj_05 obj_07)
(pred_2 obj_04 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_09) (pred_1 obj_12 obj_09))))
  )
)
)