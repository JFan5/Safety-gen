(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_10 - type_1
obj_12 obj_04 obj_03 obj_07 - type_3
obj_09 obj_13 obj_08 obj_05 - type_2
obj_11 obj_01 obj_02 - object)
(:init
(pred_3 obj_06 obj_08)
(pred_4 obj_06 obj_12)
(pred_4 obj_06 obj_04)
(pred_3 obj_10 obj_13)
(pred_4 obj_10 obj_03)
(pred_4 obj_10 obj_07)
(pred_2 obj_11 obj_13)
(pred_2 obj_01 obj_09)
(pred_2 obj_02 obj_05)
)
(:goal
(and
(pred_2 obj_11 obj_09)
(pred_2 obj_01 obj_09)
(pred_2 obj_02 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_05)))
)
)