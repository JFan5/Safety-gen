(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_10 - type_1
obj_05 obj_04 obj_02 obj_12 - type_3
obj_09 obj_06 obj_03 - type_2
obj_01 obj_08 obj_11 - object)
(:init
(pred_3 obj_07 obj_06)
(pred_4 obj_07 obj_05)
(pred_4 obj_07 obj_04)
(pred_3 obj_10 obj_06)
(pred_4 obj_10 obj_02)
(pred_4 obj_10 obj_12)
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_06)
(pred_2 obj_11 obj_06)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_06)
(pred_2 obj_11 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_03)))
)
)