(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_08 - type_1
obj_09 obj_06 obj_12 obj_11 - type_3
obj_04 obj_07 obj_03 - type_2
obj_01 obj_10 obj_02 - object)
(:init
(pred_4 obj_05 obj_04)
(pred_2 obj_05 obj_09)
(pred_2 obj_05 obj_06)
(pred_4 obj_08 obj_07)
(pred_2 obj_08 obj_12)
(pred_2 obj_08 obj_11)
(pred_3 obj_01 obj_04)
(pred_3 obj_10 obj_07)
(pred_3 obj_02 obj_04)
)
(:goal
(and
(pred_3 obj_01 obj_03)
(pred_3 obj_10 obj_03)
(pred_3 obj_02 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_03)))
)
)