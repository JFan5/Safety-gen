(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_13 - type_1
obj_02 obj_11 obj_10 obj_06 - type_3
obj_08 obj_12 obj_07 obj_05 - type_2
obj_04 obj_03 obj_01 obj_14 - object)
(:init
(pred_3 obj_09 obj_07)
(pred_4 obj_09 obj_02)
(pred_4 obj_09 obj_11)
(pred_3 obj_13 obj_05)
(pred_4 obj_13 obj_10)
(pred_4 obj_13 obj_06)
(pred_2 obj_04 obj_05)
(pred_2 obj_03 obj_07)
(pred_2 obj_01 obj_12)
(pred_2 obj_14 obj_12)
)
(:goal
(and
(pred_2 obj_04 obj_12)
(pred_2 obj_03 obj_05)
(pred_2 obj_01 obj_05)
(pred_2 obj_14 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_05)))
)
)