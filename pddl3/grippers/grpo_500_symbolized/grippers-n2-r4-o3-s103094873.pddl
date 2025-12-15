(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_08 - type_1
obj_05 obj_07 obj_02 obj_06 - type_3
obj_09 obj_10 obj_13 obj_11 - type_2
obj_03 obj_01 obj_12 - object)
(:init
(pred_3 obj_04 obj_11)
(pred_4 obj_04 obj_05)
(pred_4 obj_04 obj_07)
(pred_3 obj_08 obj_09)
(pred_4 obj_08 obj_02)
(pred_4 obj_08 obj_06)
(pred_2 obj_03 obj_13)
(pred_2 obj_01 obj_10)
(pred_2 obj_12 obj_11)
)
(:goal
(and
(pred_2 obj_03 obj_11)
(pred_2 obj_01 obj_09)
(pred_2 obj_12 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_13)))
)
)