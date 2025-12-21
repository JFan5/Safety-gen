(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_1
obj_09 obj_11 obj_05 obj_12 - type_3
obj_07 obj_13 obj_08 obj_03 - type_2
obj_06 obj_04 obj_02 - object)
(:init
(pred_4 obj_10 obj_08)
(pred_2 obj_10 obj_09)
(pred_2 obj_10 obj_11)
(pred_4 obj_01 obj_03)
(pred_2 obj_01 obj_05)
(pred_2 obj_01 obj_12)
(pred_3 obj_06 obj_03)
(pred_3 obj_04 obj_08)
(pred_3 obj_02 obj_13)
)
(:goal
(and
(pred_3 obj_06 obj_03)
(pred_3 obj_04 obj_03)
(pred_3 obj_02 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_03)))
)
)