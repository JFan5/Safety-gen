(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_06 obj_07 - type_1
obj_09 obj_08 obj_05 obj_11 - type_2
obj_04 obj_02 obj_13 obj_10 - type_3
obj_03 obj_12 obj_01 obj_14 - object)
(:init
(pred_1 obj_06 obj_10)
(pred_3 obj_06 obj_09)
(pred_3 obj_06 obj_08)
(pred_1 obj_07 obj_02)
(pred_3 obj_07 obj_05)
(pred_3 obj_07 obj_11)
(pred_2 obj_03 obj_13)
(pred_2 obj_12 obj_02)
(pred_2 obj_01 obj_10)
(pred_2 obj_14 obj_02)
)
(:goal
(and
(pred_2 obj_03 obj_04)
(pred_2 obj_12 obj_13)
(pred_2 obj_01 obj_10)
(pred_2 obj_14 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_13)))
)
)