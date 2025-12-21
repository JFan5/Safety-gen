(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_10 - type_1
obj_05 obj_09 obj_04 obj_08 - type_3
obj_01 obj_02 obj_12 - type_2
obj_03 obj_07 obj_06 - object)
(:init
(pred_4 obj_11 obj_12)
(pred_2 obj_11 obj_05)
(pred_2 obj_11 obj_09)
(pred_4 obj_10 obj_12)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_08)
(pred_3 obj_03 obj_02)
(pred_3 obj_07 obj_01)
(pred_3 obj_06 obj_12)
)
(:goal
(and
(pred_3 obj_03 obj_12)
(pred_3 obj_07 obj_02)
(pred_3 obj_06 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_02)))
)
)