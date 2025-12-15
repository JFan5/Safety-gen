(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_11 - type_1
obj_06 obj_05 obj_14 obj_09 - type_3
obj_07 obj_10 obj_13 obj_02 - type_2
obj_08 obj_04 obj_12 obj_03 - object)
(:init
(pred_3 obj_01 obj_02)
(pred_4 obj_01 obj_06)
(pred_4 obj_01 obj_05)
(pred_3 obj_11 obj_02)
(pred_4 obj_11 obj_14)
(pred_4 obj_11 obj_09)
(pred_2 obj_08 obj_10)
(pred_2 obj_04 obj_13)
(pred_2 obj_12 obj_07)
(pred_2 obj_03 obj_07)
)
(:goal
(and
(pred_2 obj_08 obj_13)
(pred_2 obj_04 obj_07)
(pred_2 obj_12 obj_13)
(pred_2 obj_03 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_13)))
)
)