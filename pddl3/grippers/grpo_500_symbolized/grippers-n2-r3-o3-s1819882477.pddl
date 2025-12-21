(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_06 - type_1
obj_09 obj_11 obj_08 obj_05 - type_3
obj_07 obj_12 obj_03 - type_2
obj_04 obj_10 obj_01 - object)
(:init
(pred_4 obj_02 obj_07)
(pred_2 obj_02 obj_09)
(pred_2 obj_02 obj_11)
(pred_4 obj_06 obj_12)
(pred_2 obj_06 obj_08)
(pred_2 obj_06 obj_05)
(pred_3 obj_04 obj_03)
(pred_3 obj_10 obj_03)
(pred_3 obj_01 obj_03)
)
(:goal
(and
(pred_3 obj_04 obj_03)
(pred_3 obj_10 obj_12)
(pred_3 obj_01 obj_07)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_03)))
)
)