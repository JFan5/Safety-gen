(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_06 - type_1
obj_09 obj_14 obj_04 obj_03 - type_3
obj_02 obj_08 obj_10 obj_11 - type_2
obj_13 obj_05 obj_01 obj_12 - object)
(:init
(pred_4 obj_07 obj_02)
(pred_2 obj_07 obj_09)
(pred_2 obj_07 obj_14)
(pred_4 obj_06 obj_02)
(pred_2 obj_06 obj_04)
(pred_2 obj_06 obj_03)
(pred_3 obj_13 obj_11)
(pred_3 obj_05 obj_11)
(pred_3 obj_01 obj_10)
(pred_3 obj_12 obj_02)
)
(:goal
(and
(pred_3 obj_13 obj_08)
(pred_3 obj_05 obj_10)
(pred_3 obj_01 obj_02)
(pred_3 obj_12 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_10)))
)
)