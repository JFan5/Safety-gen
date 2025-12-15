(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_04 - type_1
obj_10 obj_08 obj_01 obj_09 - type_3
obj_05 obj_12 obj_02 - type_2
obj_11 obj_03 obj_06 - object)
(:init
(pred_3 obj_07 obj_05)
(pred_4 obj_07 obj_10)
(pred_4 obj_07 obj_08)
(pred_3 obj_04 obj_02)
(pred_4 obj_04 obj_01)
(pred_4 obj_04 obj_09)
(pred_2 obj_11 obj_05)
(pred_2 obj_03 obj_05)
(pred_2 obj_06 obj_12)
)
(:goal
(and
(pred_2 obj_11 obj_05)
(pred_2 obj_03 obj_02)
(pred_2 obj_06 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_02)))
)
)