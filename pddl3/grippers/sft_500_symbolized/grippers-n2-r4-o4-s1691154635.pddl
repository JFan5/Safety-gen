(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_11 - type_1
obj_08 obj_13 obj_07 obj_04 - type_2
obj_01 obj_12 obj_06 obj_05 - type_3
obj_10 obj_03 obj_14 obj_09 - object)
(:init
(pred_4 obj_02 obj_05)
(pred_3 obj_02 obj_08)
(pred_3 obj_02 obj_13)
(pred_4 obj_11 obj_12)
(pred_3 obj_11 obj_07)
(pred_3 obj_11 obj_04)
(pred_2 obj_10 obj_01)
(pred_2 obj_03 obj_06)
(pred_2 obj_14 obj_12)
(pred_2 obj_09 obj_06)
)
(:goal
(and
(pred_2 obj_10 obj_05)
(pred_2 obj_03 obj_12)
(pred_2 obj_14 obj_01)
(pred_2 obj_09 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_06)))
)
)