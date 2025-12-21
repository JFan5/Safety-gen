(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_08 - type_1
obj_04 obj_09 obj_07 obj_11 - type_2
obj_02 obj_01 obj_03 - type_3
obj_05 obj_06 obj_12 - object)
(:init
(pred_1 obj_10 obj_01)
(pred_3 obj_10 obj_04)
(pred_3 obj_10 obj_09)
(pred_1 obj_08 obj_01)
(pred_3 obj_08 obj_07)
(pred_3 obj_08 obj_11)
(pred_2 obj_05 obj_01)
(pred_2 obj_06 obj_03)
(pred_2 obj_12 obj_03)
)
(:goal
(and
(pred_2 obj_05 obj_01)
(pred_2 obj_06 obj_02)
(pred_2 obj_12 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_10 obj_03)))
)
)