(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_03 - type_1
obj_07 obj_14 obj_04 obj_05 - type_3
obj_09 obj_13 obj_11 obj_08 - type_2
obj_01 obj_06 obj_12 obj_10 - object)
(:init
(pred_3 obj_02 obj_11)
(pred_4 obj_02 obj_07)
(pred_4 obj_02 obj_14)
(pred_3 obj_03 obj_09)
(pred_4 obj_03 obj_04)
(pred_4 obj_03 obj_05)
(pred_2 obj_01 obj_09)
(pred_2 obj_06 obj_08)
(pred_2 obj_12 obj_13)
(pred_2 obj_10 obj_08)
)
(:goal
(and
(pred_2 obj_01 obj_09)
(pred_2 obj_06 obj_11)
(pred_2 obj_12 obj_09)
(pred_2 obj_10 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_08)))
)
)