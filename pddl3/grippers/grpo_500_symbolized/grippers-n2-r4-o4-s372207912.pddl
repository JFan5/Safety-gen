(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_12 - type_1
obj_09 obj_13 obj_01 obj_14 - type_3
obj_04 obj_06 obj_02 obj_03 - type_2
obj_08 obj_11 obj_07 obj_05 - object)
(:init
(pred_4 obj_10 obj_02)
(pred_2 obj_10 obj_09)
(pred_2 obj_10 obj_13)
(pred_4 obj_12 obj_02)
(pred_2 obj_12 obj_01)
(pred_2 obj_12 obj_14)
(pred_3 obj_08 obj_04)
(pred_3 obj_11 obj_06)
(pred_3 obj_07 obj_02)
(pred_3 obj_05 obj_06)
)
(:goal
(and
(pred_3 obj_08 obj_04)
(pred_3 obj_11 obj_06)
(pred_3 obj_07 obj_03)
(pred_3 obj_05 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_03)))
)
)