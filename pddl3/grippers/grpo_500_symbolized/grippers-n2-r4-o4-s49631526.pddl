(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_13 obj_04 obj_12 obj_06 - type_3
obj_10 obj_11 obj_03 obj_02 - type_2
obj_14 obj_09 obj_08 obj_01 - object)
(:init
(pred_3 obj_05 obj_02)
(pred_4 obj_05 obj_13)
(pred_4 obj_05 obj_04)
(pred_3 obj_07 obj_02)
(pred_4 obj_07 obj_12)
(pred_4 obj_07 obj_06)
(pred_2 obj_14 obj_11)
(pred_2 obj_09 obj_10)
(pred_2 obj_08 obj_10)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_14 obj_11)
(pred_2 obj_09 obj_02)
(pred_2 obj_08 obj_03)
(pred_2 obj_01 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_03)))
)
)