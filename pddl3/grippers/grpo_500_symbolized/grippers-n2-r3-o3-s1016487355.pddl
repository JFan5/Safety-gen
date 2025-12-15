(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_01 - type_1
obj_10 obj_08 obj_05 obj_04 - type_3
obj_09 obj_11 obj_02 - type_2
obj_12 obj_07 obj_03 - object)
(:init
(pred_3 obj_06 obj_11)
(pred_4 obj_06 obj_10)
(pred_4 obj_06 obj_08)
(pred_3 obj_01 obj_02)
(pred_4 obj_01 obj_05)
(pred_4 obj_01 obj_04)
(pred_2 obj_12 obj_02)
(pred_2 obj_07 obj_11)
(pred_2 obj_03 obj_09)
)
(:goal
(and
(pred_2 obj_12 obj_02)
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_06 obj_02)))
)
)