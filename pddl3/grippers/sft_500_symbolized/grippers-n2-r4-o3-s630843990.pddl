(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_03 - type_3
obj_13 obj_02 obj_08 obj_11 - type_1
obj_09 obj_12 obj_05 obj_10 - type_2
obj_07 obj_01 obj_06 - object)
(:init
(pred_1 obj_04 obj_09)
(pred_2 obj_04 obj_13)
(pred_2 obj_04 obj_02)
(pred_1 obj_03 obj_10)
(pred_2 obj_03 obj_08)
(pred_2 obj_03 obj_11)
(pred_4 obj_07 obj_09)
(pred_4 obj_01 obj_12)
(pred_4 obj_06 obj_09)
)
(:goal
(and
(pred_4 obj_07 obj_09)
(pred_4 obj_01 obj_05)
(pred_4 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_05)))
)
)