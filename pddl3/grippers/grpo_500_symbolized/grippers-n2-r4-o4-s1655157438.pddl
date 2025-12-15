(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_07 - type_1
obj_02 obj_14 obj_12 obj_11 - type_3
obj_06 obj_09 obj_04 obj_13 - type_2
obj_05 obj_10 obj_08 obj_01 - object)
(:init
(pred_3 obj_03 obj_04)
(pred_4 obj_03 obj_02)
(pred_4 obj_03 obj_14)
(pred_3 obj_07 obj_06)
(pred_4 obj_07 obj_12)
(pred_4 obj_07 obj_11)
(pred_2 obj_05 obj_04)
(pred_2 obj_10 obj_06)
(pred_2 obj_08 obj_06)
(pred_2 obj_01 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_04)
(pred_2 obj_10 obj_04)
(pred_2 obj_08 obj_06)
(pred_2 obj_01 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_13)))
)
)