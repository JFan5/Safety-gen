(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_3
obj_11 obj_02 obj_04 obj_09 - type_1
obj_06 obj_03 obj_12 - type_2
obj_01 obj_07 obj_08 - object)
(:init
(pred_2 obj_10 obj_12)
(pred_4 obj_10 obj_11)
(pred_4 obj_10 obj_02)
(pred_2 obj_05 obj_12)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_09)
(pred_3 obj_01 obj_12)
(pred_3 obj_07 obj_03)
(pred_3 obj_08 obj_12)
)
(:goal
(and
(pred_3 obj_01 obj_12)
(pred_3 obj_07 obj_06)
(pred_3 obj_08 obj_06)
)
)

(:constraints
  (always (not (pred_2 obj_10 obj_03)))
)
)