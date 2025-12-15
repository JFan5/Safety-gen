(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_14 - type_1
obj_04 obj_13 obj_06 obj_08 - type_3
obj_07 obj_05 obj_09 obj_02 - type_2
obj_10 obj_11 obj_03 obj_01 - object)
(:init
(pred_3 obj_12 obj_02)
(pred_4 obj_12 obj_04)
(pred_4 obj_12 obj_13)
(pred_3 obj_14 obj_02)
(pred_4 obj_14 obj_06)
(pred_4 obj_14 obj_08)
(pred_2 obj_10 obj_09)
(pred_2 obj_11 obj_07)
(pred_2 obj_03 obj_09)
(pred_2 obj_01 obj_09)
)
(:goal
(and
(pred_2 obj_10 obj_02)
(pred_2 obj_11 obj_05)
(pred_2 obj_03 obj_07)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_09)))
)
)