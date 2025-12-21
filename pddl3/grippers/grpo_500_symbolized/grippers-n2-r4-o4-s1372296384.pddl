(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_13 - type_1
obj_14 obj_02 obj_05 obj_12 - type_3
obj_03 obj_07 obj_09 obj_10 - type_2
obj_11 obj_06 obj_01 obj_08 - object)
(:init
(pred_4 obj_04 obj_07)
(pred_2 obj_04 obj_14)
(pred_2 obj_04 obj_02)
(pred_4 obj_13 obj_07)
(pred_2 obj_13 obj_05)
(pred_2 obj_13 obj_12)
(pred_3 obj_11 obj_07)
(pred_3 obj_06 obj_03)
(pred_3 obj_01 obj_03)
(pred_3 obj_08 obj_03)
)
(:goal
(and
(pred_3 obj_11 obj_10)
(pred_3 obj_06 obj_07)
(pred_3 obj_01 obj_09)
(pred_3 obj_08 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_09)))
)
)