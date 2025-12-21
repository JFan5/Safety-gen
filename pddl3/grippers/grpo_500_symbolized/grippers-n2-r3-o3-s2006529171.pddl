(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_09 - type_1
obj_07 obj_02 obj_01 obj_08 - type_3
obj_12 obj_04 obj_03 - type_2
obj_06 obj_11 obj_05 - object)
(:init
(pred_4 obj_10 obj_12)
(pred_2 obj_10 obj_07)
(pred_2 obj_10 obj_02)
(pred_4 obj_09 obj_03)
(pred_2 obj_09 obj_01)
(pred_2 obj_09 obj_08)
(pred_3 obj_06 obj_03)
(pred_3 obj_11 obj_04)
(pred_3 obj_05 obj_03)
)
(:goal
(and
(pred_3 obj_06 obj_12)
(pred_3 obj_11 obj_03)
(pred_3 obj_05 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_03)))
)
)