(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_06 - type_1
obj_01 obj_10 obj_05 obj_09 - type_3
obj_04 obj_12 obj_11 obj_03 - type_2
obj_08 obj_07 obj_14 obj_02 - object)
(:init
(pred_3 obj_13 obj_11)
(pred_4 obj_13 obj_01)
(pred_4 obj_13 obj_10)
(pred_3 obj_06 obj_12)
(pred_4 obj_06 obj_05)
(pred_4 obj_06 obj_09)
(pred_2 obj_08 obj_04)
(pred_2 obj_07 obj_03)
(pred_2 obj_14 obj_03)
(pred_2 obj_02 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_07 obj_04)
(pred_2 obj_14 obj_11)
(pred_2 obj_02 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_03)))
)
)