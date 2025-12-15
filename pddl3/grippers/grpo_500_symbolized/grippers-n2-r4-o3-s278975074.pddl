(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_1
obj_13 obj_01 obj_03 obj_06 - type_3
obj_04 obj_11 obj_09 obj_10 - type_2
obj_05 obj_02 obj_12 - object)
(:init
(pred_3 obj_08 obj_09)
(pred_4 obj_08 obj_13)
(pred_4 obj_08 obj_01)
(pred_3 obj_07 obj_04)
(pred_4 obj_07 obj_03)
(pred_4 obj_07 obj_06)
(pred_2 obj_05 obj_09)
(pred_2 obj_02 obj_04)
(pred_2 obj_12 obj_04)
)
(:goal
(and
(pred_2 obj_05 obj_04)
(pred_2 obj_02 obj_04)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_09) (pred_3 obj_07 obj_09))))
  )
)
)