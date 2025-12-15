(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_1
obj_04 obj_12 obj_09 obj_08 - type_3
obj_07 obj_03 obj_06 obj_02 - type_2
obj_11 obj_14 obj_13 obj_10 - object)
(:init
(pred_3 obj_01 obj_07)
(pred_4 obj_01 obj_04)
(pred_4 obj_01 obj_12)
(pred_3 obj_05 obj_03)
(pred_4 obj_05 obj_09)
(pred_4 obj_05 obj_08)
(pred_2 obj_11 obj_03)
(pred_2 obj_14 obj_06)
(pred_2 obj_13 obj_07)
(pred_2 obj_10 obj_07)
)
(:goal
(and
(pred_2 obj_11 obj_06)
(pred_2 obj_14 obj_07)
(pred_2 obj_13 obj_06)
(pred_2 obj_10 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_06)))
)
)