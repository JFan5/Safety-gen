(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_10 - type_1
obj_09 obj_11 obj_01 obj_07 - type_3
obj_13 obj_12 obj_02 obj_06 - type_2
obj_04 obj_08 obj_05 - object)
(:init
(pred_4 obj_03 obj_06)
(pred_2 obj_03 obj_09)
(pred_2 obj_03 obj_11)
(pred_4 obj_10 obj_06)
(pred_2 obj_10 obj_01)
(pred_2 obj_10 obj_07)
(pred_3 obj_04 obj_12)
(pred_3 obj_08 obj_02)
(pred_3 obj_05 obj_02)
)
(:goal
(and
(pred_3 obj_04 obj_02)
(pred_3 obj_08 obj_12)
(pred_3 obj_05 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_02)))
)
)