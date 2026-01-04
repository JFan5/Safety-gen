(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_13 - type_2
obj_06 obj_08 obj_04 obj_05 - type_1
obj_10 obj_07 obj_02 obj_09 - type_3
obj_03 obj_01 obj_12 - object)
(:init
(pred_3 obj_11 obj_09)
(pred_1 obj_11 obj_06)
(pred_1 obj_11 obj_08)
(pred_3 obj_13 obj_09)
(pred_1 obj_13 obj_04)
(pred_1 obj_13 obj_05)
(pred_2 obj_03 obj_07)
(pred_2 obj_01 obj_02)
(pred_2 obj_12 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_01 obj_07)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_02)))
)
)