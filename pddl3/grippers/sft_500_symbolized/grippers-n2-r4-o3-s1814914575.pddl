(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_10 - type_1
obj_11 obj_02 obj_12 obj_09 - type_2
obj_01 obj_07 obj_03 obj_08 - type_3
obj_05 obj_04 obj_06 - object)
(:init
(pred_1 obj_13 obj_07)
(pred_3 obj_13 obj_11)
(pred_3 obj_13 obj_02)
(pred_1 obj_10 obj_07)
(pred_3 obj_10 obj_12)
(pred_3 obj_10 obj_09)
(pred_2 obj_05 obj_03)
(pred_2 obj_04 obj_01)
(pred_2 obj_06 obj_01)
)
(:goal
(and
(pred_2 obj_05 obj_07)
(pred_2 obj_04 obj_03)
(pred_2 obj_06 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_03)))
)
)