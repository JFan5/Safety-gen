(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_03 - type_1
obj_05 obj_08 obj_01 obj_10 - type_3
obj_09 obj_04 obj_13 obj_02 - type_2
obj_12 obj_11 obj_14 obj_06 - object)
(:init
(pred_4 obj_07 obj_02)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_08)
(pred_4 obj_03 obj_02)
(pred_2 obj_03 obj_01)
(pred_2 obj_03 obj_10)
(pred_3 obj_12 obj_04)
(pred_3 obj_11 obj_13)
(pred_3 obj_14 obj_04)
(pred_3 obj_06 obj_09)
)
(:goal
(and
(pred_3 obj_12 obj_09)
(pred_3 obj_11 obj_04)
(pred_3 obj_14 obj_13)
(pred_3 obj_06 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_13)))
)
)