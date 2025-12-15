(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_12 - type_3
obj_04 obj_10 obj_08 obj_03 - type_1
obj_09 obj_13 obj_02 obj_06 - type_2
obj_11 obj_01 obj_14 obj_05 - object)
(:init
(pred_4 obj_07 obj_02)
(pred_3 obj_07 obj_04)
(pred_3 obj_07 obj_10)
(pred_4 obj_12 obj_02)
(pred_3 obj_12 obj_08)
(pred_3 obj_12 obj_03)
(pred_1 obj_11 obj_06)
(pred_1 obj_01 obj_13)
(pred_1 obj_14 obj_06)
(pred_1 obj_05 obj_06)
)
(:goal
(and
(pred_1 obj_11 obj_13)
(pred_1 obj_01 obj_06)
(pred_1 obj_14 obj_13)
(pred_1 obj_05 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_06)))
)
)