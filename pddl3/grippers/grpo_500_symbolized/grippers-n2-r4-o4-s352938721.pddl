(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_14 - type_1
obj_03 obj_07 obj_10 obj_06 - type_3
obj_11 obj_09 obj_02 obj_01 - type_2
obj_08 obj_12 obj_13 obj_04 - object)
(:init
(pred_4 obj_05 obj_11)
(pred_2 obj_05 obj_03)
(pred_2 obj_05 obj_07)
(pred_4 obj_14 obj_02)
(pred_2 obj_14 obj_10)
(pred_2 obj_14 obj_06)
(pred_3 obj_08 obj_01)
(pred_3 obj_12 obj_09)
(pred_3 obj_13 obj_11)
(pred_3 obj_04 obj_01)
)
(:goal
(and
(pred_3 obj_08 obj_01)
(pred_3 obj_12 obj_01)
(pred_3 obj_13 obj_02)
(pred_3 obj_04 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_02)))
)
)