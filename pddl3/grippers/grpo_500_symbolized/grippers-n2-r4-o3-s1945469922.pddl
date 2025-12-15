(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_12 - type_1
obj_07 obj_08 obj_13 obj_05 - type_3
obj_09 obj_01 obj_02 obj_11 - type_2
obj_06 obj_10 obj_04 - object)
(:init
(pred_3 obj_03 obj_11)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_08)
(pred_3 obj_12 obj_09)
(pred_4 obj_12 obj_13)
(pred_4 obj_12 obj_05)
(pred_2 obj_06 obj_09)
(pred_2 obj_10 obj_02)
(pred_2 obj_04 obj_11)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_10 obj_11)
(pred_2 obj_04 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_02)))
)
)