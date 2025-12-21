(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_07 - type_1
obj_09 obj_08 obj_06 obj_04 - type_3
obj_13 obj_05 obj_03 obj_01 - type_2
obj_11 obj_14 obj_12 obj_02 - object)
(:init
(pred_4 obj_10 obj_13)
(pred_2 obj_10 obj_09)
(pred_2 obj_10 obj_08)
(pred_4 obj_07 obj_05)
(pred_2 obj_07 obj_06)
(pred_2 obj_07 obj_04)
(pred_3 obj_11 obj_03)
(pred_3 obj_14 obj_03)
(pred_3 obj_12 obj_03)
(pred_3 obj_02 obj_13)
)
(:goal
(and
(pred_3 obj_11 obj_05)
(pred_3 obj_14 obj_13)
(pred_3 obj_12 obj_01)
(pred_3 obj_02 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_03)))
)
)