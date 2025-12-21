(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_03 - type_1
obj_05 obj_11 obj_13 obj_14 - type_2
obj_09 obj_02 obj_08 obj_07 - type_3
obj_01 obj_04 obj_06 obj_10 - object)
(:init
(pred_1 obj_12 obj_02)
(pred_3 obj_12 obj_05)
(pred_3 obj_12 obj_11)
(pred_1 obj_03 obj_08)
(pred_3 obj_03 obj_13)
(pred_3 obj_03 obj_14)
(pred_2 obj_01 obj_09)
(pred_2 obj_04 obj_08)
(pred_2 obj_06 obj_09)
(pred_2 obj_10 obj_07)
)
(:goal
(and
(pred_2 obj_01 obj_09)
(pred_2 obj_04 obj_02)
(pred_2 obj_06 obj_08)
(pred_2 obj_10 obj_08)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_08)))
)
)