(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_14 - type_1
obj_07 obj_09 obj_13 obj_02 - type_3
obj_03 obj_08 obj_06 obj_11 - type_2
obj_10 obj_12 obj_04 obj_05 - object)
(:init
(pred_3 obj_01 obj_11)
(pred_4 obj_01 obj_07)
(pred_4 obj_01 obj_09)
(pred_3 obj_14 obj_08)
(pred_4 obj_14 obj_13)
(pred_4 obj_14 obj_02)
(pred_2 obj_10 obj_06)
(pred_2 obj_12 obj_03)
(pred_2 obj_04 obj_08)
(pred_2 obj_05 obj_03)
)
(:goal
(and
(pred_2 obj_10 obj_03)
(pred_2 obj_12 obj_06)
(pred_2 obj_04 obj_03)
(pred_2 obj_05 obj_08)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_06)))
)
)