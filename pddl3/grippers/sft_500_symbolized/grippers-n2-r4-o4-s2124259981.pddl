(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_14 - type_1
obj_13 obj_02 obj_04 obj_03 - type_2
obj_07 obj_05 obj_08 obj_09 - type_3
obj_06 obj_11 obj_10 obj_01 - object)
(:init
(pred_1 obj_12 obj_05)
(pred_3 obj_12 obj_13)
(pred_3 obj_12 obj_02)
(pred_1 obj_14 obj_09)
(pred_3 obj_14 obj_04)
(pred_3 obj_14 obj_03)
(pred_2 obj_06 obj_08)
(pred_2 obj_11 obj_05)
(pred_2 obj_10 obj_05)
(pred_2 obj_01 obj_09)
)
(:goal
(and
(pred_2 obj_06 obj_08)
(pred_2 obj_11 obj_07)
(pred_2 obj_10 obj_09)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_12 obj_09) (pred_1 obj_14 obj_09))))
  )
)
)