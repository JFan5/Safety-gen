(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_11 - type_1
obj_10 obj_07 obj_09 obj_06 - type_2
obj_12 obj_02 obj_04 - type_3
obj_05 obj_01 obj_08 - object)
(:init
(pred_3 obj_03 obj_04)
(pred_2 obj_03 obj_10)
(pred_2 obj_03 obj_07)
(pred_3 obj_11 obj_04)
(pred_2 obj_11 obj_09)
(pred_2 obj_11 obj_06)
(pred_4 obj_05 obj_02)
(pred_4 obj_01 obj_02)
(pred_4 obj_08 obj_02)
)
(:goal
(and
(pred_4 obj_05 obj_12)
(pred_4 obj_01 obj_12)
(pred_4 obj_08 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_02)))
)
)