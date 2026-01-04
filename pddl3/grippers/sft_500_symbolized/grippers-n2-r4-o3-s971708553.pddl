(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_07 - type_2
obj_13 obj_04 obj_09 obj_05 - type_3
obj_06 obj_02 obj_12 obj_10 - type_1
obj_03 obj_11 obj_08 - object)
(:init
(pred_2 obj_01 obj_02)
(pred_3 obj_01 obj_13)
(pred_3 obj_01 obj_04)
(pred_2 obj_07 obj_02)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_05)
(pred_4 obj_03 obj_10)
(pred_4 obj_11 obj_06)
(pred_4 obj_08 obj_02)
)
(:goal
(and
(pred_4 obj_03 obj_12)
(pred_4 obj_11 obj_06)
(pred_4 obj_08 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_01 obj_12)))
)
)