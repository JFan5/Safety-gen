(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_03 - type_3
obj_04 obj_05 obj_09 obj_08 - type_2
obj_06 obj_02 obj_13 obj_11 - type_1
obj_07 obj_12 obj_14 obj_10 - object)
(:init
(pred_2 obj_01 obj_02)
(pred_4 obj_01 obj_04)
(pred_4 obj_01 obj_05)
(pred_2 obj_03 obj_06)
(pred_4 obj_03 obj_09)
(pred_4 obj_03 obj_08)
(pred_3 obj_07 obj_06)
(pred_3 obj_12 obj_06)
(pred_3 obj_14 obj_02)
(pred_3 obj_10 obj_06)
)
(:goal
(and
(pred_3 obj_07 obj_13)
(pred_3 obj_12 obj_11)
(pred_3 obj_14 obj_02)
(pred_3 obj_10 obj_02)
)
)

(:constraints
  (always (not (pred_2 obj_01 obj_13)))
)
)