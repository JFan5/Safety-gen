(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_05 - type_1
obj_02 obj_06 obj_09 obj_14 - type_3
obj_12 obj_11 obj_13 obj_04 - type_2
obj_01 obj_10 obj_08 obj_03 - object)
(:init
(pred_4 obj_07 obj_04)
(pred_2 obj_07 obj_02)
(pred_2 obj_07 obj_06)
(pred_4 obj_05 obj_13)
(pred_2 obj_05 obj_09)
(pred_2 obj_05 obj_14)
(pred_3 obj_01 obj_12)
(pred_3 obj_10 obj_13)
(pred_3 obj_08 obj_04)
(pred_3 obj_03 obj_11)
)
(:goal
(and
(pred_3 obj_01 obj_04)
(pred_3 obj_10 obj_11)
(pred_3 obj_08 obj_04)
(pred_3 obj_03 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_13)))
)
)