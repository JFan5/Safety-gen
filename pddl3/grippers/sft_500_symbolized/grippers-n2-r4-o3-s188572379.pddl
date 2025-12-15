(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_13 - type_3
obj_09 obj_06 obj_07 obj_12 - type_1
obj_04 obj_05 obj_03 obj_08 - type_2
obj_10 obj_02 obj_11 - object)
(:init
(pred_2 obj_01 obj_08)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_06)
(pred_2 obj_13 obj_03)
(pred_3 obj_13 obj_07)
(pred_3 obj_13 obj_12)
(pred_1 obj_10 obj_04)
(pred_1 obj_02 obj_05)
(pred_1 obj_11 obj_05)
)
(:goal
(and
(pred_1 obj_10 obj_03)
(pred_1 obj_02 obj_03)
(pred_1 obj_11 obj_08)
)
)

(:constraints
  (always (not (pred_2 obj_01 obj_03)))
)
)