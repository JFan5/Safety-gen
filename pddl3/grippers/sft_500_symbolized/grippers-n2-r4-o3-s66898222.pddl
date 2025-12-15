(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_3
obj_13 obj_06 obj_04 obj_08 - type_2
obj_09 obj_03 obj_05 obj_02 - type_1
obj_01 obj_10 obj_11 - object)
(:init
(pred_1 obj_12 obj_03)
(pred_2 obj_12 obj_13)
(pred_2 obj_12 obj_06)
(pred_1 obj_07 obj_03)
(pred_2 obj_07 obj_04)
(pred_2 obj_07 obj_08)
(pred_4 obj_01 obj_09)
(pred_4 obj_10 obj_09)
(pred_4 obj_11 obj_03)
)
(:goal
(and
(pred_4 obj_01 obj_05)
(pred_4 obj_10 obj_09)
(pred_4 obj_11 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_05)))
)
)