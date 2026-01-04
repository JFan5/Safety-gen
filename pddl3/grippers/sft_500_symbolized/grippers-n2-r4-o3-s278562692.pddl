(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_2
obj_07 obj_08 obj_02 obj_04 - type_1
obj_01 obj_09 obj_13 obj_05 - type_3
obj_06 obj_12 obj_11 - object)
(:init
(pred_3 obj_10 obj_13)
(pred_2 obj_10 obj_07)
(pred_2 obj_10 obj_08)
(pred_3 obj_03 obj_13)
(pred_2 obj_03 obj_02)
(pred_2 obj_03 obj_04)
(pred_1 obj_06 obj_09)
(pred_1 obj_12 obj_05)
(pred_1 obj_11 obj_05)
)
(:goal
(and
(pred_1 obj_06 obj_05)
(pred_1 obj_12 obj_13)
(pred_1 obj_11 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_05)))
)
)