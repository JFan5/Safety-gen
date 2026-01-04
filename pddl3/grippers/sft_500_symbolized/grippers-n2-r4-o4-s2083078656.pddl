(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_1
obj_03 obj_05 obj_11 obj_14 - type_3
obj_09 obj_02 obj_13 obj_07 - type_2
obj_06 obj_08 obj_01 obj_12 - object)
(:init
(pred_4 obj_04 obj_07)
(pred_3 obj_04 obj_03)
(pred_3 obj_04 obj_05)
(pred_4 obj_10 obj_02)
(pred_3 obj_10 obj_11)
(pred_3 obj_10 obj_14)
(pred_2 obj_06 obj_02)
(pred_2 obj_08 obj_07)
(pred_2 obj_01 obj_13)
(pred_2 obj_12 obj_09)
)
(:goal
(and
(pred_2 obj_06 obj_02)
(pred_2 obj_08 obj_13)
(pred_2 obj_01 obj_07)
(pred_2 obj_12 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_13)))
)
)