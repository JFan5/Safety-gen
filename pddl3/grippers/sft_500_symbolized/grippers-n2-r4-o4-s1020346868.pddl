(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_12 - type_1
obj_13 obj_01 obj_04 obj_02 - type_3
obj_06 obj_08 obj_03 obj_07 - type_2
obj_14 obj_09 obj_10 obj_11 - object)
(:init
(pred_4 obj_05 obj_06)
(pred_2 obj_05 obj_13)
(pred_2 obj_05 obj_01)
(pred_4 obj_12 obj_07)
(pred_2 obj_12 obj_04)
(pred_2 obj_12 obj_02)
(pred_3 obj_14 obj_03)
(pred_3 obj_09 obj_06)
(pred_3 obj_10 obj_06)
(pred_3 obj_11 obj_03)
)
(:goal
(and
(pred_3 obj_14 obj_06)
(pred_3 obj_09 obj_03)
(pred_3 obj_10 obj_07)
(pred_3 obj_11 obj_06)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_03)))
)
)