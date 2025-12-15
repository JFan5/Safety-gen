(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_14 - type_1
obj_02 obj_06 obj_12 obj_09 - type_3
obj_01 obj_11 obj_03 obj_05 - type_2
obj_10 obj_04 obj_13 obj_07 - object)
(:init
(pred_3 obj_08 obj_11)
(pred_4 obj_08 obj_02)
(pred_4 obj_08 obj_06)
(pred_3 obj_14 obj_05)
(pred_4 obj_14 obj_12)
(pred_4 obj_14 obj_09)
(pred_2 obj_10 obj_05)
(pred_2 obj_04 obj_01)
(pred_2 obj_13 obj_05)
(pred_2 obj_07 obj_05)
)
(:goal
(and
(pred_2 obj_10 obj_03)
(pred_2 obj_04 obj_05)
(pred_2 obj_13 obj_11)
(pred_2 obj_07 obj_01)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_03)))
)
)