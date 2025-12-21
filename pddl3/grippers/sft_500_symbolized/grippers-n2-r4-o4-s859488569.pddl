(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_08 - type_1
obj_14 obj_05 obj_02 obj_06 - type_2
obj_09 obj_01 obj_13 obj_04 - type_3
obj_11 obj_12 obj_07 obj_10 - object)
(:init
(pred_1 obj_03 obj_04)
(pred_3 obj_03 obj_14)
(pred_3 obj_03 obj_05)
(pred_1 obj_08 obj_04)
(pred_3 obj_08 obj_02)
(pred_3 obj_08 obj_06)
(pred_2 obj_11 obj_01)
(pred_2 obj_12 obj_04)
(pred_2 obj_07 obj_09)
(pred_2 obj_10 obj_13)
)
(:goal
(and
(pred_2 obj_11 obj_13)
(pred_2 obj_12 obj_01)
(pred_2 obj_07 obj_09)
(pred_2 obj_10 obj_04)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_13)))
)
)