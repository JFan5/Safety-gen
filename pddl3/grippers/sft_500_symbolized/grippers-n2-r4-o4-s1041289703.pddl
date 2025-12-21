(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_03 - type_1
obj_14 obj_08 obj_13 obj_11 - type_2
obj_02 obj_04 obj_10 obj_05 - type_3
obj_01 obj_06 obj_07 obj_09 - object)
(:init
(pred_1 obj_12 obj_05)
(pred_3 obj_12 obj_14)
(pred_3 obj_12 obj_08)
(pred_1 obj_03 obj_02)
(pred_3 obj_03 obj_13)
(pred_3 obj_03 obj_11)
(pred_2 obj_01 obj_02)
(pred_2 obj_06 obj_10)
(pred_2 obj_07 obj_04)
(pred_2 obj_09 obj_04)
)
(:goal
(and
(pred_2 obj_01 obj_05)
(pred_2 obj_06 obj_02)
(pred_2 obj_07 obj_05)
(pred_2 obj_09 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_10)))
)
)