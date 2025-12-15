(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_09 - type_3
obj_01 obj_04 obj_12 obj_07 - type_1
obj_13 obj_02 obj_03 obj_11 - type_2
obj_08 obj_06 obj_10 - object)
(:init
(pred_3 obj_05 obj_13)
(pred_1 obj_05 obj_01)
(pred_1 obj_05 obj_04)
(pred_3 obj_09 obj_11)
(pred_1 obj_09 obj_12)
(pred_1 obj_09 obj_07)
(pred_2 obj_08 obj_13)
(pred_2 obj_06 obj_03)
(pred_2 obj_10 obj_11)
)
(:goal
(and
(pred_2 obj_08 obj_03)
(pred_2 obj_06 obj_11)
(pred_2 obj_10 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_03)))
)
)