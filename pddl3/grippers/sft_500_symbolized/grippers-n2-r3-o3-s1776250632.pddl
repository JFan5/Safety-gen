(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_2
obj_06 obj_09 obj_07 obj_03 - type_1
obj_12 obj_05 obj_02 - type_3
obj_01 obj_04 obj_11 - object)
(:init
(pred_1 obj_10 obj_05)
(pred_2 obj_10 obj_06)
(pred_2 obj_10 obj_09)
(pred_1 obj_08 obj_12)
(pred_2 obj_08 obj_07)
(pred_2 obj_08 obj_03)
(pred_4 obj_01 obj_12)
(pred_4 obj_04 obj_12)
(pred_4 obj_11 obj_02)
)
(:goal
(and
(pred_4 obj_01 obj_05)
(pred_4 obj_04 obj_02)
(pred_4 obj_11 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_02)))
)
)