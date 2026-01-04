(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_04 - type_3
obj_10 obj_09 obj_12 obj_11 - type_1
obj_05 obj_03 obj_13 obj_01 - type_2
obj_02 obj_06 obj_08 - object)
(:init
(pred_4 obj_07 obj_13)
(pred_1 obj_07 obj_10)
(pred_1 obj_07 obj_09)
(pred_4 obj_04 obj_13)
(pred_1 obj_04 obj_12)
(pred_1 obj_04 obj_11)
(pred_2 obj_02 obj_03)
(pred_2 obj_06 obj_05)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_03)
(pred_2 obj_06 obj_03)
(pred_2 obj_08 obj_05)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_03)))
)
)