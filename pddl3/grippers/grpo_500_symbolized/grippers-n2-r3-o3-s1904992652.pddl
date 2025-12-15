(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_1
obj_02 obj_10 obj_04 obj_03 - type_3
obj_09 obj_11 obj_05 - type_2
obj_06 obj_12 obj_08 - object)
(:init
(pred_3 obj_07 obj_09)
(pred_4 obj_07 obj_02)
(pred_4 obj_07 obj_10)
(pred_3 obj_01 obj_09)
(pred_4 obj_01 obj_04)
(pred_4 obj_01 obj_03)
(pred_2 obj_06 obj_05)
(pred_2 obj_12 obj_11)
(pred_2 obj_08 obj_05)
)
(:goal
(and
(pred_2 obj_06 obj_09)
(pred_2 obj_12 obj_11)
(pred_2 obj_08 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_05)))
)
)