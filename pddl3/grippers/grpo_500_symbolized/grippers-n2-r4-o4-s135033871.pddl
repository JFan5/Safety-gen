(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_13 - type_1
obj_01 obj_05 obj_11 obj_08 - type_3
obj_06 obj_09 obj_03 obj_02 - type_2
obj_04 obj_10 obj_14 obj_07 - object)
(:init
(pred_4 obj_12 obj_06)
(pred_2 obj_12 obj_01)
(pred_2 obj_12 obj_05)
(pred_4 obj_13 obj_09)
(pred_2 obj_13 obj_11)
(pred_2 obj_13 obj_08)
(pred_3 obj_04 obj_03)
(pred_3 obj_10 obj_06)
(pred_3 obj_14 obj_09)
(pred_3 obj_07 obj_06)
)
(:goal
(and
(pred_3 obj_04 obj_03)
(pred_3 obj_10 obj_03)
(pred_3 obj_14 obj_03)
(pred_3 obj_07 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_03)))
)
)