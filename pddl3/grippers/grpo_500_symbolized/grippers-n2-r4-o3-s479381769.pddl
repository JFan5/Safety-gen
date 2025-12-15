(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_1
obj_03 obj_08 obj_13 obj_10 - type_3
obj_12 obj_05 obj_06 obj_07 - type_2
obj_04 obj_02 obj_01 - object)
(:init
(pred_3 obj_11 obj_12)
(pred_4 obj_11 obj_03)
(pred_4 obj_11 obj_08)
(pred_3 obj_09 obj_07)
(pred_4 obj_09 obj_13)
(pred_4 obj_09 obj_10)
(pred_2 obj_04 obj_05)
(pred_2 obj_02 obj_06)
(pred_2 obj_01 obj_07)
)
(:goal
(and
(pred_2 obj_04 obj_06)
(pred_2 obj_02 obj_05)
(pred_2 obj_01 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_06)))
)
)