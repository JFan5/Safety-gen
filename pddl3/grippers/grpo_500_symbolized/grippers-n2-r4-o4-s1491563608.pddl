(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_01 - type_1
obj_02 obj_07 obj_03 obj_05 - type_3
obj_06 obj_13 obj_12 obj_08 - type_2
obj_14 obj_10 obj_04 obj_09 - object)
(:init
(pred_3 obj_11 obj_12)
(pred_4 obj_11 obj_02)
(pred_4 obj_11 obj_07)
(pred_3 obj_01 obj_06)
(pred_4 obj_01 obj_03)
(pred_4 obj_01 obj_05)
(pred_2 obj_14 obj_13)
(pred_2 obj_10 obj_12)
(pred_2 obj_04 obj_12)
(pred_2 obj_09 obj_13)
)
(:goal
(and
(pred_2 obj_14 obj_13)
(pred_2 obj_10 obj_08)
(pred_2 obj_04 obj_12)
(pred_2 obj_09 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_08)))
)
)