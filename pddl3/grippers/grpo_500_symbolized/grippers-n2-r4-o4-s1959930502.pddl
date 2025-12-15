(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_13 - type_1
obj_04 obj_10 obj_11 obj_14 - type_3
obj_08 obj_03 obj_05 obj_02 - type_2
obj_12 obj_06 obj_09 obj_01 - object)
(:init
(pred_3 obj_07 obj_03)
(pred_4 obj_07 obj_04)
(pred_4 obj_07 obj_10)
(pred_3 obj_13 obj_08)
(pred_4 obj_13 obj_11)
(pred_4 obj_13 obj_14)
(pred_2 obj_12 obj_02)
(pred_2 obj_06 obj_05)
(pred_2 obj_09 obj_08)
(pred_2 obj_01 obj_03)
)
(:goal
(and
(pred_2 obj_12 obj_08)
(pred_2 obj_06 obj_08)
(pred_2 obj_09 obj_02)
(pred_2 obj_01 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_05)))
)
)