(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_1
obj_07 obj_13 obj_06 obj_02 - type_2
obj_05 obj_08 obj_03 obj_09 - type_3
obj_11 obj_04 obj_12 - object)
(:init
(pred_1 obj_10 obj_03)
(pred_3 obj_10 obj_07)
(pred_3 obj_10 obj_13)
(pred_1 obj_01 obj_09)
(pred_3 obj_01 obj_06)
(pred_3 obj_01 obj_02)
(pred_2 obj_11 obj_03)
(pred_2 obj_04 obj_05)
(pred_2 obj_12 obj_05)
)
(:goal
(and
(pred_2 obj_11 obj_09)
(pred_2 obj_04 obj_03)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_09) (pred_1 obj_01 obj_09))))
  )
)
)