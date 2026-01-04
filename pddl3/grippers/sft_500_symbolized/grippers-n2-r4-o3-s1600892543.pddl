(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_03 - type_3
obj_02 obj_04 obj_11 obj_10 - type_1
obj_09 obj_13 obj_05 obj_06 - type_2
obj_08 obj_07 obj_01 - object)
(:init
(pred_2 obj_12 obj_13)
(pred_1 obj_12 obj_02)
(pred_1 obj_12 obj_04)
(pred_2 obj_03 obj_06)
(pred_1 obj_03 obj_11)
(pred_1 obj_03 obj_10)
(pred_4 obj_08 obj_05)
(pred_4 obj_07 obj_06)
(pred_4 obj_01 obj_09)
)
(:goal
(and
(pred_4 obj_08 obj_13)
(pred_4 obj_07 obj_06)
(pred_4 obj_01 obj_05)
)
)

(:constraints
  (always (not (pred_2 obj_12 obj_05)))
)
)