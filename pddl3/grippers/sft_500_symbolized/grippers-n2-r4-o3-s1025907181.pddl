(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_11 - type_1
obj_08 obj_09 obj_03 obj_04 - type_2
obj_13 obj_06 obj_05 obj_12 - type_3
obj_10 obj_07 obj_01 - object)
(:init
(pred_4 obj_02 obj_05)
(pred_2 obj_02 obj_08)
(pred_2 obj_02 obj_09)
(pred_4 obj_11 obj_05)
(pred_2 obj_11 obj_03)
(pred_2 obj_11 obj_04)
(pred_1 obj_10 obj_06)
(pred_1 obj_07 obj_13)
(pred_1 obj_01 obj_06)
)
(:goal
(and
(pred_1 obj_10 obj_06)
(pred_1 obj_07 obj_06)
(pred_1 obj_01 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_06)))
)
)