(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_01 - type_1
obj_10 obj_14 obj_13 obj_02 - type_3
obj_12 obj_07 obj_06 obj_08 - type_2
obj_11 obj_05 obj_03 obj_09 - object)
(:init
(pred_4 obj_04 obj_12)
(pred_2 obj_04 obj_10)
(pred_2 obj_04 obj_14)
(pred_4 obj_01 obj_12)
(pred_2 obj_01 obj_13)
(pred_2 obj_01 obj_02)
(pred_3 obj_11 obj_08)
(pred_3 obj_05 obj_12)
(pred_3 obj_03 obj_08)
(pred_3 obj_09 obj_08)
)
(:goal
(and
(pred_3 obj_11 obj_06)
(pred_3 obj_05 obj_12)
(pred_3 obj_03 obj_06)
(pred_3 obj_09 obj_08)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_06)))
)
)