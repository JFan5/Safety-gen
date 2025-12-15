(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_1
obj_09 obj_07 obj_11 obj_03 - type_3
obj_01 obj_06 obj_02 - type_2
obj_12 obj_08 obj_04 - object)
(:init
(pred_3 obj_10 obj_01)
(pred_4 obj_10 obj_09)
(pred_4 obj_10 obj_07)
(pred_3 obj_05 obj_01)
(pred_4 obj_05 obj_11)
(pred_4 obj_05 obj_03)
(pred_2 obj_12 obj_02)
(pred_2 obj_08 obj_02)
(pred_2 obj_04 obj_06)
)
(:goal
(and
(pred_2 obj_12 obj_06)
(pred_2 obj_08 obj_02)
(pred_2 obj_04 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_02)))
)
)