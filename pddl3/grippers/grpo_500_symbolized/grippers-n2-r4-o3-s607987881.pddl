(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_10 - type_1
obj_08 obj_12 obj_03 obj_06 - type_3
obj_04 obj_02 obj_13 obj_09 - type_2
obj_01 obj_05 obj_11 - object)
(:init
(pred_3 obj_07 obj_09)
(pred_4 obj_07 obj_08)
(pred_4 obj_07 obj_12)
(pred_3 obj_10 obj_13)
(pred_4 obj_10 obj_03)
(pred_4 obj_10 obj_06)
(pred_2 obj_01 obj_04)
(pred_2 obj_05 obj_09)
(pred_2 obj_11 obj_09)
)
(:goal
(and
(pred_2 obj_01 obj_13)
(pred_2 obj_05 obj_13)
(pred_2 obj_11 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_13)))
)
)